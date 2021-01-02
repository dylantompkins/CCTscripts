-- CONFIG
local dropTime = 60
local hitTime = 1

-- SETUP
-- Concentrate all mobs to be killed on on block.
-- Place Melee Turtle facing mobs
-- Place inventory for drops under the Turtle

-- Utility functions
function dropAll()
    for i = 1, 16, 1 do
        turtle.select(i)
        turtle.dropDown()
    end
end

function attack()
    turtle.attack()
    sleep(hitTime)
end

function checkTimer()
    local string = os.pullEvent(timerID)
    if string == "timer" then
        dropAll()
        os.startTimer(dropTime)
    end
end

-- Main loop
local timerID = os.startTimer(dropTime)
while true do
    checkTimer()
    attack()
end