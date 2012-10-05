module(..., package.seeall)

function setupGame()
	local gameDisplay = display.newGroup()
	
	local paddle = display.newImage("assets/paddle.png")
	return gameDisplay
end