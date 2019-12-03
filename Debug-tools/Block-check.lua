local block = turtle.inspect()
print("welcome here is the information about the block that the turtle is currently facing")
if block then
  print("The Blocks name is = "..block.name)
  print("The Blocks MetaData is = "..block.id)
else
  print("No block was detected")
end
os.pullEvent("key")
