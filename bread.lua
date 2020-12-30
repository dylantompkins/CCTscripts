-- CONFIG
local inv = "minecraft:chest"
local waitTime = 60
local wheat = "minecraft:wheat"
local seeds = "minecraft:wheat_seeds"
local bread = "minecraft:bread"

-- SETUP
-- inventories with wheat on left and right of turtle or just one side
-- inventory for seeds above
-- inventory in front of turtle for bread output
-- turtle inventory empty

-- Utility Functions

-- try to get wheat
function trySuck(slot)
    local success, table = turtle.inspect()
    if success == true and table.name == inv then
        turtle.select(slot)
        if turtle.suck() then
            if turtle.getItemDetail().name == wheat then
                return true
            else
                turtle.dropUp()
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

-- try to fill slot with wheat
function getWheat(slot)
    turtle.turnLeft()
    if trySuck(slot) then
        turtle.turnRight()
        return true
    else
        turn180()
        if trySuck(slot) then
            turtle.turnLeft()
            return true
        else
            turtle.turnLeft()
            return false
        end
    end
end

-- clear inventory after craft
function clear()
    turtle.turnLeft()
    for i = 1, 3, 1 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.turnRight()
end

-- craft bread then drop product and excess
function craft()
    turtle.select(4)
    turtle.craft()
    turtle.drop()
    clear()
end

-- turn twice
function turn180()
    turtle.turnRight()
    turtle.turnRight()
end

-- Main Loop
while true do
    local filled = 0
    while filled < 3 do
        if getWheat(filled + 1) then
            filled = filled + 1
        else
            sleep(waitTime)
        end
    end
    craft()
end