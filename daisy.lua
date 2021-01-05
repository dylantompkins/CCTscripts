-- Config
-------------------------------------------------------


-------------------------------------------------------
-- Setup
-------------------------------------------------------


-------------------------------------------------------
-- Utility functions
-------------------------------------------------------

function around()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()

    turtle.forward()
    turtle.forward()
    turtle.turnLeft()

    turtle.forward()
    turtle.forward()
    turtle.turnLeft()

    turtle.forward()
    turtle.forward()
    turtle.turnLeft()

    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    turtle.turnLeft()
end

-------------------------------------------------------
-- Main loop
-------------------------------------------------------
around()