local Hx, Hy, Hz = 0, 0, 0
local Cx, Cy, Cz = 0, 0, 0
local Dx, Dy, Dz = 0, 0, 0
local Cdir = 0
local Ldir = 0

-- Get Destination Co-ords (begins setup of bot)

--Set Destination Co-ords
print("Welcome The Home co-ordinantes have been set. To continue you will have to input the RELATIVE Co-ords of the destination compared to the Co-ords the turtle's HOME co-ordinantes.")
print("You will be prompted to enter a value three times. These are the RELATIVE Destination Co-ords")

while true do
print("Please enter Dx: ")
stuff = tonumber(io.read())
while not stuff do
print("The value you enter must be numeric")
print("Please enter Dx: ")
stuff = tonumber(io.read())
end
if stuff then
Dx = stuff
end

print("Please enter Dy: ")
stuff = tonumber(io.read())
while not stuff do
print("The value you enter must be numeric")
print("Please enter Dy: ")
stuff = tonumber(io.read())
end
if stuff then
Dy = stuff
end

print("Please enter Dz: ")
stuff = tonumber(io.read())
while not stuff do
print("The value you enter must be numeric")
print("Please enter Dz: ")
stuff = tonumber(io.read())
end
if stuff then
Dz = stuff
end
	break
end

local Dist = Dx + Dy + Dz

fuelCheck()
invCheck()

print("All checks are posotive")

while true do
  print( "Press E to start construction." )
  
  local event, key = os.pullEvent( "key" ) -- limit os.pullEvent to the 'key' event
  
  if key == keys.e then -- if the key pressed was 'e'
    print( "starting..." )
    break
  end
end


--                                 Navigation



--                                 Construction

--                                 Checks

function fuelCheck() 
	print("Refueling")
	local req = Dist
	local Flvl = turtle.getFuelLevel()
	while Flvl < Dist do
		Flvl = turtle.getFuelLevel()
		for i=1,16 do
			turtle.select(i)
			if turtle.refuel(0) then
				turtle.refuel()
				break
			end
		end
		print("Failed to find any usable Fuel please add more.")
		os.pullEvent("turtle_inventory")
	end
end

-- For the inv check you will have to put the name of the item you would like to construct here 

function invCheck()
	print("Checking to make sure we have enough pipes.")
	local itemName = "insert name here"
	local itemCount = 0
	while itemCount < Dist do
		for i=1, 16 do
			local tempDet = turtle.getItemDetail(i)
			if itemName == tempDet.name then
				local tempCount = turtle.getItemCount(i)
				itemCount = itemCount + tempCount
			end
		end
		print("Failed to find any more of the specified pipe please add more.")
		os.pullEvent("turtle_inventory")
	end
end

--                                  Misc Functions

