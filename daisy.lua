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
    action()
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

-------------------------------------------------------
-- Main loop
-------------------------------------------------------
around(turtle.placeDown)