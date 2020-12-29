-- CONFIG
local log = "minecraft:spruce_log"
local cap = "minecraft:cobblestone"

-- farm setup: one end has two chests stacked (bottom is coal, top is saplings), other end has one chest (logs mined)
-- place tutle on two chest end, facing one chest end
-- saplings will be planted on each side of row
-- turtle inventory: coal, saplings, logs in rest

-- TODO
-- - move and store position, goto rel pos
-- - check fuel level and return when necessary
-- - deposit logs every time we're at the end
-- - check for grown trees and chop down, replace sapling

-- Utility functions

-- Checks if block in front of turtle is the same as test
function isBlock(test, direction)
    os.setComputerLabel("isBlock")
    local block, blockType

    if direction == "up" then
        block, blockType = turtle.inspectUp();
    else
        if direction == "down" then
            block, blockType = turtle.inspectDown();
        else
            block, blockType = turtle.inspect();
        end
    end
    
    if block == true and blockType.name == test then
        return true
    else
        return false
    end
end

-- given turtle is facing bottom of tree trunk, mines tree and returns to original postion
function mineTree()
    os.setComputerLabel("mineTree")
    turtle.dig()
    turtle.forward()

    while true do
        if isBlock(log, "up") then
            turtle.digUp()
            turtle.up()
        else
            break
        end
    end
    
    while true do
        if turtle.detectDown() == false then
            turtle.down()
        else
            break
        end
    end

    turtle.back()
end

-- looks left and right for a tree. if there is a tree, call mineTree(). returns to original orientation
function checkSides()
    os.setComputerLabel("checkSides")
    turtle.turnLeft()
    if isBlock(log) then
        mineTree()
    end
    turtle.turnRight()
    turtle.turnRight()
    if isBlock(log) then
        mineTree()
    end
    turtle.turnLeft()
end

-- Main Loop
while true do
    if isBlock(cap) then
        turtle.turnRight()
        turtle.turnRight()
    end

    checkSides()

    turtle.forward()
end