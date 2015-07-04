font   = require 'font'
button = require 'button'
Gamestate = require 'hump.gamestate'

menu = {}

function playGame()
  Gamestate.switch(count)
end


local playButton = Button('/res/img/play.png', 240, 250, playGame)

function menu:draw()
  love.graphics.setFont(font.large)
  love.graphics.setColor(255,255,255,255)
  love.graphics.print("protect me", 145, 100)
  
  love.graphics.setColor(255,255,255)  
  playButton:draw()
  
end

function menu:mousereleased(x,y,button)
  playButton:mousereleased(x,y,button)
end

return menu