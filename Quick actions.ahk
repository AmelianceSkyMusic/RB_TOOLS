; #w:: {
;     ClipboardTemp := ClipboardAll()
;     A_Clipboard := ""

;     Send("^{c}")
;     ClipWait(1)
;     ; Sleep 1000
;     WinActivate("ahk_exe Telegram.exe")
;     WinWait("ahk_exe Telegram.exe", , 3)
;     Send("^{v}")
;     Sleep 500
;     Send("{Enter}")

;     A_Clipboard := ClipboardTemp
; }

; #r:: {
;     ClipboardTemp := ClipboardAll()
;     A_Clipboard := ""

;     Send("{F2}")
;     Send("^{c}")
;     ClipWait(1)
;     ClipboardText := A_Clipboard
;     Send("{Esc}")

;     Send("^{c}")
;     ClipWait(1)
;     ; Sleep 1000
;     WinActivate("ahk_exe Telegram.exe")
;     WinWait("ahk_exe Telegram.exe", , 3)
;     Send("^{v}")
;     Sleep 500
;     Send ClipboardText
;     Send("{Enter}")

;     A_Clipboard := ClipboardTemp
; }

; #e::{
;     ClipboardTemp := ClipboardAll()
;     A_Clipboard := ""

;     Send("{F2}")
;     Send("^{c}")
;     ClipWait(1)
;     ClipboardText := A_Clipboard
;     Send("{Esc}")
    
;     WinActivate("ahk_exe Telegram.exe")
;     WinWait("ahk_exe Telegram.exe", , 3)
;     SendInput("____________________________________")
;     SendInput("____________________________________")
;     SendInput("____________________________________")
;     SendInput("____________________________________")
;     SendInput("____________________________________")
;     SendInput("____________________________________")
;     SendInput("____________________________________")
;     SendInput("____________________________________")
;     Send("^{enter}")
;     SendInput("{#}course {#}курс ")
;     Send("^{enter}")
;     Send("^{v}")

;     Sleep 1000

;     A_Clipboard := ClipboardTemp
; }

; #q::{

;     ; WinGetPos &X, &Y, &W, &H, "Telegram"
;     ; MsgBox X " " Y " " W " " H
;     ClipboardText := 111
;     CoordMode "Mouse", "Window"
;     MouseMove 450, 540
;     Send("{RButton}")
;     Send("{Up}")
;     Send("{Up}")
;     Send("{Up}")
;     Send("{Up}")
;     Send("{Enter}")
;     Sleep 300
;     Send("^{k}")
;     Sleep 300
;     Send ClipboardText
;     Send("{tab}")
;     Send("^{v}")
;     Send("{Enter}")
;     Send("{Enter}")
; }