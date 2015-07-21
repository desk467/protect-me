-- Libs
Gamestate = require '/hump/gamestate'

star = require 'effect'

-- States
local intro  = require 'states.intro' 
local menu   = require 'states.menu'
local config = require 'states.config'
local count  = require 'states.go'
local game   = require 'states.game'
local gameOver = require 'states.gameover'
local credits  = require 'states.credits'

saving = require 'saving'

-- CONSTANTS
local bg = love.graphics.newImage('/res/img/bg.png')

score = 0
best  = saving.load()

function love.load()
  windowWidth  = 480
  windowHeight = 320

  if love.system.getOS() == "Android" or love.system.getOS() == "Windows App" then
    local x,y = love.window.getDimensions()
    scalex = (x/windowWidth)
    scaley = (y/windowHeight)
 
 else
    scalex = 1
    scaley = scalex
  end


  love.window.setMode(windowWidth*scalex,windowHeight*scaley)
  
  Gamestate.registerEvents()
  Gamestate.switch(intro)
end

function love.draw()
  love.graphics.scale(scalex,scaley)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(bg,0,0)
  star.draw()
  
  love.graphics.setFont(font.small)
  love.graphics.setColor(255,100,100)
  love.graphics.rectangle("fill", 390, 290, 90, 30)
  love.graphics.rectangle("fill", 0, 0, 70, 30)
  
  love.graphics.setColor(255,255,255)
  love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  love.graphics.print("alpha 0.3", 400, 300)
 
end

function love.update(dt)
  star.update(dt)
end

function love.quit()
    saving.save(best)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end