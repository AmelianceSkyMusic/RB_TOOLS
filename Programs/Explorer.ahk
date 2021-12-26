#HotIf WinActive("ahk_exe explorer.exe")
; send selected file to telegram
F1:: {
    ClipboardTemp := ClipboardAll()
    A_Clipboard := ""

    Send("^{c}")
    ClipWait(1)
    ; Sleep 1000
    WinActivate("ahk_exe Telegram.exe")
    WinWait("ahk_exe Telegram.exe", , 3)
    Send("^{v}")
    Sleep 500
    Send("{Enter}")

    A_Clipboard := ClipboardTemp
}

; send selected file to telegram and its name as text
#r:: {

    winExplorerID := WinGetID("A")

    ClipboardTemp := ClipboardAll()
    A_Clipboard := ""

    Send("{F2}")
    Send("^{c}")
    ClipWait(1)
    ClipboardText := A_Clipboard
    Send("{Esc}")

    Send("^{c}")
    ClipWait(1)
    WinActivate("ahk_exe Telegram.exe")
    WinWait("ahk_exe Telegram.exe", , 3)
    Send("^{v}")
    Sleep 1000
    Send ClipboardText
    Send("{Enter}")

    A_Clipboard := ClipboardTemp

    Sleep 300
    WinActivate winExplorerID
}

; Send folder name to teletram and create link on post
#e:: {
    ClipboardTemp := ClipboardAll()
    A_Clipboard := ""

    Send("{F2}")
    Send("^{c}")
    ClipWait(1)
    Sleep 500
    Send("{Esc}")
    IB := InputBox("Please enter a phone number.", "Phone Number", "w80 h80")
    if IB.Result = "Cancel" {
        return
    } else {
        num := IB.value
        sleep 500
        WinActivate("ahk_exe Telegram.exe")
        WinWait("ahk_exe Telegram.exe", , 3)
        Send("• ")
        Send("^{v}")
        Send("^{a}")
        Send("^{c}")
        ClipWait(1)
        sleep 500
        ClipboardText := A_Clipboard
        sleep 500
        A_Clipboard := ""
        Send("^{b}")
        Send("^{Home}")
        
        SendInput("____________________________________")
        Send("^{enter}")
        SendInput("____________________________________")
        Send("^{enter}")
        SendInput("____________________________________")
        Send("^{enter}")
        SendInput("____________________________________")
        Send("^{enter}")
        SendInput("____________________________________")
        Send("^{enter}")
        SendInput("____________________________________")
        Send("^{enter}")
        SendInput("____________________________________")
        Send("^{enter}")
        SendInput("____________________________________")
        Send("^{enter}")

        SendInput("{#}course {#}курс " num)
        Send("^{enter}")
        Send("{enter}")

        Sleep 500

        CoordMode "Mouse", "Window"
        MouseMove 355, 575
        Sleep 300
        Send("{RButton}")
        Sleep 100
        Send("{Up}")
        Send("{Up}")
        Send("{Up}")
        Send("{Up}")
        Send("{Enter}")
        Sleep 500
        Send("^{k}")
        Sleep 500
        Send ClipboardText
        Send("{tab}")
            ; Sleep 100
        Send("^{v}")
        Send("{Enter}")
Sleep 500
        Send("^{a}")
        Sleep 500
        Send("^{c}")
        Sleep 500
        ClipWait(1)
        Sleep 500
        Send("{BackSpace}")
        Sleep 500

        ; Sleep 500
        ; Send("{Enter}")

        Sleep 300
        Send("^{NumPad0}")
        Send("{Up}")
        Send("^{End}")
        Send("^{Enter}")
        Send num " "
        Send("^{v}")
        Sleep 500
        Send("{Enter}")
    }


    A_Clipboard := ClipboardTemp
    CoordMode "Mouse", "Screen"
    
}

#t:: {
    telegram := "ahk_exe Telegram.exe"
    if WinExist(telegram) {
        winExplorerID := WinGetID("A")

        ClipboardTemp := ClipboardAll()
        A_Clipboard := ""

        Send("{F2}")
        Send("^{c}")
        ClipWait(1)
        Send("{Esc}")



        ; Send "^{Insert}"
        ; Sleep 300
        if !IsSpace(A_Clipboard) {
            ClipboardText := A_Clipboard


            Send("^{c}")
            ClipWait(1)
            if !IsSpace(A_Clipboard) {
                ; WinActivate("ahk_exe Telegram.exe")
                ; WinWait("ahk_exe Telegram.exe", , 3)
                ; Send("^{v}")
                ; Sleep 1000
                ; Send ClipboardText
                ; Send("{Enter}")
                try {
                    WinActivate(telegram)
                    if WinWaitActive(telegram, , 3) {
                        Send("^{v}")
                        Sleep 1000
                        Send ClipboardText
                        Send("{Enter}")
                    }
                } catch TargetError
                    Say "Can't activate the Telegram",,,,,"ERR"
                ; else
                ;     Msg "Nothing to paste.`nNo selection",,,,,"ERR"

            } else {
                Say "Nothing in Clipboard", , , , , "ERR"
            }
        } else {
            Say "Nothing in Clipboard", , , , , "ERR"
        }
    } else {
        Say "The Telegram isn't opened",,,,,"ERR"
    }
    A_Clipboard := ClipboardTemp
    Sleep 1000
    WinActivate winExplorerID
}