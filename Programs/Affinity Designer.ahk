; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
#HotIf WinActive("ahk_exe Designer.exe")


; -------------------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging. 
; MButton::{}
; Send "{Space down}{LButton down}"
; KeyWait "MButton"
; Send "{LButton up}{Space up}"
; Return 

;Duplicate ASM
;~LButton & RButton:: 
;send, ^c
;send, ^+v
;Return 

; -------------------------------------------------------------------------------------------
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

+^DOWN::  ;--Shift+Ctrl+DOWN
{
    Loop 10
    Send "+{DOWN}"
}

+^LEFT::   ;--Shift+Ctrl+LEFT
{
    Loop 10
    Send "+{LEFT}"
}

; -------------------------------------------------------------------------------------------
;Colour inactive element of shape ASM
RButton:: 
{
    Send "x"
    Send "{LButton down}{LButton up}"
    ;~ KeyWait "LButton"
    Send "x"
}

; ;Duplicate
; ~LButton & RButton:: 
; {
;     Send "{LButton Up}"
;     Send "{Alt down}"
;     Send "{LButton Down}"
;     KeyWait "LButton"
;     Send "{Alt up}"
; }

;Duplicate
~LButton & RButton::
{ 
    Send "{Ctrl down}"
    KeyWait "LButton"
    Send "{Ctrl up}"
}

#t::{
    MouseGetPos(&xpos, &ypos)
    countInput := InputBox("How many Items did you select?", "Items count", "w48 h112")
    if countInput.Result = "Cancel" {
        return
    }
    newValueInput := InputBox("Set your value?", "New value", "w48 h112")
        if newValueInput.Result = "Cancel" {
        return
    }

    count := countInput.value
    newValue := newValueInput.value

    loop count {
        Msg(count-A_Index)
        MouseClick "left", xpos, ypos
        sleep 300
        SendInput newValue
        Send "{Enter}"
        Send "^!]"
        sleep 100
    }
    ; Send "^!]"

}

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


;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"