local function getData()
  local file = io.open('reto-3/colors.txt', 'rb')
  local data = file:read('*all')
  file:close()
  return data
end

local function getMaxCountColor(data)
  local colors = {}
  local count, maxCount = 0, 0
  local maxColor, lastColor = '', ''
  local nextColor = colors[2]

  for color in data:gmatch("'(%w+)'") do
    table.insert(colors, color)
  end

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
  return maxCount, maxColor
end

local M = {}
function M.solve()
  local data = getData()
  local maxCount, maxColor = getMaxCountColor(data)
  return maxCount..'@'..maxColor
end

return M