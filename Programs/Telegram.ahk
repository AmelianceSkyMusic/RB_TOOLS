; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
; #SingleInstance ignore
; #If WinActive("ahk_exe Studio One.exe")
#HotIf WinActive("ahk_exe Telegram.exe")

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
global tg := {}
tg.name := "Telegram"
tg.img_path := A_ScriptDir "\Programs\Telegram\Images\"

; F3::{
; 	ToolTip("Hello")
; 	Sleep(5000)
; 	ToolTip()
; }

:c1:LL::пан Дмитро
:c1:ДД::пан Дмитро
:c1:HH::пан Раджаб
:c1:РР::пан Раджаб
:c1:YY::пані Наталя
:c1:НН::пані Наталя
:c1:SS::пані Ірина
:c1:ІІ::пані Ірина

F1::{
	Send("{RButton}")
	image := "edit.png"

	img := isImageWaitForImgClick_FC(tg.img_path, image, 10, 10, 300,,,,50)

	if img.img_is = 1 {
		Send "{Enter}"
	} else {
		Say "Can't find image " image
		return
	}
	Msg ("Edit")
}

F2::{
	Send("{RButton}")
	image := "reply.png"

	img := isImageWaitForImgClick_FC(tg.img_path, image, 10, 10, 300,,,,50)

	if img.img_is = 1 {
		Send "{Enter}"
	} else {
		Say "Can't find image " image
		return
	}
	Msg ("Reply")
}

F3::{
	Send("{RButton}")
	image := "save_as.png"

	img := isImageWaitForImgClick_FC(tg.img_path, image, 10, 10, 300,,,,50)

	if img.img_is = 1 {
		Send "{Enter}"
	} else {
		Say "Can't find image " image
		return
	}
	Msg ("Save As")
}

F4::{
	Send("{RButton}")
	image := "save_as.png"

	img := isImageWaitForImgClick_FC(tg.img_path, image, 10, 10, 300,,,,50)

	if img.img_is = 1 {
		Send "{Enter}"
		Sleep 500
		Send "{Enter}"
		sleep 500
		Send "{Right}"
	} else {
		Say "Can't find image " image
		return
	}
	Msg ("Save As")
}


~MButton::
{
	if mt("MButton") = 2 {
		Send('^f')
	} else {
		Send('{Esc}')
		Send('^f')
	}
}
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
