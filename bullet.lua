local bullet = {}

bullet.velocity  = 150
bullet.remove = {}
bullet.size = 2

function bullet.spawn(x, y, direction)
  table.insert(bullet, {x = x, y = y + 4, direction = direction - math.rad(90)})
end

function bullet.draw()
  for i,v in ipairs(bullet) do
    love.graphics.setColor(255,0,0)
    love.graphics.circle("fill", v.x, v.y, bullet.size)
  end
end

function clear_bullets_table()
  for i, v in ipairs(bullet.remove) do
    table.remove(bullet, v)
  end
  bullet.remove = {} 
end

function bullet.update(dt)

  for i,v in ipairs(bullet) do
    v.x = v.x + bullet.velocity * math.cos(v.direction) * dt
    v.y = v.y + bullet.velocity * math.sin(v.direction) * dt

    if v.x > 800 + bullet.size or v.x < -bullet.size
         or v.y > 480 + bullet.size
         or v.y < -bullet.size then table.insert(bullet.remove, i) end
    
    clear_bullets_table()
  end
end

return bullet