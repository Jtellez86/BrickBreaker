module(..., package.seeall)

function create()
	
	local ball = display.newImage("assets/ball.png")
	physics.addBody(ball)
	ball.isBullet = true
	return ball
	
end