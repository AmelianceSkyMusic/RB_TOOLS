#F3::
ConvertRegistrUp(ErrorLevel)
/*     KeyWait A_ThisHotkey
 *     KeyWait A_ThisHotkey
 *     If ErrorLevel
 *         Return
 * 
 *     KeyWait A_ThisHotkey
 *     KeyWait A_ThisHotkey

 *     KeyWait A_ThisHotkey
 *     Return
 */

ConvertRegistrUp(up)  { 
    Clipboard := ""
    SendInput "^{vk43}"    ;  "C"
    ClipWait 1 
    if ErrorLevel
        Return

    ;~ DllCall("Char" . (up ? "Upper" : "Lower"), Str, string := Clipboard)
	string := DllCall("CharUpper", "Str", DllCall("CharLower", "Str", Clipboard, "Str"), "Str")
    Clipboard := string

    Sleep 100
    SendInput "^{vk56}"    ;  "V"

}
Return

#F4::
ConvertRegistrDown(ErrorLevel)
/*     KeyWait A_ThisHotkey
 *     KeyWait A_ThisHotkey
 *     If ErrorLevel
 *         Return
 * 
 *     KeyWait A_ThisHotkey
 *     KeyWait A_ThisHotkey
 *     ConvertRegistr(ErrorLevel)
 *     KeyWait A_ThisHotkey
 *     Return
 */

ConvertRegistrDown(down)  { 
    Clipboard := ""
    SendInput "^{vk43}"    ;  "C"
    ClipWait 1 
    if ErrorLevel
        Return

    ;~ DllCall("Char" . (up ? "Upper" : "Lower"), Str, string := Clipboard)
	string := DllCall("CharLower", "Str", DllCall("CharUpper", "Str", Clipboard, "Str"), "Str")
    Clipboard := string

    Sleep 100
    SendInput "^{vk56}"    ;  "V"

}
Return