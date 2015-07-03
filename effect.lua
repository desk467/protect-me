star = {}
speeds = {-2, 2}

for i = 1, 100, 1 do
  star[i] = {x = math.random(480), y = math.random(320), opacity = math.random(255), size = math.random(2), speed = speeds[math.random(2)]}
end


function star.draw()
  love.graphics.setColor(230,230,230)
  for i,v in ipairs(star) do
    love.graphics.setColor(255,255,255,v.opacity)
    love.graphics.circle("fill", v.x, v.y, v.size)
  end
end

function star.boundary()
  for i, v in ipairs(star) do
    if v.x < -v.size then v.x = 640 + v.size end
    if v.x > 640 + v.size then v.x = -v.size end
  end
end

function star.update(dt)
  star.boundary()
  for i,v in ipairs(star) do v.x = v.x + v.speed*dt end
end

return star

