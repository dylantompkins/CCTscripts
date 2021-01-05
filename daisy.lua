-- Config
-------------------------------------------------------


-------------------------------------------------------
-- Setup
-------------------------------------------------------


-------------------------------------------------------
-- Utility functions
-------------------------------------------------------

function corner()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
end

function side()
    turtle.forward()
    turtle.forward()
    turtle.turnLeft()
end

function around()
    corner()
    side()
    side()
    side()
    corner()
    turtle.turnLeft()
end

-------------------------------------------------------
-- Main loop
-------------------------------------------------------
around()