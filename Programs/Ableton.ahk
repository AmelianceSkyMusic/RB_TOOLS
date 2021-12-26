; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
; #SingleInstance ignore 
; #If WinActive("ahk_exe Studio One.exe")
#HotIf WinActive("ahk_exe Ableton Live 11 Suite.exe")

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
global this_program := "Ableton"
global xo := 0
global yo := 0


; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
{ 
; -------------------------------------------------------------------------------------------
:*:Glock::Glockenspiel
:*:Tamb::Tambourine

; -------------------------------------------------------------------------------------------
;Duplicate ASM
~LButton & RButton::
{
	Send "{Ctrl down}"
	KeyWait "LButton"
	Send "{Ctlr up}"
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
;Middle Mouse Button activates hand tool dragging. 
MButton:: 
{
	Send "{Ctrl down}{Alt down}{LButton down}"
	KeyWait "MButton"
	Send "{Ctrl up}{Alt up}{LButton up}"
}

; -------------------------------------------------------------------------------------------
;Fullscreen
!Enter::
{
	Send "{F11}"
}

; -------------------------------------------------------------------------------------------
;Clipeditor
F2::
{ 
	Send "{F12}"
}

; -------------------------------------------------------------------------------------------
;Clipeditor
F6::
{
	Send "^!{vk42}" ;Ctrl+Alt+B
} 

; -------------------------------------------------------------------------------------------
;Redo
^+vk5A:: ;Ctrl+Shift+Z
{
	Send "^{vk59}" ;Ctrl+Y
}

; -------------------------------------------------------------------------------------------
;Duplicate
d::  ;D
{
	Send "^{vk44}" ;Ctrl+D
}

; -------------------------------------------------------------------------------------------
;Horizontal zoom
^+Wheelup::
{
	Send "^{Wheelup}"
}

^+Wheeldown::
{
	Send "^{Wheeldown}"
}

; -------------------------------------------------------------------------------------------
;Home End
vkBC::  ;,
{
	Send "{Home}"
}

vkBE:: ;.
{
	Send "{End}"
}

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





/* ;Copy color
 * #+vk5A:: ;Win+Shift+Z
 * MouseGetPos(&start_xpos, &start_ypos)
 * Send "{RButton}"
 * Send "{Up}"
 * Sleep 100
 * Send "{Enter}"
 * WinWait "Track Properties"
 * MouseClick left, 50, 125, 1, 1
 * Sleep 100
 * send "^{vk43}"
 * send "{Enter}"
 * send "{Enter}"
 * Sleep 100
 * MouseMove start_xpos, start_ypos, 1
 * return
 * 
 * ;Paste color
 * #+vk58:: ;Win+Shift+X
 * MouseGetPos(&start_xpos, &start_ypos)
 * send "{RButton}"
 * send "{Up}"
 * Sleep 100
 * send "{Enter}"
 * WinWait "Track Properties"
 * MouseClick left, 50, 125, 1, 1
 * send "^{vk56}"
 * send "{Enter}"
 * send "{Enter}"
 * Sleep 100
 * MouseMove start_xpos, start_ypos, 1
 * return
 */

; -------------------------------------------------------------------------------------------
/* ;Automation fallow
 * #vk41:: ; ----- Win+A
 * MouseGetPos(&start_xpos, &start_ypos)
 * MouseClick left, 70, 60, 1, 1
 * Sleep 100
 * WinWait "ahk_class CCLShadowDialogClass"
 * MouseClick left, 18, 195, 1, 1
 * MouseClick left, 70, 60, 1, 1
 * Sleep 100
 * SoundPlay "*-1, WAIT"
 * MouseMove start_xpos, start_ypos, 1
 * Sleep "400"
 * send "{Esc}"
 * return
 */

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
}


; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"