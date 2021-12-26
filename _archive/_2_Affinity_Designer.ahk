; AHK2
#SingleInstance ignore 
#If WinActive("ahk_exe Designer.exe")
TraySetIcon "illustratоr.ico", ,1
A_TrayMenu.delete() ; Delete all menu
A_TrayMenu.Add("Suspend", "SuspendScript")  ; Creates a new menu item.
A_TrayMenu.SetIcon("Suspend", "illustratоr.ico")
SuspendScript(ItemName, ItemPos, Menu) {
    Suspend
}
A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
A_TrayMenu.SetIcon("Exit", "illustratоr.ico")
ExitScript(ItemName, ItemPos, Menu) {
    ExitApp
}

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
is_suspended := false
this_program := "Affinity Designer"

; -------------------------------------------------------------------------------------------
#SuspendExempt  ; Exempt the following hotkey from Suspend.
#Esc::
SoundPlay "*-1, WAIT"
if (is_suspended){
	;~ if MsgBox("Script is suspended! `nUnsuspend it?",  this_program, "OC") = "OK" {
		Suspend ;"Toggle"
		SoundPlay "*-1, WAIT"
		is_suspended := false
	;~ } else {
		;~ SoundPlay "*16, WAIT"
		;~ is_suspended := true
	;~ }
} else {
	;~ if MsgBox("Script is working! `nWill script suspend?", this_program, "OC") = "OK" {
		Suspend ;"Toggle"
		SoundPlay "*-1, WAIT"
		is_suspended := true
	;~ } else {
		;~ SoundPlay "*16, WAIT"
		;~ is_suspended := false
	;~ }
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
;~ WinSetStyle "^0x400000", "A" ; bordersline

;~ WinSetStyle "^0xC00000", "A"
;~ WinSetStyle "^0x80000", "A" ; Icon in Title
;~ WinSetStyle "^0x40000", "A" ; Size change lines
;~ WinSetStyle "^0x20000000", "A" ; Size change lines
return
#SuspendExempt False  ; Disable exemption for any hotkeys/hotstrings below this.
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

{ 
#^+vk9::Suspend ; -- Win+Ctrl+Shift+Tab
;~ #^!+s::Suspend
;~ #^!+p::Pause

; -------------------------------------------------------------------------------------------
;Switches Alt+Wheelup with Wheelup 
;~ Wheelup:: 
;~ Send "{Alt down}"
;~ Send "{Wheelup}"
;~ Send "{Alt up}"
;~ return

;Switches Alt+Wheeldown with Wheeldown 
;~ Wheeldown::
;~ Send "{Alt down}"
;~ Send "{Wheeldown}"
;~ Send "{Alt up}"
;~ return

; -------------------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging. 
MButton:: 
Send "{Space down}{LButton down}"
KeyWait "MButton"
Send "{LButton up}{Space up}"
Return 

;Duplicate ASM
;~LButton & RButton:: 
;send, ^c
;send, ^+v
;Return 

; -------------------------------------------------------------------------------------------
;----- Move object in more distance
+^UP:: ;--Shift+Ctrl+UP
Loop 10
Send "+{UP}"
return

+^RIGHT:: ;--Shift+Ctrl+RIGHT
Loop 10
Send "+{RIGHT}"
return

+^DOWN:: ;--Shift+Ctrl+DOWN
Loop 10
Send "+{DOWN}"
return

+^LEFT:: ;--Shift+Ctrl+LEFT
Loop 10
Send "+{LEFT}"
return

; -------------------------------------------------------------------------------------------
;Colour inactive element of shape ASM
RButton:: 
Send "x"
Send "{LButton down}{LButton up}"
;~ KeyWait "LButton"
Send "x"
return

;Duplicate
~LButton & RButton:: 
Send "{LButton Up}"
Send "{Alt down}"
Send "{LButton Down}"
KeyWait "LButton"
Send "{Alt up}"
return

/*;Del ASM
~RButton & LButton:: 
Send "{Delete}"
return

;Align Horizontal ASM
vk43::
Send "{F3}"
return
;Align Vertical ASM
vk45::
Send "{F4}"
return
;Align Left ASM
vk4C::
Send "{F5}"
return
;Align Right ASM
vk52::
Send "{F6}"
return
;Align Top ASM
vk54::
Send "{F7}"
return
;Align Button ASM
vk42::
Send "{F8}"
return
*/
;Duplicate ASM
;vk4C::
;Send "{F9}"
;return

/*
#vk51::
;~ WinActivate("Adobe Illustrator 2019")
win_text := WinGetText("Adobe Illustrator 2019")
If InStr(win_text, "character")
	MsgBox "Ouyeah"
else
	MsgBox "no"
MsgBox  win_text
return*/

;^!z::
;Run, Illustrator.exe A_Desktop\test.jsx
;return
}

;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"