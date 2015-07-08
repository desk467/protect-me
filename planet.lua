class = require '/hump/class'
anim8 = require 'anim8'

Planet = class {}
local dir = 0.09
local time = 0

function Planet:init(x, y, feeling)
  self.feelings = {}
  self.feelings.happy  = love.graphics.newImage('/res/img/happy_anim.png')
  self.feelings.sad    = love.graphics.newImage('/res/img/sad.png')
  self.feelings.crying = love.graphics.newImage('/res/img/crying.png')
  
  self.x = x
  self.y = y
  self.feeling = feeling
  self.size = self.feelings.sad:getWidth()
  self.angle = 0
  
  self.g = anim8.newGrid(128, 121, self.feelings.happy:getWidth(), self.feelings.happy:getHeight())
  self.happy_anim = anim8.newAnimation(self.g('1-5',1), {2, 0.1,0.2,0.1,0.2})
  
end

function Planet:draw()
  if self.feeling == 'happy' then
    self.happy_anim:draw(self.feelings.happy, self.x, self.y, self.angle, 1, 1, self.size/2, self.size/2)
  end
  if self.feeling == 'sad' then
    love.graphics.draw(self.feelings.sad, self.x, self.y, self.angle, 1, 1, self.size/2, self.size/2)
  end
  if self.feeling == 'crying' then
    love.graphics.draw(self.feelings.crying, self.x, self.y, self.angle, 1, 1, self.size/2, self.size/2)
  end
end

function Planet:changeFeeling(feeling)
  self.feeling = feeling
end

function Planet:update(dt)
  self.happy_anim:update(dt)
  self.angle = self.angle + dir*dt
  time = time + dt;
  if time > 1 then
    dir = -dir
    time = 0
  end
end

return Planet