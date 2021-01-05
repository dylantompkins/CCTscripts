-- Config
-------------------------------------------------------


-------------------------------------------------------
-- Setup
-------------------------------------------------------


-------------------------------------------------------
-- Utility functions
-------------------------------------------------------

function corner(action)
    turtle.forward()
    action()
    turtle.turnLeft()
    turtle.forward()
    if select(2, turtle.inspectDown()).name ~= "botania:pure_daisy" then
        action()
    end
    turtle.turnLeft()
end

function side(action)
    turtle.forward()
    action()
    turtle.forward()
    action()
    turtle.turnLeft()
end

function around(action)
    corner(action)
    side(action)
    side(action)
    side(action)
    corner(action)
    turtle.turnLeft()
end

function deposit()
    turtle.forward()
    turtle.dropUp()
    turtle.back()
end

-------------------------------------------------------
-- Main loop
-------------------------------------------------------
while true do
    turtle.suckUp(8)
    around(turtle.placeDown)
    sleep(60)
    around(turtle.digDown)
    deposit()
end