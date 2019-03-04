-- Title: DisplaysShapes
-- Name: TrevorC
-- Course: ICS2O/3C
-- This program Displays 3 shapes with different
-- colors and borders

display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background", 0.3, 0.7, 1)

local triangleX = 1/2 * display.contentWidth
local triangleY = 1/4 * display.contentHeight
local verticiesTriangle = {0, -125, 150, 125, -150, 125}
local triangle = display.newPolygon(triangleX, triangleY, verticiesTriangle)

local pentagonX = 1/4 * display.contentWidth
local pentagonY = 3/4 * display.contentHeight
local verticiesPentagon = {0, -125, 175, 0, 175, 125, -175, 125, -175, 0}
local pentagon = display.newPolygon(pentagonX, pentagonY, verticiesPentagon)

local hexagonX = 3/4 * display.contentWidth
local hexagonY = 3/4 * display.contentHeight
local verticiesHexagon = {-125, -125, 125, -125, 175, 0, 125, 125, -125, 125, -175, 0}
local hexagon = display.newPolygon(hexagonX, hexagonY, verticiesHexagon)

hexagon:setFillColor(1, 0.6, 0.7)
pentagon:setFillColor(0, 1, 0.7)
triangle:setFillColor(0.89, 0, 0,9)

hexagon.strokeWidth = 20
pentagon.strokeWidth = 20
triangle.strokeWidth = 20

hexagon:setStrokeColor(0, 0.3, 0.7)
pentagon:setStrokeColor(0.6, 0.9, 0)
triangle:setStrokeColor(0, 0, 1)

local textHexagon
local textPentagon
local textTriangle
local textsize = 35

textTriangle = display.newText("Triangle", 500, 350, Arial, textsize)
textPentagon = display.newText("Pentagon", 250, 730, Arial, textsize)
textHexagon = display.newText ("Hexagon", 775, 730, Arial, textsize)


