local function getPlayers()
  local file = io.open('reto-5/mecenas.json', 'rb')
  local data = file:read('*all')
  file:close()

  local players = {}
  local index = 0
  for player in data:gmatch('"([%w%s%x.áàóí_\']+)"') do
    local row = {}
    row.name = player
    row.index = index
    table.insert(players, row)
    index = index + 1
  end
  return players
end

local function getSurvivors(players)
  local survivor = nil
  repeat
    for key, player in pairs(players) do
      if key == #players then
        table.remove(players, 1)
      else
        table.remove(players, key + 1)
      end
      survivor = player
    end
  until #players == 1
  return survivor
end

local M = {}
function M.solve()
  local players = getPlayers()
  local player = getSurvivors(players)
  return player.name..'-'..player.index
end

return M