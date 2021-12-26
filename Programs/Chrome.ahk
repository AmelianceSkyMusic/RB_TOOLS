; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
; #SingleInstance ignore 
; #If WinActive("ahk_exe Studio One.exe")
; #HotIf WinActive("ahk_exe chrome.exe") HotIfWinNotActive("ahk_exe code.exe") HotIfWinNotActive("ahk_exe clover.exe")

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
global ch := {}
ch.name := "Chrome"
ch.img_path := A_ScriptDir "\Programs\Chrome\Images\"
ch.tabbarView := true

ch_MouseOnAdressBar_FC()
{	
	; CoordMode "ToolTip", "Screen"
	MouseGetPos(&MouseX, &MouseY)
	MouseOnAdressBar := (MouseX > 0 and MouseX < 1366) and (MouseY > 0 and MouseY < 70)
	return MouseOnAdressBar
}

ch_MouseNoOnAdressBar_FC()
{
	; CoordMode "ToolTip", "Screen"
	MouseGetPos(&MouseX, &MouseY)
	MouseNoOnAdressBar := (MouseX > 0 and MouseX < 1366) and (MouseY < 0 or MouseY > 105)
	return MouseNoOnAdressBar
}

; ~LButton & RButton::
; {
; 	; If ch_MouseOnAdressBar_FC() {
; 	; 	Send("^+b")
; 	; } 
; 	Send("^+b")
; }

SetTimer tabbarViewer, 200

tabbarViewer() {
	if WinActive("ahk_exe chrome.exe") {
		if ch_MouseOnAdressBar_FC() && ch.tabbarView {
			ch.tabbarView := false
			Send("^+b")
		} else if ch_MouseNoOnAdressBar_FC() && !ch.tabbarView {
			ch.tabbarView := true
			Send("^+b")
		}
	}
}

; If ch_MouseNoOnAdressBar_FC() {
; 	Msg("NOOO")
; }







; F3::{
; 	ToolTip("Hello")
; 	Sleep(5000)
; 	ToolTip()
; }

; F1::{
; 	Send("{RButton}")
; 	image := "edit.png"

; 	img := isImageWaitForImgClick_FC(tg.img_path, image, 10, 10, 300,,,,50)

; 	if img.img_is = 1 {
; 		Send "{Enter}"
; 	} else {
; 		Say "Can't find image " image
; 		return
; 	}
; 	Msg ("Edit")
; }

; F2::{
; 	Send("{RButton}")
; 	image := "reply.png"

; 	img := isImageWaitForImgClick_FC(tg.img_path, image, 10, 10, 300,,,,50)

; 	if img.img_is = 1 {
; 		Send "{Enter}"
; 	} else {
; 		Say "Can't find image " image
; 		return
; 	}
; 	Msg ("Reply")
; }

; F3::{
; 	Send("{RButton}")
; 	image := "save_as.png"

; 	img := isImageWaitForImgClick_FC(tg.img_path, image, 10, 10, 300,,,,50)

; 	if img.img_is = 1 {
; 		Send "{Enter}"
; 	} else {
; 		Say "Can't find image " image
; 		return
; 	}
; 	Msg ("Save As")
; }

; F4::{
; 	Send("{RButton}")
; 	image := "save_as.png"

; 	img := isImageWaitForImgClick_FC(tg.img_path, image, 10, 10, 300,,,,50)

; 	if img.img_is = 1 {
; 		Send "{Enter}"
; 		Sleep 500
; 		Send "{Enter}"
; 		sleep 500
; 		Send "{Right}"
; 	} else {
; 		Say "Can't find image " image
; 		return
; 	}
; 	Msg ("Save As")
; }

; F2::{
; 	Send("{RButton}")
; 	Send("{Down}")
; 	Send("{Enter}")
; 	Msg ("Reply")
; }

; F3::
; {
; 	if (A_PriorHotkey != "F3" or A_TimeSincePriorHotkey > 400)
; 	{
; 			if (A_PriorHotkey != "F3" or A_TimeSincePriorHotkey > 400)
; 			{
; 				; Too much time between presses, so this isn't a double-press.
; 				KeyWait "F3"
; 				Msg "3"
; 				return
; 			}
; 		; Too much time between presses, so this isn't a double-press.
; 		KeyWait "F3"
; 		Msg "2"
; 		return
; 	}
; 	Msg "You double-pressed the right control key."
; }

; s::
; {
; 	if (ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200) {
; 		RunCommand_FC("Proportional Scale")
; 		; Msg("1")
; 	} else {
; 		Send "{s}"
; 		; Msg("2")
; 	}
; }

; #SingleInstance, Force
; w::{
; 	KeyWait , LButton, D T0.2
; 	KeyWait , LButton, D T0.2
; 	KeyWait , LButton, D T0.2
; 	if (ErrorLevel = 0)
; 	{
; 		Send , ^ c
; 		goto, click1
; 	} else
; 	{
; 		goto, click1
; 	}

; 	RButton::
; 	KeyWait , RButton, U, T0.2
; 	KeyWait , RButton, D, T0.2
; 	if (ErrorLevel = 0)
; 	{
; 		Send , ^ v
; 		return
; 	} else
; 	{
; 		return
; 	}
; }
