Planet = require 'planet'
Player = require 'player'
Meteor = require 'meteor'

game = {}

local function sq(x) return math.pow(x, 2) end
best    = 0

function restart_level()
  terra   = Planet(176, 96, 'happy')
  player  = Player(240, 160) 
  sides   = {-33, 480 + 64}
  meteors = {}
  best    = math.max(score, best)
  
  math.randomseed(os.time())
  meteors[1] = Meteor('/res/img/meteoro.png', sides[math.random(2)], math.random(240))
  meteors[2] = Meteor('/res/img/meteoro.png', sides[math.random(2)], math.random(240))
  msg = ''
end



function game:init()
  restart_level()
end

function game:draw()
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(font.medium)
  love.graphics.print(score, 235, 20)
  
  terra:draw()
  bullet.draw()
  player:draw()
  for _,m in ipairs(meteors) do m:draw() end
  
  love.graphics.print(msg, 235, 250)
 
end

function game:update(dt)
  terra:update(dt)
  bullet.update(dt)
  player:update(dt)
    
  for i,m in ipairs(meteors) do
    m:update(dt)
    for _,b in ipairs(bullet) do
      local collide_with_bullet = sq(m.x - b.x) + sq(m.y - b.y) < sq( m.size + 2 );
      local meteor_on_screen = (m.x > 0 and m.x < 480 + m.size) and (m.y > 0 and m.y < 320 + m.size)
      if collide_with_bullet and meteor_on_screen then
        score = score + 1
        clear_bullets_table()
        meteors[i] = Meteor('/res/img/meteoro.png', sides[math.random(2)], math.random(240), 3)
      end
    end
    local collide_with_planet = (math.sqrt((240 - m.x)^2 + (160 - m.y)^2)) < 96
    local near_the_planet     = (math.sqrt((240 - m.x)^2 + (160 - m.y)^2)) < 128
    
    if near_the_planet then
      msg = 'perigo'
    end
    
    if collide_with_planet then
      Gamestate.switch(gameOver)
      restart_level()
    end
  end  
end

return game
