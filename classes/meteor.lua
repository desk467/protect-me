class = require 'hump.class'
anim8 = require 'anim8'

Meteor = class {}

function Meteor:init(x, y, life, speed)
  self.x    = x
  self.y    = y
  self.lookAt   = math.atan2(160- self.y,  240- self.x)
  self.velocity = speed
  self.scale = 1
  self.life  = life
  self.where = self.x
  self.img  = love.graphics.newImage('/res/img/meteor_anim.png')
  self.g    = anim8.newGrid(64, 53, self.img:getWidth(), self.img:getHeight())
  self.meteor_anim = anim8.newAnimation(self.g('1-5',1), {2, 0.1,0.5,0.1,0.1})

  if self.where > 0 then
    self.meteor_anim = self.meteor_anim:flipV()
  end

  self.size = 64*self.scale
end

function Meteor:draw()
  self.meteor_anim:draw(self.img, self.x, self.y, self.lookAt, self.scale, self.scale, self.size/2, self.size/2)
end

function Meteor:update(dt)
  self.meteor_anim:update(dt)
  self.x = self.x + self.velocity * math.cos(self.lookAt) * dt
  self.y = self.y + self.velocity * math.sin(self.lookAt) * dt

end

return Meteor
