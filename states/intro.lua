intro = {}

local time = 0
local logo = love.graphics.newImage('/res/img/logo.png')

function intro:draw()
  love.graphics.setBackgroundColor(255,255,255)
  love.graphics.draw(logo, 240, 160, 0, 1, 1, logo:getWidth()/2, logo:getHeight()/2)
end

function intro:update(dt)
  time = time + dt
  
  if time > 2 then
    Gamestate.switch(menu)
  end
end

return intro