local file = io.open('reto-2/encrypted.txt', 'rb')
local message = file:read('*all')
file:close()

local words = {}
for word in message:gmatch('%S+') do
  local n = 1
  local to = 0
  local letter = ''
  local value = ''
  for i = 1, #word do
    if n == 1 then
      letter = word:sub(1, 1)
    else
      n = n + 1
      letter = word:sub(n, n)
    end
    if letter == '1' then
      to = 2
    else
      to = 1
    end
    local char = word:sub(n, n + to)
    if tonumber(char) ~= nil then
      value = value..string.char(tonumber(char))
    end
    if i >= #word then
      n = 1
      table.insert(words, value)
    else
      n = n + to
    end
  end
end

local M = {}

function M.solve()
  local phrase = ''
  for _, v in pairs(words) do
    phrase = phrase..' '..v
  end
  return '$ submit'..phrase
end

return M