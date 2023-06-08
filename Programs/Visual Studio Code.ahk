; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
; #SingleInstance ignore
; #If WinActive("ahk_exe Studio One.exe")
#HotIf WinActive("ahk_exe code.exe")
#hotstring EndChars `t ;tab - expand snippet
#hotstring o ?
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
global vsc := {}
vsc.name := "Visual Stuion COde"
vsc.img_path := A_ScriptDir "\Programs\Visual Studio Code\Images\"

SetCapsLockState "AlwaysOff"

; F3::{
; 	ToolTip("Hello")
; 	Sleep(5000)
; 	ToolTip()
; }

; #1::{
; 	vsc.startLine := InputBox("Start line", "Put start line", "w300 h130", '').value
; }

; #2::{
; 	vsc.endLine := InputBox("End line", "Put end line", "w300 h130", '').value
; }

#c::{
    ClipboardTemp := ClipboardAll()
    A_Clipboard := ""
    Send("^{c}")
    ClipWait(1)
    vsc.copyLine := A_Clipboard
    A_Clipboard := ClipboardTemp
}

#v::{
	Send(vsc.startLine vsc.copyLine vsc.endLine)
}

^WheelUp::{ ;; 1
	Send('^{Up}')
}
^WheelDown::{
	Send('^{Down}')
}
^+WheelUp::{ ;; 10
	Send('^+{Up}')
}
^+WheelDown::{
	Send('^+{Down}')
}
^+!WheelUp::{ ;;0.1
	Send('^+!{Up}')
}
^+!WheelDown::{
	Send('^+!{Down}')
}

XButton1::Send "!{Left}"

XButton2::Send "!{Right}"

!Enter::{
	Send "^{Up}^{Up}"
	Sleep 100
	Send "{Up}"
	Send "{Enter}"
	Send "^{Down}^{Down}"
}

::f1::{
	Send "fix: "
	Send " according to rule ♥ in html-and-css.md"
	Send "{Left 39}"
}

::f2::{
	Send "fix: "
	Send " according to rule ♥ in html-and-css-extended.md"
	Send "{Left 48}"
}

::r1::{
	Send "refactor: "
	Send " according to rule ♥ in html-and-css.md"
	Send "{Left 39}"
}

::r2::{
	Send "refactor: "
	Send " according to rule ♥ in html-and-css-extended.md"
	Send "{Left 48}"

}

!+Left::{
	Send "{Left 20}"
	Send "{Backspace}"
}

!+Right::{
	Send "{Right 20}"
	Send "{Backspace}"
}

F1::{
	Send "{F1}"
	Send "{Enter}"
}
