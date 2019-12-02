print("welcome we will begin shortly")
sleep(3)
x, y, z = gps.locate(5)
print("The start co-ordinantes are x="..x.." y="..y.." z="..z..)
function begin()
fuelcheck()
cutt()
end
local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end
function fuelcheck()
  local l = turtle.getFuelLevel()
  local x1, y1, z1 = gps.locate(5)
  local x2 = x - x1
  local y2 = y - y1
  local z2 = z - z1
  local total = x2 + y2 + z2
  if l > total then
    print("Your fuel level is below optimal levels returning home...")
    home()
    print("feed me Avon. ;)")
    local v = 1
    local frst = true
    while l > 500 do
        local itm = turtle.getItemDetail()
        if itm.name == "coal" or itm.name == "Blaze Rod" or itm.name == "Charcoal" then
          turtle.refuel(1)
        elseif frst == true then
          turtle.select(v)
          frst = false
        else
          v = v + 1
          turtle.select(v)
        end
    end
  end
  continueCutting()
end
-- Function to return the turtle back to its home (turtle faces chest on return)
function home()
  print("returning home")
  local x3, y3, z3 = gps.locate(5)
  tz = z - z3
  local trs2 = trs
  while tz > 0 do
    turtle.down()
    tz = tz - 1
  end
  turtle.turnLeft()
  while trs2 > 0 do
    turtle.forward()
  end
  turtle.turnLeft()
  return
end
function continueCutting()
  turtle.turnLeft()
  local dst = 0
  local hght = 0
  while dst > trs do
    turtle.forward()
    dst = dst + 1
  end
  turtle.turnLeft()
  while hght < tz do
    turtle.up()
    hght = hght + 1
  end
  return
end
-- Functions to harvest trees begin here
function cutting()
  while turtle.detect() do
    turtle.dig()
    if turtle.detectUp() then
      turtle.digUp()
    end
    turtle.up()
    fuelcheck()
  end
  while not turtle.detect() and not turtle.detectDown() do
    turtle.down()
  end
  trs = trs + 1
  Print("total trees cut down is equal to = "..trs..)
  turtle.turnRight()
  turtle.forward()
  turtle.turnLeft()
  fuelcheck()
  if turtle.detect() then
    cutting()
  elseif not turtle.detect() then
    home()
  end
end
