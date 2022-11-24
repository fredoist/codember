local start = 11098
local last = 98123

local function isValidPassword(password)
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

local function getPasswords()
  local passwords = {}
  for password = start, last do
    password = tostring(password)
    if isValidPassword(password) then
      table.insert(passwords, password)
    end
  end
  return passwords
end

local M = {}
function M.solve()
  local passwords = getPasswords()
  local total, correctPassword = #passwords, passwords[56]
  return total..'-'..correctPassword
end

return M
