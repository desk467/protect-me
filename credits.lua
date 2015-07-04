credits = {}

local function comeback()
  Gamestate.switch(menu)
end

local creditsText = love.graphics.newImage('/res/img/credits.png')
local back = Button('/res/img/back.png', 50, 290, comeback)

function credits:draw()
  love.graphics.draw(creditsText, 240,160, 0, 1, 1, creditsText:getWidth()/2, creditsText:getHeight()/2)
  back:draw()
end

function credits:mousereleased(x,y,button)
  back:mousereleased(x,y,button)
end

return credits
