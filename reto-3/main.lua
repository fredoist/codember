local file = io.open('reto-3/colors.txt', 'rb')
local data = file:read('*all')
file:close()

local colors = {}
for color in data:gmatch("'(%w+)'") do
  table.insert(colors, color)
end

local count = 0
local maxCount = 0
local maxColor = ''
local lastColor = ''
local nextColor = colors[2]

for _, color in pairs(colors) do
  if color ~= nextColor or lastColor == color then
    count = 1
  end

  count = count + 1
  nextColor = lastColor
  lastColor = color

  if count > maxCount then
    maxCount = count
    maxColor = lastColor
  end
end

local M = {}
function M.solve()
  return maxCount..'@'..maxColor
end

return M