button = require 'button'

gameOver = {}

function restartGame()
  score = 0
  Gamestate.switch(count)
end

function backToMenuF()
  score = 0
  Gamestate.switch(menu)
end

local restart = Button('/res/img/play.png', 240, 290, restartGame)
local backToMenu = Button('/res/img/back.png', 50, 290, backToMenuF)
local terra = Planet(360, 160, 'crying')

function gameOver:draw()
  love.graphics.setFont(font.large)
  love.graphics.setColor(255,255,255)
  local w = font.large:getWidth("game over")
  love.graphics.print("game over", 240 - w/2, 20)
  
  love.graphics.setFont(font.medium)
  love.graphics.print("score: " .. score, 50, 120)
  love.graphics.print("best: " .. best, 50, 170)
  
  restart:draw()
  backToMenu:draw()
  terra:draw()
end

function gameOver:mousereleased(x,y,button)
  restart:mousereleased(x,y,button)
  backToMenu:mousereleased(x,y,button)
end

function gameOver:update(dt)
  terra:update(dt)
end


return gameOver