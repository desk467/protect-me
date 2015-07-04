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

function gameOver:draw()
  love.graphics.setFont(font.large)
  love.graphics.setColor(255,255,255)
  love.graphics.print("game over", 150, 40)
  
  love.graphics.setFont(font.medium)
  love.graphics.print("your final score: " .. score, 100, 150)
  love.graphics.print("best score: " .. best, 100, 200)
  
  restart:draw()
  backToMenu:draw()
end

function gameOver:mousereleased(x,y,button)
  restart:mousereleased(x,y,button)
  backToMenu:mousereleased(x,y,button)
end


return gameOver