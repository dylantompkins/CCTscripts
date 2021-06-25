----------------------------------------------------
-- Dig a 5x5 tunnel 50 blocks in depth
----------------------------------------------------

-- main digging action
function digRow()
    -- most of row
    for i = 1, 4, 1 do
        turtle.digUp()
        turtle.digDown()
        turtle.dig()
        turtle.forward()        
    end
    
    -- last column which doesn't require forward
    turtle.digUp()
    turtle.digDown()
end

-- transitions
function oneEighty()
    turtle.turnRight()
    turtle.turnRight()
end

function upAndDig()
    turtle.digUp()
    turtle.up()
end

function downAndDig()
    turtle.digDown()
    turtle.down()
end

function transUp()
    oneEighty()

    for i = 1, 3, 1 do
        upAndDig()
    end
end

function transDown()
    oneEighty()

    for i = 1, 3, 1 do
        downAndDig()
    end
end

function nextDepth()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnRight()
end

-- get into starting position
turtle.up()
turtle.dig()
turtle.forward()
turtle.turnRight()

-- main loop
for i = 1, 25, 1 do
    digRow()
    transUp()
    digRow()

    nextDepth()

    digRow()
    transDown()
    digRow()

    nextDepth()
end