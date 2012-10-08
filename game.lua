module(..., package.seeall)

local ceiling, leftWall, rightWall, floor
local background = display.newImage("assets/background.png")
local paddle = require("paddle")
local ball = require("ball")

function setupGame()
	
	local gameDisplay = display.newGroup()
	 
	paddle = paddle.create()
	ball = ball.create()
	
	ball.x = paddle.x
	ball.y = paddle.y - ball.height
	
	addObjectsToDisplay(gameDisplay)
	setupWalls()
	
	background:addEventListener("touch", background)
	
	return gameDisplay
end


function background:touch(event)
	if(event.phase == "began") then 	
		ball:applyForce(0, -.75, ball.x, ball.y)
	end

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

