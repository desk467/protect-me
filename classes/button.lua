class = require 'hump.class'

Button = class{}
local scale = 1

function Button:init(img, x, y, onclick)
  self.img = love.graphics.newImage(img)
  self.x   = x 
  self.y   = y
  self.onclick = onclick
  
end

function Button:draw()
  love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, self.img:getWidth()/2, self.img:getHeight()/2)
end

function Button:mousereleased(x, y, button)
  onButtonX = (x >= self.x*scalex - self.img:getWidth()/2) and (x <= self.x*scalex + self.img:getWidth()/2)
  onButtonY = (y >= self.y*scaley - self.img:getHeight()/2) and (y <= self.y*scaley + self.img:getHeight()/2)
  
  if button == 'l' and onButtonX and onButtonY then
    self.onclick()
  end
  
end


