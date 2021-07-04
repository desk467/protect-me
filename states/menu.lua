font   = require 'font'
button = require 'classes.button'
Gamestate = require 'libs.hump.gamestate'
count  = require 'states.go'
Planet = require 'classes.planet'
Moon   = require 'classes.moon'

menu = {}

function playGame()
  Gamestate.switch(count)
end

function showCredits()
  Gamestate.switch(credits)
end

local playButton    = Button('/res/img/play.png', 240, 290, playGame)
local creditsButton = Button('/res/img/creditsButton.png', 50, 290, showCredits)
local terra = Planet(240, 160, 'happy')
local lua   = Moon(terra)

function menu:draw()
  love.graphics.setFont(font.large)
  love.graphics.setColor(255,255,255,255)
  local w = font.large:getWidth("protect me")
  love.graphics.print("protect me", 240 - w/2, 30)

  love.graphics.setColor(255,255,255)
  terra:draw()
  lua:draw()
  playButton:draw()
  creditsButton:draw()

end

function menu:update(dt)
  lua:update(dt)
  terra:update(dt)
end

function menu:mousereleased(x,y,button, istouch)
  playButton:mousereleased(x,y,button)
  creditsButton:mousereleased(x,y,button)
end

return menu
