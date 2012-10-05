module(..., package.seeall)

local storyBoard = require( "storyboard" )
local widget = require("widget")
local menuScene = storyBoard.newScene()

-- local scene = storyboard.newScene()

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function menuScene:createScene( event )
	print("creating menu scene")
	
	local group = self.view
	
	
		local background = display.newImage("assets/background.jpeg")
		group:insert(background)
		
		local onButtonEvent = function (event )
			print("button has been clicked")		  
			--storyboard.gotoScene( "scene2", "fade", 400  )
		end
		
		local startButton = widget.newButton{
				label = "START",
				width = 150,
				height = 28,
				emboss = true,
				onRelease = onButtonEvent,
				font = "Bookman Old Style",
				defaultColor = { 255, 215, 0, 255 },
				left = display.contentWidth/2-75,
				top = display.contentHeight/2	
			}
		
		
			
		group:insert(startButton)
	
	
	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function menuScene:enterScene( event )

	print("Menu created, entering menu scene")
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function menuScene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function menuScene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

-- "createScene" event is dispatched if scene's view does not exist
menuScene:addEventListener( "createScene", menuScene )

-- "enterScene" event is dispatched whenever scene transition has finished
menuScene:addEventListener( "enterScene", menuScene )

-- "exitScene" event is dispatched before next scene's transition begins
menuScene:addEventListener( "exitScene", menuScene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
menuScene:addEventListener( "destroyScene", menuScene )

---------------------------------------------------------------------------------

return menuScene