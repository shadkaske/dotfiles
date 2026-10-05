--!nonstrict
-- /tmux: pick a sesh session (tmux sessions, zoxide dirs, configs) and connect
-- in a new terminal.

local sessions = {}
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
  for i, name in sessions do
    -- keep sesh's order (attached tmux sessions first) when not filtering
    local score = 1000 - i
    if q ~= "" then
      score = noctalia.fuzzyScore(q, name)
    end
    if score then
      table.insert(results, { id = name, title = name, subtitle = "sesh connect", glyph = "terminal-2", score = score })
    end
  end
  if not loaded then
    table.insert(results, hint("Loading sessions…", "", "loader-2"))
  elseif #results == 0 then
    table.insert(results, hint("No matching sessions", "", "search-off"))
  end
  launcher.setResults(text, results)
end

local function refresh()
  noctalia.runAsync({ "sesh", "list" }, function(result)
    sessions = {}
    if result.exitCode == 0 then
      for line in string.gmatch(result.stdout, "[^\n]+") do
        local name = noctalia.string.trim(line)
        if name ~= "" then
          table.insert(sessions, name)
        end
      end
    end
    loaded = true
    render(lastQuery)
  end, 5000)
end

function onQuery(text)
  lastQuery = text
  if not noctalia.commandExists("sesh") then
    launcher.setResults(text, { hint("sesh is not installed", "Install sesh to use /tmux", "alert-triangle") })
    return
  end
  -- Reload the list each time the mode is opened (empty query); filter locally after.
  if noctalia.string.trim(text or "") == "" then
    loaded = false
    refresh()
  end
  render(text)
end

function onActivate(id)
  if type(id) == "string" and id ~= "" then
    noctalia.runInTerminal("sesh connect " .. shellQuote(id))
  end
end
