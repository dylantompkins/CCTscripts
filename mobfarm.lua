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

-- function checkTimer()
--     local string = os.pullEvent(timerID)
--     if string == "timer" then
--         dropAll()
--         timerID = os.startTimer(dropTime)
--     end
-- end

-- Main loop
timerID = os.startTimer(dropTime)
while true do
    local event, completed = os.pullEvent()
    if event == "timer" and completed == timerID then
        print("Timer Fired " .. os.clock())
        timerID = os.startTimer(dropTime)
    end
end