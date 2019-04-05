-- Title: MathQuizTrevorC
-- Name: TrevorC
-- Course: ICS2O/3C
-- This program displays a math quiz

----------------------------------------------------
--Variables
----------------------------------------------------s
local questiobObject
local correctObject
local incorrectObject
local numericFeild
local randomNumber1
local randomNumber2
local randomnumber3
local randomnumber4
local randomnumber5
local randomnumber6
local userAnswer
local correctAnswer
local incorrectAnswer
local randomOperator
local score
local scoreText
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countdownTimer
local gameOver
local lives = 3
local heart1
local heart2
local heart3
local equals
local bkg
local loose = audio.loadSound("Images/loose.mp3")
local correctSound = audio.loadSound( "Images/right.mp3" )
local incorrectSound = audio.loadSound( "Images/wrong.mp3" )
local incorrectSoundChanel
local correctSoundChanel
local looseSoundChanel
--------------------------------------------------------
--SET STATUS BAR 
--------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)


----------------------------------------------------
--Local Functions
----------------------------------------------------

local function AskQuestion()

	randomOperator = math.random(1, 4)

	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)
	randomNumber3 = math.random(1, 10)
	randomNumber4 = math.random(1, 10)
	randomNumber5 = math.random(50, 100)
	randomNumber6 = math.random(1, 50)
	randomNumber7 = math.random(15, 30)
	randomNumber8 = math.random(10, 15)
	if (randomOperator == 1) then

		correctAnswer = randomNumber1 + randomNumber2

		questiobObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
		correctAnswer = randomNumber1 - randomNumber2

		questiobObject.text = randomNumber7 .. " - " .. randomNumber8 .. " = "

	elseif (randomOperator == 3) then
		correctAnswer = randomNumber3 * randomNumber4

		questiobObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = " 

	elseif (randomOperator == 4) then
		correctAnswer = randomNumber5 / randomNumber6

		questiobObject.text = randomNumber5 .. " / " .. randomNumber6 .. " = " 

	end
end 


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function UpdateTime()

	secondsLeft = secondsLeft - 1

	clockText.text = secondsLeft .. ""
	if (secondsLeft == 0) then
		secondsLeft = totalSeconds
		lives = lives - 1

		if (lives == 3) then
			heart3.isVisible = true
		elseif (lives == 2) then
			heart3.isVisible = false
		elseif (lives == 1) then
			heart2.isVisible = false
		elseif (lives == 0) then
			heart1.isVisible = false 
			clockText.isVisible = false
			gameOver.alpha = 1
			numericFeild.isVisible = false
			looseSoundChanel = audio.play(loose)
		end
	end
end


local function StartTimer()
	countdownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

local function ResetTimer()
	secondsLeft = 10
end


local function NumericFeildListener( event )

	if ( event.phase == "began" ) then

		event.target.text = ""

	elseif event.phase == "submitted" then

		userAnswer = tonumber(event.target.text)

		if (userAnswer == correctAnswer) then

			correctObject.isVisible = true
			scoreText.text = scoreText.text + 1
			correctSoundChanel = audio.play(correctSound)
			timer.performWithDelay(1000, HideCorrect) 
			ResetTimer()
		else 
			incorrectObject.isVisible = true
			incorrectSoundChanel = audio.play(incorrectSound)
			timer.performWithDelay(1000, HideIncorrect)
			ResetTimer()
		end
		event.target.text = ""
	end
end

--------------------------------------------
--Objects(Images, Text, Feild)
--------------------------------------------

bkg = display.newImageRect("Images/bkg1.png", 2048, 1536)

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 7 / 8
heart2.y = display.contentHeight * 1 / 7

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 6 / 8
heart1.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

score = display.newImageRect("Images/score.png", 100, 100)
score.x = display.contentWidth * 2 / 8
score.y = display.contentHeight * 1 / 7

equals = display.newImageRect("Images/equals.png", 100, 100)
equals.x = display.contentWidth * 3 / 8
equals.y = display.contentHeight * 1 / 7

questiobObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questiobObject:setTextColor(0.6, 0.7, 0.6)
questiobObject:setTextColor(1, .3, 0)

correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 100 )
correctObject:setTextColor(0.5, 0.3, 0.7)
correctObject.isVisible = false

incorrectObject = display.newText( "Incorrect:(", display.contentWidth/2, display.contentHeight*2/3, nil, 100 )
incorrectObject:setTextColor(0.3, 0.3, 1)
incorrectObject.isVisible = false

scoreText = display.newText( "0", display.contentWidth/2, display.contentHeight*2/3, nil, 100 )
scoreText.x = display.contentWidth * 4 / 8
scoreText.y = display.contentHeight * 1 / 7
scoreText:setTextColor(0.3, 0.3, 1)
scoreText.isVisible = true


numericFeild = native.newTextField( display.contentWidth/1.5, display.contentHeight/2, 350, 150)
numericFeild.inputType = "number"


clockText = display.newText ( "", display.contentWidth/2, display.contentHeight*10/12, nil, 100)

gameOver = display.newImageRect("Images/gameOver.png", 1000, 800)
gameOver.x = 520
gameOver.y = display.contentHeight/2
gameOver.alpha = 0
--------------------------------------------
--Listeners
--------------------------------------------

numericFeild:addEventListener( "userInput", NumericFeildListener )

--------------------------------------------
--Function Calls
--------------------------------------------

AskQuestion()
StartTimer()