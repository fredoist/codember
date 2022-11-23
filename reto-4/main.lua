local start = 11098
local last = 98123

function VALIDATE(number)
  local password = tostring(number)
  if password:find('55') == nil then
    return false
  end
  for i = 1, #password - 1 do
    if password:sub(i, i) > password:sub(i + 1, i + 1) then
      return false
    end
  end
  return true
end

local passwords = {}
for i = start, last do
  if VALIDATE(i) then
    table.insert(passwords, i)
  end
end

local M = {}
function M.solve()
  return #passwords..'-'..passwords[56]
end

return M