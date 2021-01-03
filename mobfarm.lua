-- CONFIG
local dropTime = 15
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
    local event, completed = os.pullEvent()
    if event == "timer" and completed == timerID then
        print("Timer Fired: " .. os.clock())
        dropAll()
        timerID = os.startTimer(dropTime)
    end
end

-- Main loop
timerID = os.startTimer(dropTime)
while true do
    checkTimer()
end