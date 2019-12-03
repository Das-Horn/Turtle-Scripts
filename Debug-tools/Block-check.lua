local air, block = turtle.inspect()
print("welcome here is the information about the block that the turtle is currently facing")
if air then
  print("The Blocks name is = "..block.name)
  print("The Blocks MetaData is = "..block.metadata)
else
  print("No block was detected")
end
while true do
  print( "Press E to continue." )

  local event, key = os.pullEvent( "key" ) -- limit os.pullEvent to the 'key' event

  if key == keys.e then -- if the key pressed was 'e'
    break
  end
end
