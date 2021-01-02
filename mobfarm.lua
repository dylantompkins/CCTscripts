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

-- Main loop
while true do
    local response, reason = turtle.suck()
    if reason == "No space for items" then
        dropAll()
    end
    turtle.attack()
    sleep(1)
end