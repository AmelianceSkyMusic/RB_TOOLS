; AHK2
A_TrayMenu.delete() ; Delete all menu
;~ A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Pause", "PauseScript")  ; Creates a new menu item.
A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
;~ A_TrayMenu.SetIcon("Exit", "reaper.ico")
;~ return

PauseScript(ItemName, ItemPos, Menu) {
	Pause
}
	
ExitScript(ItemName, ItemPos, Menu) {
	ExitApp
}

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

is_suspended := false
this_program := "Studio One"
; -------------------------------------------------------------------------------------------
#SuspendExempt  ; Exempt the following hotkey from Suspend.

#Esc::
SoundPlay "*-1, WAIT"
if (is_suspended)
	if MsgBox("Script is suspended! `nUnsuspend it?",  this_program, "OC") = "OK" {
		Suspend ;"Toggle"
		SoundPlay "*-1, WAIT"
		is_suspended := false
            loopcycles := InputBox("Enter clicks number (Ctrl+Shift+Alt+LMB):", "CLICKER", "w300 h130")
	} else {
		SoundPlay "*16, WAIT"
		is_suspended := true
	}
else
	if MsgBox("Script is working! `nWill script suspend?", this_program, "OC") = "OK" {
		Suspend ;"Toggle"
		SoundPlay "*-1, WAIT"
		is_suspended := true
	} else {
		SoundPlay "*16, WAIT"
		is_suspended := false
	}
return

; -------------------------------------------------------------------------------------------


#SuspendExempt False  ; Disable exemption for any hotkeys/hotstrings below this.
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

{ 
	
#Include Multitool_files\fullscreen.ahk ;-- Win+Shift+F  - fullscreen
#Include Multitool_files\renamer.ahk
#Include Multitool_files\TEST.ahk
;~ #Include Multitool_files\move_mouse_cursore.ahkF

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

;~ #If WinActive("ahk_exe clover.exe")
	MButton::
	Send "{Lbutton}"
	Send "{Lbutton}"
	;~ MsgBox "cv"
	return
	

+MButton::
MouseGetPos start_xpos, start_ypos
if (loopcycles <=0)
    loopcycles := InputBox("Enter clicks number (Ctrl+Shift+Alt+LMB):", "CLICKER", "w300 h130")

;~ if ErrorLevel
    ;~ MsgBox "CANCEL was pressed."
;~ else
    ;~ MsgBox "You entered '" UserInput "'"
Loop loopcycles
    {
   MouseClick left, start_xpos, start_ypos, 1, 1
    Sleep 100
    }
return

#LButton::
MouseGetPos start_xpos, start_ypos
Loop 2
    {
   MouseClick left, start_xpos, start_ypos, 1, 1
    }
return
; -------------------------------------------------------------------------------------------


~LAlt & WheelUp::  ; Scroll left.
Loop 2  ; <-- Increase this value to scroll faster.
    SendMessage 0x115, 0, 0, ControlGetFocus("A")  ;
return

~LAlt & WheelDown::  ; Scroll right.
Loop 2  ; <-- Increase this value to scroll faster.
    SendMessage 0x115, 1, 0, ControlGetFocus("A")  
return

~LControl & WheelUp::  ; Scroll left.
Loop 2  ; <-- Increase this value to scroll faster.
    SendMessage 0x114, 1, 0, ControlGetFocus("A")  ; 0x114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.
return

~LControl & WheelDown::  ; Scroll right.
Loop 2  ; <-- Increase this value to scroll faster.
    SendMessage 0x114, 0, 0, ControlGetFocus("A")  ; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
return
; -------------------------------------------------------------------------------------------





; -------------------------------------------------------------------------------------------
; Move active of window on 10px
#UP::
WinGetPos win_x, win_y
WinMove win_x,  win_y-10
return
#DOWN::
WinGetPos win_x, win_y
WinMove win_x,  win_y+10
return
#LEFT::
WinGetPos win_x, win_y
WinMove win_x-10,  win_y
return
#RIGHT::
WinGetPos win_x, win_y
WinMove win_x+10,  win_y
return

#+UP::
WinGetPos win_x, win_y, win_width, win_height
WinMove win_x, win_y-50, win_width,  win_height
return
#+DOWN::
WinGetPos win_x, win_y, win_width, win_height
WinMove win_x, win_y+50, win_width,  win_height
return
#+LEFT::
WinGetPos win_x, win_y, win_width, win_height
WinMove win_x-50, win_y, win_width,  win_height
return
#+RIGHT::
WinGetPos win_x, win_y, win_width, win_height
WinMove win_x+50, win_y, win_width,  win_height
return

#HOME::
WinGetPos win_x, win_y, win_width, win_height
;~ WinMove win_x, 0, win_width,  win_height
WinMove (A_ScreenWidth/2)-(win_width/2), (A_ScreenHeight/2)-(win_height/2)
return

; Change size of active window on 10px
!+UP::
WinGetPos win_x, win_y, win_width, win_height
WinMove win_x, win_y-10, win_width,  win_height+10
return
!+DOWN::
WinGetPos win_x, win_y, win_width, win_height
WinMove win_x, win_y, win_width,  win_height+10
return
!+LEFT::
WinGetPos win_x, win_y, win_width, win_height
WinMove win_x-10, win_y, win_width,  win_height+10
return
!+RIGHT::
WinGetPos win_x, win_y, win_width, win_height
WinMove win_x, win_y, win_width,  win_height+10
return

; Move mouse cursore of window on 1px
^#UP::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos, start_ypos-1, 1
return
^#DOWN::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos, start_ypos+1, 1
return
^#LEFT::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos-1, start_ypos, 1
return
^#RIGHT::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos+1, start_ypos, 1
return

; Move mouse cursore of window on 10px
^+#UP::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos, start_ypos-10, 1
return
^+#DOWN::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos, start_ypos+10, 1
return
^+#LEFT::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos-10, start_ypos, 1
return
^+#RIGHT::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos+10, start_ypos, 1
return
; -------------------------------------------------------------------------------------------





^Mbutton::
MouseGetPos start_xpos, start_ypos
Loop
{
MouseGetPos start_xpos_new, start_ypos_new

if not GetKeyState("Mbutton", "P")
break

if (start_ypos < start_ypos_new)
{	
	Loop 20
	    SendMessage 0x115, 0, 0, ControlGetFocus("A") 
	return
} 
if (start_ypos > start_ypos_new) {
	Loop 20
		SendMessage 0x115, 1, 0, ControlGetFocus("A") 
	return
}
if (start_xpos > start_xpos_new) {
		SendMessage 0x114, 1, 0, ControlGetFocus("A") 
}
if (start_xpos < start_xpos_new) {
		SendMessage 0x114, 0, 0, ControlGetFocus("A") 
}
MouseGetPos start_xpos, start_ypos

}
return

}


; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"