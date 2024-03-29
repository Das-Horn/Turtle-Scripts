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
    home()
    print("feed me Avon. ;)")
    local frst = 1
    while l < 100 + total do
      for i = 1, 16 do -- loop through the slots
        turtle.select(i) -- change to the slot
        if turtle.refuel(0) then -- if it's valid fuel
          local halfStack = math.ceil(turtle.getItemCount(i)/2) -- work out half of the amount of fuel in the slot
          turtle.refuel(halfStack)
          print("refueled. Fuel level is = " ..l )-- consume half the stack as fuel
          print("The total amount of fuel needed is = " ..total + 100)
          break
        else
        os.pullEvent("turtle_inventory")
      end
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
while true do
  print( "Press E to continue chopping wood." )

  local event, key = os.pullEvent( "key" ) -- limit os.pullEvent to the 'key' event

  if key == keys.e then -- if the key pressed was 'e'
    print( "Restarting the program now." )
    sleep(2)
    turtle.turnRight()
    turtle.turnRight()
    begin()
    break
  end
end
