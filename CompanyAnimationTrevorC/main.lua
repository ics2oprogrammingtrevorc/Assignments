-----------------------------------------------------------------------------------------
--Name: TrevorC
--Title: CompanyLogoAnimation
--COURSE: ICS2O
--This programs animates the company logo I created based on the one they drew
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------
--Global Variables
----------------------------------------------------
scrollSpeed = 3

----------------------------------------------------
--Local Variables
----------------------------------------------------
-- display company logo
local paw
paw = display.newImageRect("Images/CompanyLogo.png", 70, 70)
paw.x = 100
paw.y = display.contentHeight/1

-- make it invisible
paw.alpha = 0

----------------------------------------------------
--Global Functions
----------------------------------------------------
function stopPaw()
	Runtime:removeEventListener("enterFrame", movePaw)
	paw.x = display.contentCenterX
	paw.y = display.contentCenterY
end

function movePaw(event)
	paw.x = paw.x + scrollSpeed
	paw.y = paw.y - scrollSpeed
	-- fade in
	paw.alpha = paw.alpha + 0.02
	-- rotates
	paw:rotate(20.86)
	-- Makes it bigger
	paw.xScale = paw.xScale + 0.05
	paw.yScale = paw.yScale + 0.05
	if (paw.x >= display.contentCenterX) then
		stopPaw()
	end
end

----------------------------------------------------
--Event Listeners
----------------------------------------------------

Runtime:addEventListener("enterFrame", movePaw)
