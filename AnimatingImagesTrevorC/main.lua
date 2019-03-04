-- title:AnimatingImages
-- Name: TrevorC
-- Course: ICS2O/3C
-- This program Displays 3 Images one that fades in or fades out one 
--that moves diagonally and one that get bigger or smaller
display.setStatusBar(display.HiddenStatusBar)

scrollSpeed = 3

local backgroundImage = display.newImageRect("Images/Background.jpg", 2048, 1536)

local roger = display.newImageRect("Images/roger.png", 200, 200)

roger.alpha = 0

roger.x = 100
roger.y = display.contentHeight/3

local function moveRoger(event)
	roger.x = roger.x + scrollSpeed
	roger.alpha = roger.alpha + 0.005
	roger:rotate(-3)
end

Runtime:addEventListener("enterFrame", moveRoger)

local brian = display.newImageRect("Images/brian.png", 250, 250)

brian.alpha = 1

brian.x = 1024
brian.y = display.contentHeight/1.3

local function moveBrian(event)
	brian.x = brian.x - scrollSpeed
	brian.y = brian.y - 1
	brian:rotate(5)
end

Runtime:addEventListener("enterFrame", moveBrian)

local mrKrabs = display.newImageRect("Images/mrkrabs.png", 250, 250)

mrKrabs.alpha = 1

mrKrabs.xScale = 1
mrKrabs.yScale = 1

mrKrabs.x = 512
mrKrabs.y = display.contentHeight/4

local function moveMrKrabs(event)
	mrKrabs.y = mrKrabs.y + scrollSpeed
	mrKrabs.xScale = mrKrabs.xScale + 0.01
	mrKrabs.yScale = mrKrabs.yScale + 0.01
end

Runtime:addEventListener("enterFrame", moveMrKrabs)