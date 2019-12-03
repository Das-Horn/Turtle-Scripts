print("welcome when you have placed the items you would like to check in the iventory of the turtle.")
while true do
  print( "Press E to continue." )

  local event, key = os.pullEvent( "key" ) -- limit os.pullEvent to the 'key' event

  if key == keys.e then -- if the key pressed was 'e'
    for i=1,16 do

    end
    break
  end
end
