-- Libs
Gamestate = require '/hump/gamestate'

star = require 'effect'

-- States
local menu   = require 'menu'
local config = require 'config'
local game   = require 'game'
local gameOver = require 'gameover'
local credits  = require 'credits'

-- CONSTANTS
local BG_COLOR = {30,30,30}

score = 0
high  = 0

function love.load()
  windowWidth  = 480
  windowHeight = 320

  if love.system.getOS() == "Android" then
    local x,y = love.window.getDimensions()
    scalex = (x/windowWidth)
    scaley = (y/windowHeight)
 else
    scalex = 1
    scaley = scalex
  end

  love.window.setMode(windowWidth*scalex,windowHeight*scaley)
  love.graphics.setDefaultFilter( 'nearest', 'nearest' )
  
  Gamestate.registerEvents()
  Gamestate.switch(menu)
end

function love.draw()
  love.graphics.scale(scalex,scaley)
  love.graphics.setBackgroundColor(BG_COLOR)
  star.draw()
  
  love.graphics.setFont(font.small)
  love.graphics.setColor(255,100,100)
  love.graphics.rectangle("fill", 390, 290, 90, 30)
  love.graphics.rectangle("fill", 0, 0, 70, 30)
  
  love.graphics.setColor(255,255,255)
  love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  love.graphics.print("alpha 0.2", 400, 300)
 
end

function love.update(dt)
  star.update(dt)
end

function love.keypressed(key)
  if key == "escape" then love.event.quit()  end
end
