credits = {}

function credits:draw()
  love.graphics.setFont(font.medium)
  love.graphics.setColor(100,100,255)
  love.graphics.print("credits", 10, 10)
end

return credits
