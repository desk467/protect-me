class = require 'hump.class'

Meteor = class {}

function Meteor:init(img, x, y)
  self.img  = love.graphics.newImage(img)
  self.x    = x
  self.y    = y
  self.lookAt   = math.atan2(160- self.y,  240- self.x)
  self.velocity = 1.5
  self.size = self.img:getWidth()/2
  
end

function Meteor:draw()
  love.graphics.draw(self.img, self.x, self.y, self.lookAt, 1, 1, 32, 32)
end

function Meteor:update(dt)
  self.x = self.x + self.velocity * math.cos(self.lookAt)
  self.y = self.y + self.velocity * math.sin(self.lookAt)
end

return Meteor