local file = io.open('reto-2/encrypted.txt', 'rb')
local message = file:read('*all')
file:close()

local words = {}
for word in message:gmatch('%S+') do
  local from = 1
  local to = 0
  local letter = ''
  local value = ''
  for i = 1, #word do
    if from == 1 then
      letter = word:sub(from, from)
    else
      from = from + 1
      letter = word:sub(from, from)
    end
    if letter == '1' then
      to = 2
    else
      to = 1
    end
    local char = word:sub(from, from + to)
    if tonumber(char) ~= nil then
      value = value..string.char(tonumber(char))
    end
    if i >= #word then
      from = 1
      table.insert(words, value)
    else
      from = from + to
    end
  end
end

local M = {}
function M.solve()
  local phrase = ''
  for _, word in pairs(words) do
    phrase = phrase..word..' '
  end
  return phrase
end

return M