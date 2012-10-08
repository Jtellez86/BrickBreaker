module(..., package.seeall)

local ceiling, leftWall, rightWall, floor
local background = display.newImage("assets/background.png")
local paddle = require("paddle")
local ball = require("ball")
local hasStarted = false

function setupGame()
	
	local gameDisplay = display.newGroup()
	 
	paddle = paddle.create()
	ball = ball.create()
	
	ball.x = paddle.x
	ball.y = paddle.y - ball.height
	
	addObjectsToDisplay(gameDisplay)
	setupWalls()
	
	background:addEventListener("touch", background)
	paddle:addEventListener("touch", dragPaddle)
	
	return gameDisplay
end


function background:touch(event)
	if(hasStarted == false) then
		if(event.phase == "began") then 	
		ball:applyForce(0, -.75, ball.x, ball.y)
		hasStarted = true
		end
	end
	return true
end

function dragPaddle( event )
        local target = event.target

 
        local phase = event.phase
        if "began" == phase then
              
			display.getCurrentStage():setFocus( target )
 
                -- Spurious events can be sent to the target, e.g. the user presses 
                -- elsewhere on the screen and then moves the finger over the target.
                -- To prevent this, we add this flag. Only when it's true will "move"
                -- events be sent to the target.
                target.isFocus = true
 
                -- Store initial position
                target.x0 = event.x - target.x
                
        elseif target.isFocus then
                if "moved" == phase then
                        -- Make object move (we subtract t.x0,t.y0 so that moves are
                        -- relative to initial grab point, rather than object "snapping").
                        target.x = event.x - target.x0
                        
                elseif "ended" == phase or "cancelled" == phase then
                        display.getCurrentStage():setFocus( nil )
                        target.isFocus = false
                end
        end
        return true
end

function addObjectsToDisplay(gameDisplay)
	gameDisplay:insert(background)
	gameDisplay:insert(paddle)
	gameDisplay:insert(ball)
	
end

function setupWalls()
	ceiling = display.newRect(0, 0, display.contentWidth, .75)
	leftWall = display.newRect(0, 0, .75, display.contentHeight)
	rightWall = display.newRect(display.contentWidth, 0, .75, display.contentHeight)
	
	physics.addBody(ceiling, "static", {bounce = 1})
	physics.addBody(leftWall, "static", {bounce = 1})
	physics.addBody(rightWall, "static", {bounce = 1})

end

-- function startGame()
-- 	
-- 	
-- end

