#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force

SetMouseDelay, 75

EmoteLocationX := 470
EmoteLocationY := 50
ResolutionScaleX := [.53,.75, 1]
ResolutionScaleY := [.53,.75, 1]

EmoteList := ["pics\emote-mute-icon-only-768p.png","pics\emote-mute-icon-only-1080p.png","pics\emote-mute-icon-only-1440p.png"]

Emote := 1
imageVariation :=  75

BaseDelay := 500

if((A_ScreenWidth = 1366) && (A_ScreenHeight = 768))
	Resolution:=1
if((A_ScreenWidth = 1920) && (A_ScreenHeight = 1080))
	Resolution:=2
else if((A_ScreenWidth = 2560) && (A_ScreenHeight = 1440))
	Resolution:=3
else {
	msgbox, "Resolution not supported"

	ExitApp
	}		

myPassive := EmoteList[Resolution]

MouseX := EmoteLocationX*ResolutionScaleX[Resolution]
MouseY := EmoteLocationY*ResolutionScaleY[Resolution]

CurrentMouseX := 0
CurrentMouseY := 0
ImageSearch, FoundX, FoundY, 0,0, 0,0, %myPassive%
	if(ErrorLevel=2)
	{
		MsgBox, Path to Icon Image Not Found
		ExitApp
	}
	
while(true)
{
	sleep BaseDelay
	
	if(Resolution==1)
	ImageSearch, FoundX, FoundY, 230,10, 280,60, *%imageVariation% %myPassive%	
	
	else if(Resolution==2)
	ImageSearch, FoundX, FoundY, 330,20, 390,80, *%imageVariation% %myPassive%	
	
	else if(Resolution==3)
	ImageSearch, FoundX, FoundY, 440,20, 520,100, *%imageVariation% %myPassive%	
	

		if(ErrorLevel = 0) ;if match
		{
			;BlockInput, On
			MouseGetPos, CurrentMouseX , CurrentMouseY 
			Click %MouseX%, %MouseY%
			MouseMove, CurrentMouseX , CurrentMouseY  
			;BlockInput, Off
			;Msgbox, I see it!
			
		}
	
	;Msgbox, Still Working
		;Send {Click %MouseX%, %MouseY%, 0}
			;Click Down, EmoteLocationX*ResolutionScaleX[Resolution],  EmoteLocationY*ResolutionScaleY[Resolution]
			;Click Up, EmoteLocationX*ResolutionScaleX[Resolution],  EmoteLocationY*ResolutionScaleY[Resolution]
		
}


return
