;# Win   ! Alt   ^ Ctrl   + Shift

; #SingleInstance ignore 
#HotIf WinActive("ahk_exe photoshop.exe")
{
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

this_program := "photoshop"

; -------------------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging. 
MButton::
{
	Send "{Space down}{LButton down}"
	KeyWait "MButton"
	Send "{LButton up}{Space up}"
}

; -------------------------------------------------------------------------------------------
;----- Move object in more distance
+^UP:: ;--Shift+Ctrl+UP
{
	Loop 10
	Send "+{UP}"
}

+^RIGHT:: ;--Shift+Ctrl+RIGHT
{
	Loop 10
	Send "+{RIGHT}"
}

+^DOWN:: ;--Shift+Ctrl+DOWN
{
	Loop 10
	Send "+{DOWN}"
}

+^LEFT:: ;--Shift+Ctrl+LEFT
{
	Loop 10
	Send "+{LEFT}"
}

; -------------------------------------------------------------------------------------------
;Colour inactive element of shape ASM
;~ RButton:: 
;~ Send "x"
;~ Send "{LButton down}{LButton up}"
;~ Send "x"
;~ return

;Duplicate
~LButton & RButton::
{
	Send "{LButton Up}"
	Send "{Alt down}"
	Send "{LButton Down}"
	KeyWait "LButton"
	Send "{Alt up}"
}

;Del ASM
~RButton & LButton::
{
	Send "{Delete}"
}
 
!a:: ;Align Left ASM
{
	Send "^+{F5}"
}

!d:: ;Align Right ASM
{
	Send "^+{F6}"
}

!w:: ;Align Top ASM
{
	Send "^+{F7}"
}

!s:: ;Align Button ASM
{
	Send "^+{F8}"
}

!c:: ;Align Horizontal ASM
{
	Send "^+{F3}"
}

!e:: ;Align Vertical ASM
{
	Send "^+{F4}"
}

;Duplicate ASM
;vk4C::
;Send "{F9}"
;return

; #vk51::
; ;~ WinActivate("Adobe Illustrator 2019")
; win_text := WinGetText("Adobe Illustrator 2019")
; If InStr(win_text, "character")
; 	MsgBox "Ouyeah"
; else
; 	MsgBox "no"
; MsgBox  win_text
; return

;^!z::
;Run, Illustrator.exe A_Desktop\test.jsx
;return
}