config = {}

function config:draw()
  love.graphics.setFont(font.medium)
  love.graphics.setColor(100,100,255)
  love.graphics.print("config", 10, 10)
end

return config
