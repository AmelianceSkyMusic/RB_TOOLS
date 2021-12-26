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
#vk46:: ; Win+F  - fullscreen

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
	
return

#SuspendExempt False  ; Disable exemption for any hotkeys/hotstrings below this.
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

{ 
    
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

}


; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"