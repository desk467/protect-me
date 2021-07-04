local Camera = require 'libs.hump.camera'

local Planet = require 'classes.planet'
local Player = require 'classes.player'
local Meteor = require 'classes.meteor'
local bullet

game = {}

local function sq(x) return math.pow(x, 2) end
best = 0
local current_max = 5
local meteor_speed = 60
local cam  = Camera(240, 160)

local function restart()
  dt = 1/60

  cam:zoomTo(1)
  cam:lookAt(240*scalex, 160*scaley)

  terra   = Planet(240, 160, 'happy')
  player  = Player(terra)
  sides   = {-33, 480 + 64}
  meteors = {}
  best    = math.max(score, best)

  math.randomseed(os.time())
  current_max  = 5
  meteor_speed = 60
  meteors[1] = Meteor(sides[math.random(2)], math.random(240), 3, meteor_speed)
  meteors[2] = Meteor(sides[math.random(2)], math.random(240), 3, meteor_speed)

  player:enableMovement()
  bullet = require 'bullet'

  score_back = love.graphics.newImage('/res/img/score_back.png')

end

function game:init()
  restart()
end

function game:draw()
  cam:draw(
    function ()
      love.graphics.setColor(255,255,255)
      terra:draw()
      bullet.draw()
      player:draw()
      for i,m in ipairs(meteors) do m:draw() end
    end
  )

  love.graphics.draw(score_back, 240, 5, 0, 0.5, 0.5, score_back:getWidth()/2, score_back:getHeight()/2)
  love.graphics.push()
  love.graphics.setFont(font.medium)
  love.graphics.setColor(0,0,0)
  w = font.medium:getWidth(score)
  love.graphics.print(score, 240 - w/2, 5)
  love.graphics.pop()
end

function game:update(dt)

  for i,m in ipairs(meteors) do

    for j,b in ipairs(bullet) do
      local collide_with_bullet = sq(m.x - b.x) + sq(m.y - b.y) < sq( m.size/2 + 2 );
      local meteor_on_screen = (m.x - m.size/2 > 0 and m.x < 480 + m.size) and (m.y - m.size/2> 0 and m.y < 320 + m.size)
      if collide_with_bullet and meteor_on_screen then
        m.life = m.life - 1
        table.insert(bullet.remove, j)
        clear_bullets_table()
      end
    end

    if m.life <= 0 then
      meteors[i] = Meteor(sides[math.random(2)], math.random(240), 3, meteor_speed)
      score = score + 1
    end

    if score > current_max then
      meteor_speed = meteor_speed + 15
      current_max = current_max + 10
    end


    local collide_with_planet = (math.sqrt((240 - m.x)^2 + (160 - m.y)^2)) < (terra.size/2 + m.size/2)
    local near_the_planet     = (math.sqrt((240 - m.x)^2 + (160 - m.y)^2)) < (terra.size/2 + m.size/2) + 24

    local not_much_near_the_planet = (math.sqrt((240 - m.x)^2 + (160 - m.y)^2)) < (terra.size/2 + m.size/2) + 64

    if not_much_near_the_planet then
      terra:changeFeeling('sad')
    else
      terra:changeFeeling('happy')
    end

    if near_the_planet then
      cam:zoomTo(2)
      cam:lookAt(480-(240/scalex) , 320-(160/scaley))
      dt = dt / 2.5
      player:disableMovement()
      m.life = 3
      terra:changeFeeling('sad')
    end

    if collide_with_planet then
      Gamestate.switch(gameOver)
      restart()
    end

  end

  for _,m in ipairs(meteors) do m:update(dt) end

  terra:update(dt)
  bullet.update(dt)
  player:update(dt)

end

return game
