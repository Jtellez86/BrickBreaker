display.setStatusBar(display.HiddenStatusBar)

local physics = require "physics" 
physics.start()
physics.setGravity(0,0)

--for collision debugging
physics.setDrawMode( "hybrid" )

local storyboard = require "storyboard"


print("--start--")
storyboard.gotoScene( "menuScene" )