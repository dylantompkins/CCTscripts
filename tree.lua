local block, blockTypes  = turtle.inspect();
logs = "minecraft:spruce_log"

function mineTree ()
    turtle.dig()
    turtle.forward()

    os.setComputerLabel("Digging Up")

    while true do
        if select(2, turtle.inspectUp()).name == logs then
            turtle.digUp()
            turtle.up()
        else
            break
        end
    end
    
    os.setComputerLabel("Returning to original position")

    while true do
        if turtle.detectDown() == false then
            turtle.down()
        else
            break
        end
    end

    turtle.back()
    os.setComputerLabel("Done")
end

if blockTypes.name == logs then
    os.setComputerLabel("Tree Present")
    mineTree()
else
    print(blockTypes.name)
    print('No tree present')
end