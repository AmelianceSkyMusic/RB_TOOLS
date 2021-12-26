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

MsgBox "Fullscreen for Samir (@as_am_as) =)", "FULLSCREEN"

!F11::

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