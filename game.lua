module(..., package.seeall)

local background = display.newImage("assets/background.png")
local paddle
local ball = require("ball")

function setupGame()
	
	local gameDisplay = display.newGroup()
	 
	paddle = display.newImage("assets/paddle.png")
	
	ball = ball.create()
	
	paddle.x = display.contentWidth/2
	paddle.y = 450
	
	ball.x = paddle.x
	ball.y = paddle.y - ball.height
	
	gameDisplay:insert(background)
	gameDisplay:insert(paddle)
	gameDisplay:insert(ball)
	
	background:addEventListener("touch", background)
	
	return gameDisplay
end


function background:touch(event)
	if(event.phase == "began") then 	
		ball:applyForce(0, -.5, ball.x, ball.y)
	end

end


-- function startGame()
-- 	
-- 	
-- end

