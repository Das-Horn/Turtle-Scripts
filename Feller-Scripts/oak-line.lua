print("welcome we will begin shortly")
sleep(3)
local Hx, Hy = 0, 0
local Cx, Cy = 0, 0
local Lx, Ly = 0, 0
print("The co-ordinantes have been set ")
function begin()
fuelcheck()
cutting()
end
local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
  return
end
function fuelcheck()
  local b = 0
  local l = turtle.getFuelLevel()
  local total = Cx + Cy
  if l <= total then
    print("Your fuel level is below optimal levels returning home...")
    home()
    print("feed me Avon. ;)")
    local i = 1
    local v = 1
    local frst = 1
    while l > 100 + total do
      while i > 16 do
        b = 1
        local itm = turtle.getItemDetail(v)
        if itm.name == "coal" or itm.name == "Blaze Rod" or itm.name == "Charcoal" then
          turtle.refuel(1)
        elseif frst == 1 then
          turtle.select(1)
          frst = 0
        else
          v = v + 1
          turtle.select(v)
        end
      end
      os.pullEvent("turtle_inventory")
    end
  end
  if b == 1 then
    continueCutting()
  end
  return
end
-- Function to return the turtle back to its home (turtle faces chest on return)
function home()
  print("returning home")
  Lx, Ly = Cx, Cy
  while Cy > 0 do
    turtle.down()
    Cy = Cy - 1
  end
  turtle.turnLeft()
  while Cx > 0 do
    turtle.forward()
    Cx = Cx - 1
  end
  turtle.turnLeft()
  return
end
function continueCutting()
  turtle.turnLeft()
  while Cx < Lx do
    turtle.forward()
    Cx = Cx + 1
  end
  turtle.turnLeft()
  while Cy < Ly do
    turtle.up()
    Cy = Cy + 1
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
    Cy = Cy + 1
    fuelcheck()
  end
  while not turtle.detect() and not turtle.detectDown() do
    turtle.down()
    Cy = Cy - 1
    fuelcheck()
  end
  turtle.turnRight()
  turtle.forward()
  Cx = Cx + 1
  turtle.turnLeft()
  fuelcheck()
  if turtle.detect() then
    cutting()
  elseif not turtle.detect() then
    home()
  end
end
begin()
