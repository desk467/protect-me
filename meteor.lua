class = require 'hump.class'

Meteor = class {}

function Meteor:init(img, x, y, life)
  self.img  = love.graphics.newImage(img)
  self.x    = x
  self.y    = y
  self.lookAt   = math.atan2(160- self.y,  240- self.x)
  self.velocity = 65
  self.scale = 1
  self.size = self.img:getWidth()*self.scale
  self.life = life
  
end

function Meteor:draw()
  love.graphics.draw(self.img, self.x, self.y, self.lookAt, self.scale, self.scale, self.size/2, self.size/2)
end

function Meteor:update(dt)
  self.x = self.x + self.velocity * math.cos(self.lookAt) * dt
  self.y = self.y + self.velocity * math.sin(self.lookAt) * dt
end

return Meteor