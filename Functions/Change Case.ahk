; -------------------------------------------------------------------------------------------
; ---------- Win+F3 — перевести буквы в верхний регистр
; #F3:: 
; {
; Clipboard := ""
; SendInput "^{vk43}"    ;  "C"
; ;~ ClipWait 1 
; if !ClipWait(2)
;  {
;   ;~ DllCall("Char" . (up ? "Upper" : "Lower"), Str, string := Clipboard)
;   string := DllCall("CharUpper", "Str", DllCall("CharLower", "Str", Clipboard, "Str"), "Str")
;   Clipboard := string

;  Sleep 100
;  SendInput "^{vk56}"    ;  "V"
;  }
;  Msg('he')
; }

; -------------------------------------------------------------------------------------------
; ---------- Win+F4 — перевести буквы в нижний регистр
; #F4:: 
; {
; Clipboard := ""
; SendInput "^{vk43}"    ;  "C"
; ClipWait 1 
; if !ClipWait(2)
; {

; ;~ DllCall("Char" . (up ? "Upper" : "Lower"), Str, string := Clipboard)
; string := DllCall("CharLower", "Str", DllCall("CharUpper", "Str", Clipboard, "Str"), "Str")
; Clipboard := string

; Sleep 100
; SendInput "^{vk56}"    ;  "V"
; }
; }



#F3:: 
{
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    A_Clipboard := StrUpper(A_Clipboard)
    ; MsgBox A_Clipboard
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}

#F4:: 
{
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    A_Clipboard := StrLower(A_Clipboard)
    ; MsgBox A_Clipboard
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}

#F9::
{
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := smartChangeCaseToLower_FN(StrValue)
    A_Clipboard := newtext
        ; Msg(A_Clipboard, 3)

    MsgBox A_Clipboard
    ; Sleep 100
    ; Send "^v"
    ; Sleep 100
    A_Clipboard := ClipSaved
}

smartChangeCaseToLower_FN(text) {
    newtext := ""

    Loop parse, text, "`n"
    {
        ; A_LoopField
        firstCharacter := SubStr(A_LoopField, 1, 1)
        otherCharacters := StrLower(SubStr(A_LoopField, 2))

        newtext := newtext firstCharacter otherCharacters
    }
    text := newtext
    newtext := ""
    Loop parse, text, "."
    {
        ; A_LoopField
        Loop parse, A_LoopField, ""
        {
            if !A_LoopField = " "
            {
                firstCharacter := A_LoopField
                otherCharacters := StrLower(SubStr(A_LoopField, A_Index))
                break
            }
        }
        ; firstCharacter := SubStr(A_LoopField, 1, 1)
        ; otherCharacters := StrLower(SubStr(A_LoopField, 2))

        newtext := newtext firstCharacter otherCharacters "."
    }
    ; text := newtext
    ; newtext := ""
    ; Loop parse, text, "!"
    ; {
    ;     ; A_LoopField
    ;     firstCharacter := SubStr(A_LoopField, 1, 1)
    ;     otherCharacters := StrLower(SubStr(A_LoopField, 2))

    ;     newtext := newtext firstCharacter otherCharacters
    ; }
    ; text := newtext
    ; newtext := ""
    ; Loop parse, text, "?"
    ; {
    ;     ; A_LoopField
    ;     firstCharacter := SubStr(A_LoopField, 1, 1)
    ;     otherCharacters := StrLower(SubStr(A_LoopField, 2))

    ;     newtext := newtext firstCharacter otherCharacters
    ; }
    
    return newtext

}

; #F4:: 
; {
;     ClipSaved := ClipboardAll()
; 	A_Clipboard := ""
; 	Send "^c"
; 	ClipWait
; 	ClipTemp := A_Clipboard
;     A_Clipboard := StrLower(ClipTemp)
;     Send "^v"
;     A_Clipboard := ClipSaved

; }
; ; String1 := StrUpper(String1)  ; i.e. output can be the same as input.
; String2 := StrLower("ABC") 