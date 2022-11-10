local reto1 = require('reto-1/main')

local solutions = { reto1 }

for i=1, #solutions do
  print('✅ Solución al reto no. '..i..':')
  print('\n\t'..solutions[i].solve())
end
