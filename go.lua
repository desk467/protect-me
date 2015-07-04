go = {}

local cont
local time

local function reset()
  cont = 3
  time = 0
end


function go:init()
  reset()
end

function go:draw()
  love.graphics.setFont(font.really_bigger)
  love.graphics.setColor(255,200,50)
  love.graphics.print('' .. cont, 240, 140)
  love.graphics.setColor(255,255,255)
end

function go:update(dt)
  time = time + dt

  if cont ~= 0 and cont ~='Go!' then
    if time > 0.3 then
      cont = cont - 1
      time = 0
    end
  end
  
  if cont == 0 then cont = 'Go!' end
  if cont == 'Go!' then
    if time > 0.3 then
      Gamestate.switch(game)
      reset()
    end
  end
  
end

return go