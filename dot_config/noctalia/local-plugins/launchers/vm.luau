--!nonstrict
-- /vm: list libvirt VMs (qemu:///system); activating one makes sure the default
-- network and the VM are running, then opens its console in virt-manager.

local URI = "qemu:///system"
local vms = {}
local loaded = false
local lastQuery = ""

local function hint(title, subtitle, glyph)
  return { id = "", title = title, subtitle = subtitle, glyph = glyph }
end

local function shellQuote(s)
  return "'" .. string.gsub(s, "'", "'\\''") .. "'"
end

local function render(text)
  local q = noctalia.string.trim(text or "")
  local results = {}
  for _, vm in vms do
    local running = vm.state == "running"
    local score = running and 1000 or 0
    if q ~= "" then
      local s = noctalia.fuzzyScore(q, vm.name)
      score = s and (score + s) or nil
    end
    if score then
      table.insert(results, {
        id = vm.name,
        title = vm.name,
        subtitle = vm.state,
        glyph = running and "player-play" or "player-stop",
        score = score,
      })
    end
  end
  if not loaded then
    table.insert(results, hint("Loading VMs…", "", "loader-2"))
  elseif #results == 0 then
    table.insert(results, hint("No matching VMs", "", "search-off"))
  end
  launcher.setResults(text, results)
end

local function refresh()
  -- `virsh list --all` rows: " Id   Name   State" with Id "-" when shut off.
  noctalia.runAsync({ "virsh", "--connect", URI, "list", "--all" }, function(result)
    vms = {}
    if result.exitCode == 0 then
      for line in string.gmatch(result.stdout, "[^\n]+") do
        local id, name, state = string.match(line, "^%s*(%S+)%s+(%S+)%s+(.-)%s*$")
        if id and id ~= "Id" and not string.match(line, "^%s*%-%-") then
          table.insert(vms, { name = name, state = state })
        end
      end
    end
    loaded = true
    render(lastQuery)
  end, 10000)
end

function onQuery(text)
  lastQuery = text
  if not (noctalia.commandExists("virsh") and noctalia.commandExists("virt-manager")) then
    launcher.setResults(text, { hint("libvirt is not installed", "Install libvirt and virt-manager to use /vm", "alert-triangle") })
    return
  end
  if noctalia.string.trim(text or "") == "" then
    loaded = false
    refresh()
  end
  render(text)
end

function onActivate(id)
  if type(id) ~= "string" or id == "" then
    return
  end
  local vm = shellQuote(id)
  local virsh = "virsh --connect " .. URI
  local cmd = table.concat({
    `{virsh} net-list --name | grep -qx default || {virsh} net-start default`,
    `{virsh} domstate {vm} | grep -qx running || {virsh} start {vm}`,
    `exec virt-manager --connect={URI} --show-domain-console {vm}`,
  }, "; ")
  noctalia.runAsync(cmd)
end
