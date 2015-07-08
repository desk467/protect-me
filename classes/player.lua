class  = require 'hump.class'
bullet = require 'bullet'
anim8  = require 'anim8'

Player = class {}

local pressing = love.keyboard.isDown
local touch    = love.mouse.isDown
local scale    = 1
local time     = 0

function Player:init(x,y)
  self.x = x
  self.y = y
  self.direction = math.rad(90)
  self.img = love.graphics.newImage('/res/img/player_anim.png')
  self.velocity = 4
  self.move = true
  
  self.g = anim8.newGrid(32, 33, self.img:getWidth(), self.img:getHeight())
  self.player_anim = anim8.newAnimation(self.g('1-4', 1), 0.2)
end

function Player:draw()
  love.graphics.setColor(255,255,255)
  self.player_anim:draw(self.img, self.x, self.y, self.direction, 1, 1, 8, 100)
end

function Player:disableMovement() self.move = false end
function Player:enableMovement() self.move = true end

function Player:update(dt)
  local windowWidth  = love.graphics.getWidth()
  self.player_anim:update(dt)
  
  local px = math.floor(self.x + math.sin(self.direction) * 75)
  local py = math.floor(self.y + math.cos(self.direction)*-1 * 75)
  
  
  if (pressing("left") or (touch("l") and love.mouse.getX() < 240)) and self.move then
    self.direction = self.direction - self.velocity * dt
  end
  
  if (pressing("right") or (touch("l") and love.mouse.getX() > 240)) and self.move then
    self.direction = self.direction + self.velocity * dt
  end
  
  time = time + dt
  
  if time > 0.15 then
    bullet.spawn(px, py, self.direction)
    time = 0
  end
  
  if math.floor(math.deg(self.direction)) > 270 then self.direction  = math.rad(-90) end
  if math.floor(math.deg(self.direction)) < -90 then self.direction  = math.rad(270) end
  
end

return Player