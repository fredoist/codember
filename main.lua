local reto1 = require('reto-1/main')
local reto2 = require('reto-2/main')
local reto3 = require('reto-3/main')

local solutions = { reto1, reto2, reto3 }

for i = 1, #solutions do
  print('✅ Solución al reto no. '..i..': $ submit '..solutions[i].solve())
end
