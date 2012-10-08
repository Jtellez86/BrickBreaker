module(..., package.seeall)

function create()
	
	local paddle = display.newImage("assets/paddle.png")
	paddle.x = display.contentWidth/2
	paddle.y = 450
	
	physics.addBody(paddle, "static", {bounce = 1})
	ball.isBullet = true
	return paddle
	
end