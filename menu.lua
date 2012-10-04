module(..., package.seeall)
local widget = require("widget")

function new()
	local background = display.newImage("assets/background.jpeg")
	
	local startButton = widget.newButton{
		label = "START",
		emboss = true,
		onRelease = onButtonEvent,
		font = "Bookman Old Style",
		defaultColor = { 255, 215, 0, 255 },
		left = background.width/5,
		top = background.height/2	
	}
end