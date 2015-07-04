class  = require 'hump.class'

Moon = class {}

function Moon:init(planet)
  self.x = planet.x
  self.y = planet.y
  self.direction = math.rad(90)
  self.img = love.graphics.newImage('/res/img/lua.png')
  self.velocity = -1
end

function Moon:draw()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(self.img, self.x, self.y, self.direction, 0.5, 0.5, self.img:getWidth()/2 + 160, self.img:getHeight()/2)
end

function Moon:update(dt)
  self.direction = self.direction - self.velocity * dt
end

return Moon