class = require '/hump/class'

Planet = class {}

function Planet:init(x, y, feeling)
  self.feelings = {}
  self.feelings.happy  = love.graphics.newImage('/res/img/happy.png')
  self.feelings.sad    = love.graphics.newImage('/res/img/sad.png')
  self.feelings.crying = love.graphics.newImage('/res/img/crying.png')
  
  self.x = x
  self.y = y
  self.feeling = feeling
end

function Planet:draw()
  if self.feeling == 'happy'  then love.graphics.draw(self.feelings.happy, self.x, self.y)  end
  if self.feeling == 'sad'    then love.graphics.draw(self.feelings.sad, self.x, self.y)    end
  if self.feeling == 'crying' then love.graphics.draw(self.feelings.crying, self.x, self.y) end
end

function Planet:update(dt)

end

return Planet