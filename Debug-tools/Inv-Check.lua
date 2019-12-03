print("welcome when you have placed the items you would like to check in the iventory of the turtle. This will take 16 seconds to complete")
while true do
  print( "Press E to continue." )

  local event, key = os.pullEvent( "key" ) -- limit os.pullEvent to the 'key' event

  if key == keys.e then -- if the key pressed was 'e'
    for i=1,16 do
      local data = turtle.getItemDetail(i)

      if data then
        print("Item name: ", data.name)
        print("Item damage value: ", data.damage)
        print("Item count: ", data.count)
      end
      sleep(1)
    end
    while true do
      print( "Press E to continue." )

      local event, key = os.pullEvent( "key" ) -- limit os.pullEvent to the 'key' event

      if key == keys.e then -- if the key pressed was 'e'
        break
      end
    end
    break
  end
end
local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
  return
end
