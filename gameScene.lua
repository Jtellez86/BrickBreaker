module(..., package.seeall)

local storyBoard = require("storyboard")
local gameScene = storyBoard.newScene()
local game = require("game")

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function gameScene:createScene( event )
	print("creating game scene")
	
	local group = self.view		
end


-- Called immediately after scene has moved onscreen:
function gameScene:enterScene( event )

	print("setting up game")
	local group = self.view
	group:insert(game.setupGame())
	
	
	--then go into game loop
	-- game.startGame()
	
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function gameScene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function gameScene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

-- "createScene" event is dispatched if scene's view does not exist
gameScene:addEventListener( "createScene", gameScene )

-- "enterScene" event is dispatched whenever scene transition has finished
gameScene:addEventListener( "enterScene", gameScene )

-- "exitScene" event is dispatched before next scene's transition begins
gameScene:addEventListener( "exitScene", gameScene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
gameScene:addEventListener( "destroyScene", gameScene )

---------------------------------------------------------------------------------

return gameScene