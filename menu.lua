font   = require 'font'
button = require 'button'
Gamestate = require 'hump.gamestate'
count = require 'go'

menu = {}

function playGame()
  Gamestate.switch(count)
end

function showCredits()
  Gamestate.switch(credits)
end

local playButton    = Button('/res/img/play.png', 240, 250, playGame)
local creditsButton = Button('/res/img/creditsButton.png', 50, 290, showCredits)

function menu:draw()
  love.graphics.setFont(font.large)
  love.graphics.setColor(255,255,255,255)
  love.graphics.print("protect me", 145, 100)
  
  love.graphics.setColor(255,255,255)  
  playButton:draw()
  creditsButton:draw()
  
end

function menu:mousereleased(x,y,button)
  playButton:mousereleased(x,y,button)
  creditsButton:mousereleased(x,y,button)
end

return menu