-- CONFIG
local dropTime = 15
local hitTime = 1

-- SETUP
-- Concentrate all mobs to be killed on on block.
-- Place Melee Turtle facing mobs
-- Place inventory for drops under the Turtle

-------------------------------------------------------
-- Utility functions
-------------------------------------------------------

-- Move all items in turtle inventory to chest below
function dropAll()
    for i = 1, 16, 1 do
        turtle.select(i)
        turtle.dropDown()
    end
end

-- Attack on an interval defined by hitTime
function attack()
    while true do
        turtle.attack()
        sleep(hitTime)
    end
end

-- Call dropAll on an interval defined by dropTime
function checkTimer()
    while true do
        local event, completed = os.pullEvent()
        if event == "timer" and completed == timerID then
            dropAll()
            timerID = os.startTimer(dropTime)
        end
    end
end

-------------------------------------------------------
-- Main loop
-------------------------------------------------------

-- start the first timer
timerID = os.startTimer(dropTime)

-- run both loops asynchronously
parallel.waitForAny(attack, checkTimer)