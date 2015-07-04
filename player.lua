class  = require 'hump.class'
bullet = require 'bullet'

Player = class {}

local pressing = love.keyboard.isDown
local touch    = love.mouse.isDown
local scale    = 1
local time     = 0

function Player:init(x,y)
  self.x = x
  self.y = y
  self.direction = math.rad(90)
  self.img = love.graphics.newImage('/res/img/player.png')
  self.velocity = 4
  self.move = true
end

function Player:draw()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(self.img, self.x, self.y, self.direction, 0.5, 0.5, 8, 170)
end

function Player:disableMovement() self.move = false end
function Player:enableMovement() self.move = true end

function Player:update(dt)
  local windowWidth  = love.graphics.getWidth()
  
  local px = math.floor(self.x + math.sin(self.direction) * 75)
  local py = math.floor(self.y + math.cos(self.direction)*-1 * 75)
  
  
  if pressing("left") and self.move then
    self.direction = self.direction - self.velocity * dt
  end
  
  if pressing("right") and self.move then
    self.direction = self.direction + self.velocity * dt
  end
    
  local lookAt = math.floor(90 + math.deg(math.atan2(love.mouse.getY() - self.y,  love.mouse.getX() - self.x)))
  
  if touch("l") and not (lookAt == math.floor(math.deg(self.direction))) then -- Precisa melhorar
    if lookAt < math.deg(self.direction) then
      self.direction = self.direction - self.velocity * dt
    else
      self.direction = self.direction + self.velocity * dt
    end
  end
  
  time = time + dt
  
  if time > 0.15 then
    bullet.spawn(px, py, self.direction)
    time = 0
  end
  
  if math.floor(math.deg(self.direction)) > 270  then self.direction = math.rad(-90) end
  if math.floor(math.deg(self.direction)) < -90 then self.direction  = math.rad(270) end
  
end

return Player