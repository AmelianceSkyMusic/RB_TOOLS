; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
; #SingleInstance ignore
; #If WinActive("ahk_exe Studio One.exe")
#HotIf WinActive("ahk_exe chrome.exe") HotIfWinNotActive("ahk_exe code.exe") HotIfWinNotActive("ahk_exe clover.exe")

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
	MouseOnAdressBar := (MouseX > 0 and MouseX < 1366) and (MouseY > 35 and MouseY < 70)
	return MouseOnAdressBar
}

ch_MouseNoOnAdressBar_FC()
{
	; CoordMode "ToolTip", "Screen"
	MouseGetPos(&MouseX, &MouseY)
	MouseNoOnAdressBar := (MouseX > 0 and MouseX < 1366) and (MouseY < 35 or MouseY > 105)
	return MouseNoOnAdressBar
}

~MButton::
{
	If ch_MouseOnAdressBar_FC() {
		Send("^+b")
	}
	; Send("^+b")
}

; SetTimer tabbarViewer, 200

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
