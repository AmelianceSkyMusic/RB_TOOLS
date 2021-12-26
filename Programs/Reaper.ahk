;# Win   ! Alt   ^ Ctrl   + Shift

#HotIf WinActive("ahk_exe Reaper.exe") and not WinActive("ahk_class #32770")



; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
is_suspended := false
this_program := "Reaper"
xo := 0
yo := -55

rp := {}
rp.name := "Reaper"
rp.xo := 0
rp.yo := -55
;;;;; Вообще идет привязка к окну, но можно сделать что бы привязывалось к началу плагина? Я как-то это делал раньше в телеграме

#Enter::{
	try {
		loop 10 {
			WinActivate("About REAPER")
			Sleep 1000
		}
	} catch Error as err {
		Msg("Window not found")
	}
}
; ; -------------------------------------------------------------------------------------------
; ;Save track template ASM
; #!S::  ; Win+Alt+S
; Send "{LButton}"
; Send "{LButton}"
; Send "^c"
; Send "!#s"
; Send "^v"
; Send "{Home}"
; Send "{Space}"
; Send "{Home}"
; return

; ; -------------------------------------------------------------------------------------------
; :*:Glock::Glockenspiel
; :*:Tamb::Tambourine

; ; -------------------------------------------------------------------------------------------
; ;Duplicate ASM
; ~LButton & RButton:: 
; Send "{Alt down}"
; KeyWait "LButton"
; Send "{Alt up}"
; return

; ; -------------------------------------------------------------------------------------------
; ;Del ASM
; ~RButton & LButton:: 
; Send "{LButton}"
; Send "{Delete}"
; Send "{Esc}"
; return

; ; -------------------------------------------------------------------------------------------
; ;Purge all samples
; ^vkBD:: ; ----- Ctrl+-
; MouseGetPos start_xpos, start_ypos
; Title := WinGetTitle("A")
; If InStr(Title, "KONTAKT"){
; 	MouseClick left, 670, 100, 1, 1 ;Reset markers
; 	Sleep "100"
; 	MouseClick left, 670, 395, 1, 1
; 	Sleep "100"
; 	Send "{Down}"
; 	Send "{Enter}"
; 	Sleep "100"
; 	MouseClick left, 670+xo, 100+yo, 1, 1 
; 	Sleep "100"
; 	MouseClick left, 670+xo, 395+yo, 1, 1
; 	Sleep "100"
; 	Send "{Down}"
; 	Send "{Down}"
; 	Send "{Down}"
; 	Send "{Enter}"
; }
; ;~ If InStr(Title, "ReaScript Development Environment") {
; 	;~ Send "="
; 	;~ return
; 	;~ }
; MouseMove start_xpos, start_ypos, 1
; Sleep "400"
; return

; ;Update sample pool
; ^vkBB:: ; ----- Ctrl+=
; MouseGetPos start_xpos, start_ypos
; Title := WinGetTitle("A")
; If InStr(Title, "KONTAKT"){
; 	;~ MouseClick left, 670, 100, 1, 1 ;Reset markers
; 	;~ Sleep "100"
; 	;~ MouseClick left, 670, 395, 1, 1
; 	;~ Sleep "100"
; 	;~ Send "{Down}"
; 	;~ Send "{Enter}"
; 	;~ Sleep "100"
; 	MouseClick left, 670+xo, 100+yo, 1, 1 ;Update sample pool
; 	Sleep "100"
; 	MouseClick left, 670+xo, 395+yo, 1, 1
; 	Sleep "100"
; 	Send "{Down}"
; 	Send "{Down}"
; 	Send "{Enter}"
; }
; ;~ If InStr(Title, "ReaScript Development Environment") {
; 	;~ Send "="
; 	;~ return
; 	;~ }
; MouseMove start_xpos, start_ypos, 1
; Sleep "400"
; return

; ; -------------------------------------------------------------------------------------------
; #PgDn::
; WinMoveBottom("Mixer")
; WinMoveBottom("MIDI take")
; return

; ;Prev preset
; vkBD:: ; ----- -
; WinMoveTop("VSTi:")
; WinActivate("VSTi:")
; MouseGetPos start_xpos, start_ypos
; Title := WinGetTitle("A")
; If InStr(Title, "Absynth")
; 	MouseClick left, 410+xo, 145+yo, 1, 1
; If InStr(Title, "Addictive Drums")
; 	MouseClick left, 400+xo, 110+yo, 1, 1
; If InStr(Title, "ANA2")
; 	MouseClick left, 520+xo, 115+yo, 1, 1
; If InStr(Title, "Analog Lab 3")
; 	MouseClick left, 488+xo, 102+yo, 1, 1
; If InStr(Title, "Battery")
; 	MouseClick left, 685+xo, 95+yo, 1, 1
; If InStr(Title, "Diva")
; 	MouseClick left, 412+xo, 110+yo, 1, 1
; If InStr(Title, "DUNE 3")
; 	MouseClick left, 568+xo, 140+yo, 1, 1
; If InStr(Title, "HIVE")
; 	MouseClick left, 495+xo, 110+yo, 1, 1
; If InStr(Title, "Iris")
; 	MouseClick left, 455+xo, 95+yo, 1, 1
; If InStr(Title, "KONTAKT")
; 	MouseClick left, 640+xo, 170+yo, 1, 1
; If InStr(Title, "Legend")
; 	MouseClick left, 785+xo, 110+yo, 1, 1
; If InStr(Title, "Massive")
; 	MouseClick left, 602+xo, 104+yo, 1, 1
; If InStr(Title, "Massive X")
; 	MouseClick left, 665+xo, 100+yo, 1, 1
; If InStr(Title, "Pigments")
; 	MouseClick left, 530+xo, 95+yo, 1, 1
; If InStr(Title, "Repro-1")
; 	MouseClick left, 438+xo, 140+yo, 1, 1
; If InStr(Title, "Repro-5")
; 	MouseClick left, 444+xo, 134+yo, 1, 1
; If InStr(Title, "Serum")
; 	MouseClick left, 690+xo, 100+yo, 1, 1 ;100
; 	;~ MouseClick left, 620+xo, 95+yo, 1, 1 ;90
; If InStr(Title, "Spire")
; 	MouseClick left, 294+xo, 108+yo, 1, 1
; If InStr(Title, "Sylenth1")
; 	MouseClick left, 612+xo, 246+yo, 1, 1
; If InStr(Title, "SynthMaster2")
; 	MouseClick left, 570+xo, 90+yo, 1, 1
; If InStr(Title, "TAL Sampler")
; 	MouseClick left, 555+xo, 100+yo, 1, 1
; If InStr(Title, "Avenger")
; 	;~ MouseClick left, 445+xo, 110+yo, 1, 1 ;100
; 	MouseClick left, 312+xo, 100+yo, 1, 1 ;70
; If InStr(Title, "Zebra")
; 	MouseClick left, 428+xo, 108+yo, 1, 1

; If InStr(Title, "Impact")
; 	MouseClick left, 84+xo, 54+yo, 1, 1
; If InStr(Title, "Mai Tai")
; 	MouseClick left, 84+xo, 54+yo, 1, 1
; If InStr(Title, "Mojito")
; 	MouseClick left, 84+xo, 54+yo, 1, 1
; If InStr(Title, "Presence")
; 	MouseClick left, 84+xo, 54+yo, 1, 1
; If InStr(Title, "SampleOne")
; 	MouseClick left, 84+xo, 54+yo, 1, 1
; If InStr(Title, "ReaScript Development Environment"){
; 	Send "-"
; 	return
; 	}
; MouseMove start_xpos, start_ypos, 1
; Sleep "400"
; return

; ;Next preset
; vkBB:: ; ----- =
; WinMoveTop("VSTi:")
; WinActivate("VSTi:")
; MouseGetPos start_xpos, start_ypos
; Title := WinGetTitle("A")
; If InStr(Title, "Absynth")
; 	MouseClick left, 430+xo, 145+yo, 1, 1
; If InStr(Title, "Addictive Drums")
; 	MouseClick left, 400+xo, 130+yo, 1, 1
; If InStr(Title, "ANA2")
; 	MouseClick left, 536+xo, 115+yo, 1, 1
; If InStr(Title, "Analog Lab 3")
; 	MouseClick left, 538+xo, 102+yo, 1, 1
; If InStr(Title, "Battery")
; 	MouseClick left, 685+xo, 105+yo, 1, 1
; If InStr(Title, "Diva")
; 	MouseClick left, 666+xo, 110+yo, 1, 1
; If InStr(Title, "DUNE 3")
; 	MouseClick left, 590+xo, 140+yo, 1, 1
; If InStr(Title, "HIVE")
; 	MouseClick left, 765+xo, 110+yo, 1, 1
; If InStr(Title, "Iris")
; 	MouseClick left, 455+xo, 105+yo, 1, 1
; If InStr(Title, "KONTAKT")
; 	MouseClick left, 660+xo, 170+yo, 1, 1
; If InStr(Title, "Legend")
; 	MouseClick left, 795+xo, 110+yo, 1, 1
; If InStr(Title, "Massive")
; 	MouseClick left, 602+xo, 122+yo, 1, 1
; If InStr(Title, "Massive X")
; 	MouseClick left, 680+xo, 100+yo, 1, 1
; If InStr(Title, "Pigments")
; 	MouseClick left, 560+xo, 95+yo, 1, 1
; If InStr(Title, "Repro-1")
; 	MouseClick left, 684+xo, 140+yo, 1, 1
; If InStr(Title, "Repro-5")
; 	MouseClick left, 674+xo, 134+yo, 1, 1
; If InStr(Title, "Serum")
; 	MouseClick left, 710+xo, 100+yo, 1, 1 ;100
; 	;~ MouseClick left, 640+xo, 95+yo, 1, 1 ;90
; If InStr(Title, "Spire")
; 	MouseClick left, 330+xo, 108+yo, 1, 1
; If InStr(Title, "Sylenth1")
; 	MouseClick left, 612+xo, 256+yo, 1, 1
; If InStr(Title, "SynthMaster2")
; 	MouseClick left, 590+xo, 90+yo, 1, 1
; If InStr(Title, "TAL Sampler")
; 	MouseClick left, 835+xo, 100+yo, 1, 1
; If InStr(Title, "Avenger")
; 	;~ MouseClick left, 460+xo, 110+yo, 1, 1 ;100
; 	MouseClick left, 322+xo, 100+yo, 1, 1 ;70
; If InStr(Title, "Zebra")
; 	MouseClick left, 722+xo, 108+yo, 1, 1

; If InStr(Title, "Impact")
; 	MouseClick left, 98+xo, 54+yo, 1, 1
; If InStr(Title, "Mai Tai")
; 	MouseClick left, 98+xo, 54+yo, 1, 1
; If InStr(Title, "Mojito")
; 	MouseClick left, 98+xo, 54+yo, 1, 1
; If InStr(Title, "Presence")
; 	MouseClick left, 98+xo, 54+yo, 1, 1
; If InStr(Title, "SampleOne")
; 	MouseClick left, 98+xo, 54+yo, 1, 1
; If InStr(Title, "ReaScript Development Environment") {
; 	Send "="
; 	return
; 	}
; MouseMove start_xpos, start_ypos, 1
; Sleep "400"
; return


; ; -------------------------------------------------------------------------------------------
; ; Move active of window on 10px
; #UP::
; WinGetPos win_x, win_y
; WinMove win_x,  win_y-10
; return
; #DOWN::
; WinGetPos win_x, win_y
; WinMove win_x,  win_y+10
; return
; #LEFT::
; WinGetPos win_x, win_y
; WinMove win_x-10,  win_y
; return
; #RIGHT::
; WinGetPos win_x, win_y
; WinMove win_x+10,  win_y
; return

; ; Change size of active window on 10px
; #+UP::
; WinGetPos win_x, win_y, win_width, win_height
; WinMove win_x, win_y-50, win_width,  win_height
; return
; #+DOWN::
; WinGetPos win_x, win_y, win_width, win_height
; WinMove win_x, win_y+50, win_width,  win_height
; return
; #+LEFT::
; WinGetPos win_x, win_y, win_width, win_height
; WinMove win_x-50, win_y, win_width,  win_height
; return
; #+RIGHT::
; WinGetPos win_x, win_y, win_width, win_height
; WinMove win_x+50, win_y, win_width,  win_height
; return

; #HOME::
; WinGetPos win_x, win_y, win_width, win_height
; ;~ WinMove win_x, 0, win_width,  win_height
; WinMove (A_ScreenWidth/2)-(win_width/2), (A_ScreenHeight/2)-(win_height/2)
; return

; ; Move mouse cursore of window on 1px
; ^#UP::
; MouseGetPos start_xpos, start_ypos
; MouseMove start_xpos, start_ypos-1, 1
; return
; ^#DOWN::
; MouseGetPos start_xpos, start_ypos
; MouseMove start_xpos, start_ypos+1, 1
; return
; ^#LEFT::
; MouseGetPos start_xpos, start_ypos
; MouseMove start_xpos-1, start_ypos, 1
; return
; ^#RIGHT::
; MouseGetPos start_xpos, start_ypos
; MouseMove start_xpos+1, start_ypos, 1
; return

; ; Move mouse cursore of window on 10px
; ^+#UP::
; MouseGetPos start_xpos, start_ypos
; MouseMove start_xpos, start_ypos-10, 1
; return
; ^+#DOWN::
; MouseGetPos start_xpos, start_ypos
; MouseMove start_xpos, start_ypos+10, 1
; return
; ^+#LEFT::
; MouseGetPos start_xpos, start_ypos
; MouseMove start_xpos-10, start_ypos, 1
; return
; ^+#RIGHT::
; MouseGetPos start_xpos, start_ypos
; MouseMove start_xpos+10, start_ypos, 1
; return
; ; -------------------------------------------------------------------------------------------
; }

; ; -------------------------------------------------------------------------------------------
; ; -------------------------------------------------------------------------------------------
; ; -------------------------------------------------------------------------------------------
; ;# Win (Windows logo key) 
; ;! Alt 
; ;^ Control 
; ;+ Shift 
; ;~ SoundPlay "*-1"