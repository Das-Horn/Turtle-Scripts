while true do

local Hx, Hy = 0, 0
local Cx, Cy = 0, 0
local Lx, Ly = 0, 0
local amt = 0

function begin()
  initialCheck()
  startFarm()
end

function initialCheck()
local Flvl = turtle.getFuelLevel()
  while Flvl > 100 do
    Flvl = turtle.getFuelLevel()
    print("Feed me Daddy. ;)")
    os.pullEvent("turtle_inventory")
    for i = 1, 16 do -- loop through the slots
      turtle.select(i) -- change to the slot
      if turtle.refuel(0) then -- if it's valid fuel
        local halfStack = math.ceil(turtle.getItemCount(i)/2) -- work out half of the amount of fuel in the slot
        turtle.refuel(halfStack) -- consume half the stack as fuel
      end
    end
  end
  return
end

function startFarm()
  -- Here we make sure that the turtle is facing the correct direcion
  for i=1,4 do
    local block = turtle.inspect()
    if block.name ~= "minecraft:sugarcane" then
      print("The name of the block that I am facing is "..block.name)
      turtle.turnLeft()
      i = i + 1
      if i == 4 then
        print("error couldn't find any sugar cane adjacant to the turtle")
      end
    else
      phase01()
    end
  end
end

function phase01()
  turtle.up()
  turtle.up()
  Cy = Cy + 2
  --Top level harvest
  while turtle.detect() do
    turtle.dig()
    amt = amt + 1
    turtle.turnLeft()
    turtle.forward()
    Cx = Cx + 1
    turtle.turnRight()
  end
  phase02()
end

function phase02()
  turtle.down()
  Cy = Cy - 1
  -- y 2 harvest
  while Cx > 0 do
    turtle.dig()
    amt = amt + 1
    turtle.turnRight()
    turtle.forward()
    Cx = Cx - 1
    turtle.turnLeft()
  end
  turtle.down()
  Cy = Cy -1
  turtle.turnRight()
  turtle.turnRight()
  --Item Dump
  for i=1,16 do
    turtle.select(i)
    turtle.dump()
  end
end

function refuelCheck()
  local total = Cx + Cy
  local lvl = turtle.getFuelLevel()
  if lvl <= total then
    home()
  for i = 1, 16 do -- loop through the slots
    turtle.select(i) -- change to the slot
    if turtle.refuel(0) then -- if it's valid fuel
      local halfStack = math.ceil(turtle.getItemCount(i)/2) -- work out half of the amount of fuel in the slot
      turtle.refuel(halfStack) -- consume half the stack as fuel
    end
  end
end
print("Refueled and ready to go restart the program to go again when the cane is ready")
end

function home()
Lx, Ly = Cx, Cy
while Cy > 0 do
  turtle.down()
  Cy = Cy - 1
end
turtle.turnRight()
while Cx > 0 do
  turtle.forward()
  Cx = Cx + 1
end
turtle.turnRight()
end

function Cont()
turtle.turnlRight()
while Cx < Lx do
turtle.forward()
Cx = Cx + 1
end
turtle.turnRight()
while Cy < Ly do
turtle.up()
Cy = Cy + 1
end
return
end

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
  return
end

begin()

sleep(900)

end
