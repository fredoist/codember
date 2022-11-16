local db = {}
for row in io.lines('reto-1/users.txt') do
  table.insert(db, row)
end
table.insert(db, '')

local records = {}
local record = ''
for _, row in pairs(db) do
  if row ~= '' and db[#db+1] ~= '' then
    record = record..' '..row
  else
    table.insert(records, record)
    record = ''
  end
end

local users = {}
local params = {'usr', 'eme', 'psw', 'age', 'loc', 'fll'}
local count = 0
for _, user in pairs(records) do
  for _, param in pairs(params) do
    if string.find(user, param) then
      count = count + 1
    end
  end
  if count == #params then
    table.insert(users, user)
  end
  count = 0
end

local M = {}
function M.solve()
  local total = #users
  local user = string.match(users[#users], '@%w+')
  return '$ submit '..total..user
end

return M