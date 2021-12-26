; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
; #SingleInstance ignore 
; #If WinActive("ahk_exe Studio One.exe")
#HotIf WinActive("ahk_exe Studio One.exe")

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
global this_program := "Studio One"
global xo := 0
global yo := 0

; -------------------------------------------------------------------------------------------
#vk46:: ; Win+F  - fullscreen
{

	if menu_toggle := !menu_toggle

		{
			handle := DllCall("GetMenu", "Ptr", WinActive("A"))

			DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", 0)
		
		WinSetStyle "-0x1c00000", "A" ; bordersline
			;~ WinSet, Style, -0x1c00000,  ;CAPTION|DLGFRAME|MAXIMIZE

			hMenu := handle

			WinMaximize
	return
		}
		else

		{
			DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", hMenu)
			WinSetStyle "+0x1c00000", "A" ; bordersline
			;~ WinSet, Style, +0x1c00000,  ;CAPTION|DLGFRAME|MAXIMIZE

			hMenu := 0

	WinRestore
			return
		}
	;~ WinSetStyle "^0x400000", "A" ; bordersline

	;~ WinSetStyle "^0xC00000", "A"
	;~ WinSetStyle "^0x80000", "A" ; Icon in Title
	;~ WinSetStyle "^0x40000", "A" ; Size change lines
	;~ WinSetStyle "^0x20000000", "A" ; Size change lines
}
#SuspendExempt False  ; Disable exemption for any hotkeys/hotstrings below this.
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; WinGetPos , , win_x, win_y, "A"

; -------------------------------------------------------------------------------------------
;~ :*:Piano::
^Enter:: ;Ctrl+Enter
{
	tempClip := Clipboard
	Send "^{vk41}" ;~ Ctrl+A
	Sleep 100

	Send "^{vk43}" ;~ Ctrl+C
	Sleep 100

	;~ track_name := WinGetText()
	track_name := Clipboard
	Clipboard := tempClip
	Send "{Enter}"
	;~ Buffer := BufferAlloc(ByteCount)
	;~ track_name := Buffer.Data
	If InStr(track_name, "Solo")||InStr(track_name, "Guitar")
		track_color := "64AABE"
	else If InStr(track_name, "FX")
		track_color := "AAD737"
	else If InStr(track_name, "Piano")||InStr(track_name, "MarkOne")||InStr(track_name, "Mark One")||InStr(track_name, "Electropiano")
		track_color := "3778B4"
	else If InStr(track_name, "Violin")||InStr(track_name, "Viola")||InStr(track_name, "Cello")||InStr(track_name, "Basses")||InStr(track_name, "String")
		track_color := "4BAA4B"
	else If InStr(track_name, "Flute")||InStr(track_name, "Clarinet")||InStr(track_name, "Oboe")||InStr(track_name, "Bassoon")||InStr(track_name, "Recorder")||InStr(track_name, "Wood")||InStr(track_name, "Backvocal")
		track_color := "EBCD32"
	else If InStr(track_name, "Trumpet")||InStr(track_name, "Horn")||InStr(track_name, "Trombon")||InStr(track_name, "Tuba")||InStr(track_name, "Brass")||InStr(track_name, "Voice Man")
		track_color := "D26932"
	else If InStr(track_name, "Choir")||InStr(track_name, "Glock")||InStr(track_name, "Marimba")||InStr(track_name, "Celesta")||InStr(track_name, "Organ")||InStr(track_name, "Harp")||InStr(track_name, "Voice")||InStr(track_name, "Voice Woman")
		track_color := "C84632"
	else If InStr(track_name, "Sub")||InStr(track_name, "Synth")||InStr(track_name, "Serum")||InStr(track_name, "Spire")||InStr(track_name, "Sylenth")||InStr(track_name, "Diva")||InStr(track_name, "Zebra")||InStr(track_name, "Bass"){
		track_color := "AF375A"
		Tooltip "None"
		Sleep 1000
		Tooltip
		}
	else If InStr(track_name, "Drums")||InStr(track_name, "Bamboo")||InStr(track_name, "Tambourine")||InStr(track_name, "Claps")||InStr(track_name, "Percussion")
		track_color := "784B87"
	else If InStr(track_name, "Hit")||InStr(track_name, "Crash")||InStr(track_name, "Kick")||InStr(track_name, "Snare")||InStr(track_name, "Splash")||InStr(track_name, "Hi-Hat")
		track_color := "5F3CA5"
	else {
		Tooltip "None"
		Sleep 1000
		Tooltip
		return
	}

	Copy_color(track_color)
}
;~ :*:Tambourine

; -------------------------------------------------------------------------------------------
; line1 := "Commands:`n"
; line2 := "`n"
; line3 := "CLONE ITEM - Hold LMB (drag) and Right click `n"
; line4 := "REMOVE ITEM - Hold RMB (drag) and Left click `n"
; line5 := "`n"
; line6 := "(for StudioOneX users only): `n"
; line7 := "COPY COLOR - Shift+Win+ Z`n"
; line8 := "PASTE COLOR - Shift+Win+ X`n"
; line9 := "`n"
; line10 := "AmelianceSkyMusic 2019`n"
; MsgBox 0, this_program, %line1%%line2%%line3%%line4%%line5%%line6%%line7%%line8%%line9%%line10%

; -------------------------------------------------------------------------------------------
;Del Instrumental Track
;~ !LButton:: 
;~ KeyWait "LButton", "U"
;~ KeyWait "LButton", "D T1"
;~ Send "{LButton}"
;~ Send "^+{vk54}"
;~ return

;~ ;Del Audio Track
;~ +LButton:: 
;~ KeyWait "LButton", "U"
;~ KeyWait "LButton", "D T1"
;~ Send "{LButton}"
;~ Send "+{vk54}"
;~ return

; -------------------------------------------------------------------------------------------

Copy_color(track_color) {
	;~ #+vk5A:: ;Win+Shift+Z
	MouseGetPos(&start_xpos, &start_ypos)
	send "{RButton}"
	Sleep 100
	send "{Up}"
	Sleep 100
	send "{Enter}"
	Sleep 100
	WinWait "Track Properties"
	MouseClick "left", 50, 125, 1, 1
	Send track_color
	send "{Enter}"
	Sleep 100
	send "{Enter}"
	Sleep 100
	MouseMove start_xpos, start_ypos, 1
	return
}



;Copy color
#+vk5A:: ;Win+Shift+Z
{
	MouseGetPos(&start_xpos, &start_ypos)
	Send "{RButton}"
	Send "{Up}"
	Sleep 100
	Send "{Enter}"
	WinWait "Track Properties"
	MouseClick "left", 50, 125, 1, 1
	Sleep 100
	send "^{vk43}"
	send "{Enter}"
	send "{Enter}"
	Sleep 100
	MouseMove start_xpos, start_ypos, 1
}

;Paste color
#+vk58:: ;Win+Shift+X
{
	MouseGetPos(&start_xpos, &start_ypos)
	send "{RButton}"
	send "{Up}"
	Sleep 100
	send "{Enter}"
	WinWait "Track Properties"
	MouseClick "left", 50, 125, 1, 1
	send "^{vk56}"
	send "{Enter}"
	send "{Enter}"
	Sleep 100
	MouseMove start_xpos, start_ypos, 1
}

; -------------------------------------------------------------------------------------------
;Automation fallow
#vk41:: ; ----- Win+A
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseClick "left", 70, 60, 1, 1
	Sleep 100
	WinWait "ahk_class CCLShadowDialogClass"
	MouseClick "left", 18, 195, 1, 1
	MouseClick "left", 70, 60, 1, 1
	Sleep 100
	SoundPlay "*-1, WAIT"
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
	send "{Esc}"
}

; -------------------------------------------------------------------------------------------
:*:Glock::Glockenspiel
:*:Tamb::Tambourine

; -------------------------------------------------------------------------------------------
;Duplicate ASM
~LButton & RButton::
{
	Send "{Alt down}"
	KeyWait "LButton"
	Send "{Alt up}"
}

; -------------------------------------------------------------------------------------------
;Del ASM
~RButton & LButton::
{
	Send "{LButton}"
	Send "{Delete}"
	Send "{Esc}"
}

; -------------------------------------------------------------------------------------------
;Purge all samples
^vkBD:: ; ----- Ctrl+-
{
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "KONTAKT"){
		MouseClick "left", 670, 100, 1, 1 ;Reset markers
		Sleep "100"
		MouseClick "left", 670, 395, 1, 1
		Sleep "100"
		Send "{Down}"
		Send "{Enter}"
		Sleep "100"
		MouseClick "left", 670+xo, 100+yo, 1, 1 
		Sleep "100"
		MouseClick "left", 670+xo, 395+yo, 1, 1
		Sleep "100"
		Send "{Down}"
		Send "{Down}"
		Send "{Down}"
		Send "{Enter}"
	}
	;~ If InStr(Title, "ReaScript Development Environment") {
		;~ Send "="
		;~ return
		;~ }
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

;Update sample pool
^vkBB:: ; ----- Ctrl+=
{
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "KONTAKT"){

		MouseClick "left", 670+xo, 100+yo, 1, 1 ;Update sample pool
		Sleep "100"
		MouseClick "left", 670+xo, 395+yo, 1, 1
		Sleep "100"
		Send "{Down}"
		Send "{Down}"
		Send "{Enter}"
	}

	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

; -------------------------------------------------------------------------------------------\
;Prev preset
vkBD:: ; ----- -
{
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "Absynth")
		MouseClick "left", 410+xo, 145+yo, 1, 1
	If InStr(Title, "Addictive Drums")
		MouseClick "left", 400+xo, 110+yo, 1, 1
	If InStr(Title, "ANA2")
		MouseClick "left", 520+xo, 115+yo, 1, 1
	If InStr(Title, "Analog Lab")
		MouseClick "left", 600+xo, 95+yo, 1, 1
	If InStr(Title, "Battery")
		MouseClick "left", 685+xo, 95+yo, 1, 1
	If InStr(Title, "Diva")
		MouseClick "left", 412+xo, 110+yo, 1, 1
	If InStr(Title, "DUNE 3")
		MouseClick "left", 568+xo, 140+yo, 1, 1
	If InStr(Title, "HIVE")
		MouseClick "left", 495+xo, 110+yo, 1, 1
	If InStr(Title, "Iris")
		MouseClick "left", 455+xo, 95+yo, 1, 1
	If InStr(Title, "KONTAKT")
		MouseClick "left", 640+xo, 170+yo, 1, 1
	If InStr(Title, "Legend")
		MouseClick "left", 785+xo, 110+yo, 1, 1
	If InStr(Title, "Massive")
		MouseClick "left", 602+xo, 104+yo, 1, 1
	If InStr(Title, "Massive X")
		MouseClick "left", 665+xo, 100+yo, 1, 1
	If InStr(Title, "Pigments")
		MouseClick "left", 530+xo, 95+yo, 1, 1
	If InStr(Title, "Repro-1")
		MouseClick "left", 438+xo, 140+yo, 1, 1
	If InStr(Title, "Repro-5")
		MouseClick "left", 444+xo, 134+yo, 1, 1
	If InStr(Title, "Serum")
		MouseClick "left", 690+xo, 100+yo, 1, 1 ;100
		;~ MouseClick "left", 620+xo, 95+yo, 1, 1 ;90
	If InStr(Title, "Spire")
		MouseClick "left", 294+xo, 108+yo, 1, 1
	If InStr(Title, "Sylenth1")
		MouseClick "left", 612+xo, 246+yo, 1, 1
	If InStr(Title, "SynthMaster2")
		MouseClick "left", 570+xo, 90+yo, 1, 1
	If InStr(Title, "TAL Sampler")
		MouseClick "left", 555+xo, 100+yo, 1, 1
	If InStr(Title, "Avenger")
		;~ MouseClick "left", 445+xo, 110+yo, 1, 1 ;100
		MouseClick "left", 312+xo, 100+yo, 1, 1 ;70
	If InStr(Title, "Zebra")
		MouseClick "left", 428+xo, 108+yo, 1, 1

	If InStr(Title, "Impact")
		MouseClick "left", 84+xo, 54+yo, 1, 1
	If InStr(Title, "Mai Tai")
		MouseClick "left", 84+xo, 54+yo, 1, 1
	If InStr(Title, "Mojito")
		MouseClick "left", 84+xo, 54+yo, 1, 1
	If InStr(Title, "Presence")
		MouseClick "left", 84+xo, 54+yo, 1, 1
	If InStr(Title, "SampleOne")
		MouseClick "left", 84+xo, 54+yo, 1, 1
	If InStr(Title, "ReaScript Development Environment"){
		Send "-"
		return
		}
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

;Next preset
vkBB:: ; ----- =
{
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "Absynth")
		MouseClick "left", 430+xo, 145+yo, 1, 1
	If InStr(Title, "Addictive Drums")
		MouseClick "left", 400+xo, 130+yo, 1, 1
	If InStr(Title, "ANA2")
		MouseClick "left", 536+xo, 115+yo, 1, 1
	If InStr(Title, "Analog Lab")
		MouseClick "left", 630+xo, 95+yo, 1, 1
	If InStr(Title, "Battery")
		MouseClick "left", 685+xo, 105+yo, 1, 1
	If InStr(Title, "Diva")
		MouseClick "left", 666+xo, 110+yo, 1, 1
	If InStr(Title, "DUNE 3")
		MouseClick "left", 590+xo, 140+yo, 1, 1
	If InStr(Title, "HIVE")
		MouseClick "left", 765+xo, 110+yo, 1, 1
	If InStr(Title, "Iris")
		MouseClick "left", 455+xo, 105+yo, 1, 1
	If InStr(Title, "KONTAKT")
		MouseClick "left", 660+xo, 170+yo, 1, 1
	If InStr(Title, "Legend")
		MouseClick "left", 795+xo, 110+yo, 1, 1
	If InStr(Title, "Massive")
		MouseClick "left", 602+xo, 122+yo, 1, 1
	If InStr(Title, "Massive X")
		MouseClick "left", 680+xo, 100+yo, 1, 1
	If InStr(Title, "Pigments")
		MouseClick "left", 560+xo, 95+yo, 1, 1
	If InStr(Title, "Repro-1")
		MouseClick "left", 684+xo, 140+yo, 1, 1
	If InStr(Title, "Repro-5")
		MouseClick "left", 674+xo, 134+yo, 1, 1
	If InStr(Title, "Serum")
		MouseClick "left", 710+xo, 100+yo, 1, 1 ;100
		;~ MouseClick "left", 640+xo, 95+yo, 1, 1 ;90
	If InStr(Title, "Spire")
		MouseClick "left", 330+xo, 108+yo, 1, 1
	If InStr(Title, "Sylenth1")
		MouseClick "left", 612+xo, 256+yo, 1, 1
	If InStr(Title, "SynthMaster2")
		MouseClick "left", 590+xo, 90+yo, 1, 1
	If InStr(Title, "TAL Sampler")
		MouseClick "left", 835+xo, 100+yo, 1, 1
	If InStr(Title, "Avenger")
		;~ MouseClick "left", 460+xo, 110+yo, 1, 1 ;100
		MouseClick "left", 322+xo, 100+yo, 1, 1 ;70
	If InStr(Title, "Zebra")
		MouseClick "left", 722+xo, 108+yo, 1, 1

	If InStr(Title, "Impact")
		MouseClick "left", 98+xo, 54+yo, 1, 1
	If InStr(Title, "Mai Tai")
		MouseClick "left", 98+xo, 54+yo, 1, 1
	If InStr(Title, "Mojito")
		MouseClick "left", 98+xo, 54+yo, 1, 1
	If InStr(Title, "Presence")
		MouseClick "left", 98+xo, 54+yo, 1, 1
	If InStr(Title, "SampleOne")
		MouseClick "left", 98+xo, 54+yo, 1, 1
	If InStr(Title, "ReaScript Development Environment") {
		Send "="
		return
		}
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

; -------------------------------------------------------------------------------------------
; Move active of window on 10px
#UP::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x,  win_y-10
}

#DOWN::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x,  win_y+10
}

#LEFT::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x-10,  win_y
}

#RIGHT::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x+10,  win_y
}

; Change size of active window on 10px
#+UP::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x, win_y-50, win_width,  win_height
}
#+DOWN::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x, win_y+50, win_width,  win_height
}
#+LEFT::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x-50, win_y, win_width,  win_height
}
#+RIGHT::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x+50, win_y, win_width,  win_height
}

#HOME::
{
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	;~ WinMove win_x, 0, win_width,  win_height
	WinMove (A_ScreenWidth/2)-(win_width/2), (A_ScreenHeight/2)-(win_height/2)
}

; Move mouse cursore of window on 1px
^#UP::
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos, start_ypos-1, 1
}

^#DOWN::
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos, start_ypos+1, 1
}

^#LEFT::
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos-1, start_ypos, 1
}

^#RIGHT::
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos+1, start_ypos, 1
}

; Move mouse cursore of window on 10px
^+#UP::
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos, start_ypos-10, 1
}

^+#DOWN::
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos, start_ypos+10, 1
}

^+#LEFT::
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos-10, start_ypos, 1
}

^+#RIGHT::
{
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos+10, start_ypos, 1
}
; -------------------------------------------------------------------------------------------


#^q::{
	; WM_SYSCOMMAND := 0x0112
	; SC_MINIMIZE := 0xF020
	; PostMessage WM_SYSCOMMAND, SC_MINIMIZE, 0,, "A"

	; MenuSelect "ahk_exe Studio One.exe", , "0&", "4&"

word := ComObjActive("Word.Application")
if !word
    MsgBox "Word isn't open."
else
    MsgBox word.ActiveDocument.FullName


}


;^Wheelup:: 
;send {Wheelup} 
;return

;^Wheeldown:: 
;send {Wheeldown}
;return
	
;Switches Alt+Wheelup with Wheelup 
;Wheelup:: 
;send ^+{Wheelup}^{Wheelup} 
;return

;Switches Alt+Wheeldown with Wheeldown 
;Wheeldown:: 
;send ^+{Wheeldown}^{Wheeldown} 
;return
