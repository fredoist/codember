local function getMessageData()
  local file = io.open('reto-2/encrypted.txt', 'rb')
  local data = file:read('*all')
  file:close()
  return data
end

local function decryptMessage(message)
  local words, phrase = {}, ''
  for word in message:gmatch('%S+') do
    local from, to = 1, 0
    local letter, value = '', ''
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
      char = tonumber(char)
      if char ~= nil then
        value = value..string.char(char)
      end
      if i >= #word then
        from = 1
        table.insert(words, value)
      else
        from = from + to
      end
    end
  end
  for _, word in pairs(words) do
    phrase = phrase..word..' '
  end
  return phrase
end

local M = {}
function M.solve()
  local data = getMessageData()
  local message = decryptMessage(data)
  return message
end

return M