local db = {}
for row in io.lines('reto-1/users.txt') do
  db[#db+1] = row
end
-- insert an empty line at the end for the loop below
table.insert(db, '')

local users = {}
local user = ''
for _, value in pairs(db) do
  if value ~= '' and db[#db+1] ~= '' then
    user = user..' '..value
  else
    users[#users+1] = user
    user = ''
  end
end

-- todo: find a better manner to find valid users without using multiples if
local valids = {}
local params = 'usr: eme: psw: age: loc: fll:'
for _, value in pairs(users) do
  if string.find(value, 'usr:') and string.find(value, 'eme:') and string.find(value, 'psw:') and string.find(value, 'age:') and string.find(value, 'loc:') and string.find(value, 'fll:') then
    table.insert(valids, value)
  end
end

print('Total de usuarios: '..#valids..'; último usuario valido: '..valids[#valids])