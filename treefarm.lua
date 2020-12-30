-- CONFIG
local log = "minecraft:spruce_log"
local sapling = "minecraft:spruce_sapling"
local cap = "minecraft:cobblestone"
local saplingSlot = 1
local startOfLogs = 2
local chest = "storagedrawers:spruce_full_drawers_1"

-- FARM SETUP:
-- one end has 2 inventories,
-- bottom where logs will be dropped and
-- top where saplings will be dropped and sucked,
-- other end has a cap

-- INSTRUCTIONS:
-- place tutle anywhere between inventories and cap
-- saplings will be planted on each side of row
-- place fuel in inventory

-- TODO
-- - move and store position, goto rel pos
-- - check fuel level and refuel when necessary
-- - deposit logs every time we're at the end
-- - check for grown trees and chop down, replace sapling
-- - configurable wait between passes
-- - add check for changes on github

-- Utility functions

-- Set turtle label as fuel then msg
function setLabel(msg)
    if msg ~= nil then
        os.setComputerLabel(turtle.getFuelLevel() .. " | " .. msg)
    else
        os.setComputerLabel("Fuel Level: " .. turtle.getFuelLevel())
    end
end

-- Checks if block in front of turtle is the same as test
function isBlock(test, direction)
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
    setLabel("Mining Tree")
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
    turtle.select(saplingSlot)
    turtle.place()
end

-- looks left and right for a tree. if there is a tree, call mineTree(). returns to original orientation
function checkSides()
    setLabel("Checking Sides")
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

-- Uses up logs in inventory to fuel until it is full
function refuel()
    setLabel("Refueling")
    for i = startOfLogs, 16, 1 do
        if turtle.getFuelLevel() < turtle.getFuelLimit() then
            turtle.select(i)
            turtle.refuel();
        end
    end
end

-- Gets up to 1 stack of saplings in sapling slot
function restock()
    setLabel("Restocking")
    turtle.up()
    turtle.select(saplingSlot)
    turtle.suck()
    turtle.down()
end

-- 
function deposit()
    setLabel("Depositing")
    for i = 1, 16, 1 do
        turtle.select(i)

        if turtle.getItemDetail.name == nil then
            -- do nothing
        elseif turtle.getItemDetail().name == log then
            turtle.drop()
        elseif turtle.getItemDetail().name == sapling then
            turtle.up()
            turtle.drop()
            turtle.down()
        end
    end
end

function turn180()
    setLabel("Turning Around")
    turtle.turnRight()
    turtle.turnRight()
end

function onChest()
    refuel()
    deposit()
    restock()
    turn180()
end

-- Main Loop
while true do
    if turtle.getFuelLevel == 0 then
        refuel()
    end

    if isBlock(cap) then
        turn180()
    end

    if isBlock(chest) then
        onChest()
    end

    checkSides()

    turtle.forward()
end