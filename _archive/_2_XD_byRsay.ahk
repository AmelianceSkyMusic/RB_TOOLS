; AHK2
#SingleInstance ignore 
#If WinActive("ahk_exe ApplicationFrameHost.exe")
TraySetIcon "xd.ico", ,1
A_TrayMenu.delete() ; Delete all menu
A_TrayMenu.Add("Suspend", "SuspendScript")  ; Creates a new menu item.
A_TrayMenu.SetIcon("Suspend", "xd.ico")
SuspendScript(ItemName, ItemPos, Menu) {
    Suspend
}
A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
A_TrayMenu.SetIcon("Exit", "xd.ico")
ExitScript(ItemName, ItemPos, Menu) {
    ExitApp
}

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
is_suspended := false
this_program := "Adobe XD"

global img_path := "XD_files\img\"


WinGetPos , , win_x, win_y, "A"

SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.

; -------------------------------------------------------------------------------------------
; -----------------------------------INCLUDES-------------------------------------------
; -------------------------------------------------------------------------------------------
#Include MODULES_files\image_functions.ahk
#Include MODULES_files\change_case.ahk
#include MODULES_files\windows_actions.ahk
	
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
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
^!#+vk46:: ;Ctrl+Shift+Alt+Win+F  - fullscreen
WinSetStyle "^0x400000", "A" ; bordersline
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
	
; -------------------------------------------------------------------------------------------
;Switches Alt+Wheelup with Wheelup 
Wheelup:: 
	Send "{Alt down}"
	Send "{Wheelup}"
	Send "{Alt up}"
return

;Switches Alt+Wheeldown with Wheeldown 
Wheeldown:: 
	Send "{Alt down}"
	Send "{Wheeldown}"
	Send "{Alt up}"
return


;~ ^Wheelup:: 
;~ send {Wheelup} 
;~ KeyWait, ^
;~ return

;~ ^Wheeldown:: 
;~ send {Wheeldown} 
;~ KeyWait, ^
;~ return

;Middle Mouse Button activates hand tool dragging. 
;~ MButton:: 
;~ Send, {Space down}{LButton down} 
;~ KeyWait, MButton 
;~ Send, {LButton up}{Space up} 
;~ Return 

;Duplicate ASM
;~LButton & RButton:: 
;send, ^c
;send, ^+v
;Return 

;Colour inactive element of shape ASM
;~ RButton:: 
;~ send, x
;~ send, {LButton down}{LButton up}
;~ send, x
;~ return

; Duplicate
~LButton & RButton:: 
Send "{Alt down}"
KeyWait "LButton"
Send "{Alt up}"
return

;Del ASM
~RButton & LButton:: 
send "{Delete}"
return

;Align Horizontal ASM
vk43::
Send "+{vk43}"
return
;Align Vertical ASM
vk45::
Send "+{vk4D}"
return
;Align Left ASM
vk4C::
Send "^+{Left}"
return
;Align Right ASM
vk52::
Send "^+{Right}"
return
;Align Top ASM
vk54::
Send "^+{Up}"
return
;Align Button ASM
vk42::
Send "^+{Down}"
return
;Duplicate ASM
F9::
Send "^{vk43}"
Send "^{vk56}"
return

;Pick border
!vk49:: 
MouseGetPos start_xpos, start_ypos
MouseClick left, 1340, 600, 1, 1
MouseMove start_xpos, start_ypos, 1
return
;Home screen
F1:: 
MouseGetPos start_xpos, start_ypos
MouseClick left, 75, 60, 1, 1
MouseMove start_xpos, start_ypos, 1
return
;Designe screen
F2:: 
MouseGetPos start_xpos, start_ypos
MouseClick left, 140, 60, 1, 1
MouseMove start_xpos, start_ypos, 1
return
;Prototype scren
F3:: 
MouseGetPos start_xpos, start_ypos
MouseClick left, 220, 60, 1, 1
MouseMove start_xpos, start_ypos, 1
return
;Play
F5:: 
MouseGetPos start_xpos, start_ypos
MouseClick left, 1220, 60, 1, 1
MouseMove start_xpos, start_ypos, 1
return

; -------------------------------------------------------------------------------------------
; --------------------------------IMAGE CLICK------------------------------------------
; -------------------------------------------------------------------------------------------
+x::
;~ isImage_Fill := isImage_FC("XD_files\img\Fill.png")
isImage_Fill := isImage_FC(img_path,  "Fill.png")
isImage_Border := isImage_FC(img_path,  "Border.png")
if (isImage_Fill.img_is && isImage_Border.img_is){
	;~ tempClip := Clipboard
	
	isImageClick_FC(img_path,  "Fill.png", -32, 6)
	Sleep 1000
	;~ Send "^{a}"
	Send "^{c}"
	fill_color_clip := Clipboard

	;~ MsgBox fill_color_clip
		Sleep 1000
	isImageClick_FC(img_path,  "Border.png", -32, 6)
	Sleep 1000
	;~ Send "^{a}"
	Send "^{c}"
	Sleep 1000
	border_color_clip := Clipboard

	;~ MsgBox border_color_clip
	Sleep 1000
	Clipboard := fill_color_clip
	MsgBox fill_color_clip border_color_clip
	;~ ToolTip "---4---" Clipboard
	;~ isImageClick_FC(img_path,  "Fill.png", -32, 6)
	;~ Sleep 100

	;~ Send "^{a}"
	;~ Send "^{v}"

	;~ Clipboard := tempClip
}
return

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;^!z::
;Run, Illustrator.exe A_Desktop\test.jsx
;return
}

;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"