-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created By: Amin Zeina
-- Created On: Apr 2018
--
-- Testing touch events
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

-- Touch for left button

local leftButton = display.newImage( "./assets/sprites/shootButton.png" )
leftButton.x = display.contentCenterX - 300
leftButton.y = display.contentCenterY
leftButton.id = "Left Button"
 
local function onLeftButtonTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

leftButton:addEventListener( "touch", onLeftButtonTouched )


-- Touch for right button

local clickButton = display.newImage( "./assets/sprites/clickButton.png" )
clickButton.x = display.contentCenterX + 300
clickButton.y = display.contentCenterY
clickButton.id = "ball object"
 
function clickButton:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

clickButton:addEventListener( "touch", clickButton )