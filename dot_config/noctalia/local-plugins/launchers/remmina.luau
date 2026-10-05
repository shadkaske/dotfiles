--!nonstrict
-- /rdp: open Remmina, its preferences, a new connection, or a saved profile.

local byId = {}

local function hint(title, subtitle, glyph)
  return { id = "", title = title, subtitle = subtitle, glyph = glyph }
end

-- Remmina keeps profiles in datadir_path from remmina.pref, else its XDG data dir.
local function profileDir()
  local pref = noctalia.readFile("~/.config/remmina/remmina.pref")
  if pref then
    local dir = string.match(pref, "\ndatadir_path=([^\n]+)") or string.match(pref, "^datadir_path=([^\n]+)")
    if dir and noctalia.string.trim(dir) ~= "" then
      return noctalia.string.trim(dir)
    end
  end
  return "~/.local/share/remmina"
end

local function profiles()
  local list = {}
  local dir = profileDir()
  local files = noctalia.listDir(dir) or {}
  for _, file in files do
    if string.sub(file, -8) == ".remmina" then
      local path = noctalia.expandPath(dir .. "/" .. file)
      local contents = noctalia.readFile(path)
      if contents then
        local name = string.match(contents, "\nname=([^\n]*)")
        local server = string.match(contents, "\nserver=([^\n]*)") or ""
        local protocol = string.match(contents, "\nprotocol=([^\n]*)") or ""
        if name and name ~= "" then
          table.insert(list, { name = name, server = server, protocol = protocol, path = path })
        end
      end
    end
  end
  table.sort(list, function(a, b) return a.name:lower() < b.name:lower() end)
  return list
end

function onQuery(text)
  local q = noctalia.string.trim(text or "")
  byId = {}

  if not noctalia.commandExists("remmina") then
    launcher.setResults(text, { hint("Remmina is not installed", "Install remmina to use /rdp", "alert-triangle") })
    return
  end

  local results = {}
  local function add(id, argv, title, subtitle, glyph, base)
    local score = base
    if q ~= "" then
      local s = noctalia.fuzzyScore(q, title .. " " .. subtitle)
      if not s then return end
      score = base + s
    end
    byId[id] = argv
    table.insert(results, { id = id, title = title, subtitle = subtitle, glyph = glyph, score = score })
  end

  for i, p in profiles() do
    local detail = table.concat({ p.protocol, p.server }, " · ")
    add("profile:" .. i, { "remmina", "-c", p.path }, p.name, detail, "screen-share", 1000)
  end
  add("main", { "remmina" }, "Main Window", "Open Remmina", "app-window", 0)
  add("new", { "remmina", "--new" }, "New Connection", "Create a Remmina profile", "plus", 0)
  add("prefs", { "remmina", "-p", "0" }, "Preferences", "Remmina settings", "settings", 0)

  launcher.setResults(text, results)
end

function onActivate(id)
  local argv = byId[id]
  if argv then
    noctalia.runAsync(argv)
  end
end
