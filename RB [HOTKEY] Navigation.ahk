;# Win   ! Alt   ^ Ctrl   + Shift
#HotIf
; navigation
; CapsLock::{
;     Send('{Blind}{CapsLock down}')
;     sleep 5000
;     Send('{Blind}{CapsLock up}')
; }

CapsLock & j::      Send("{Blind}{Left}")
CapsLock & i::      Send("{Blind}{Up}")
CapsLock & l::      Send("{Blind}{Right}")
CapsLock & k::      Send("{Blind}{Down}")
CapsLock & u::      Send("{Blind}{Home}")
CapsLock & o::      Send("{Blind}{End}")
CapsLock & n::      Send("{Blind}{End}{Enter}")

CapsLock & a::      Send("{Blind}{Left}")
CapsLock & w::      Send("{Blind}{Up}")
CapsLock & d::      Send("{Blind}{Right}")
CapsLock & s::      Send("{Blind}{Down}")
CapsLock & q::      Send("{Blind}{Home}")
CapsLock & e::      Send("{Blind}{End}")
CapsLock & z::      Send("{Blind}{BackSpace}")
CapsLock & c::      Send("{Blind}{Del}")
CapsLock & f::      Send("{Blind}{Enter}")

CapsLock & -::      Send("{Blind}{BackSpace}")
CapsLock & +::      Send("{Blind}{Del}")

CapsLock & 2::      Send('{Blind}#{TAB}')
CapsLock & 3::      Send('{Blind}^#{LEFT}')
CapsLock & 4::      Send('{Blind}^#{RIGHT}')

CapsLock & 8::      Send('{Blind}#{TAB}')
CapsLock & 9::      Send('{Blind}^#{LEFT}')
CapsLock & 0::      Send('{Blind}^#{RIGHT}')

CapsLock & ,::      Send('{Blind}^z')
CapsLock & .::      Send('{Blind}^+z')

; #HotIf GetKeyState("Capslock", "T")
;     j::      Send("{Blind}{Left}")
;     i::      Send("{Blind}{Up}")
;     l::      Send("{Blind}{Right}")
;     k::      Send("{Blind}{Down}")
;     u::      Send("{Blind}{Home}")
;     o::      Send("{Blind}{End}")
;     n::      Send("{Blind}{End}{Enter}")

;     a::      Send("{Blind}{Left}")
;     w::      Send("{Blind}{Up}")
;     d::      Send("{Blind}{Right}")
;     s::      Send("{Blind}{Down}")
;     q::      Send("{Blind}{Home}")
;     e::      Send("{Blind}{End}")
;     z::      Send("{Blind}{BackSpace}")
;     c::      Send("{Blind}{Del}")
;     f::      Send("{Blind}{Enter}")

;     -::      Send("{Blind}{BackSpace}")
;     +::      Send("{Blind}{Del}")

;     2::      Send('{Blind}#{TAB}')
;     3::      Send('{Blind}^#{LEFT}')
;     4::      Send('{Blind}^#{RIGHT}')

;     8::      Send('{Blind}#{TAB}')
;     9::      Send('{Blind}^#{LEFT}')
;     0::      Send('{Blind}^#{RIGHT}')





; #HotIf WinActive("ahk_exe explorer.exe")
;   !a:: ;store current folder
;     for item in ComObjCreate("Shell.Application").Windows {
;       if WinExist("A") = item.hwnd {
;         explorerDir := item.document.folder.self.path
;         Break
;       }
;     }
;     Return
; #a::ControlClick("Edit1", "ahk_class #32770")
; #s::{

;     ControlClick("Edit2", "ahk_class #32770", , "LEFT", 1, "NA x10 y10")

;         title := ControlGetText("Edit2", "ahk_class #32770")
;     ; ControlSetText("backupName", "Edit2", "ahk_class #32770")
;     ; title := WinGetTitle("ahk_class #32770")
;     ; ControlSendText("backupName", "Edit2", title)
;     ; title := WinGetTitle("ahk_class #32770")
;     ; EditPaste("backupName", "Edit2", title)
;     ; Send "{enter}"
;     Msg(title)
; }io
#HotIf WinActive("ahk_class #32770")
#d::{
    ; explorerDir := ControlGetText("Edit1", "ahk_exe clover.exe")
    ; Msg(explorerDir)

    backupName := ControlGetText("Edit1", "ahk_class #32770")
    ; ControlFocus("Edit1", "ahk_exe clover.exe")
    path := ControlGetText("Edit1", "ahk_exe clover.exe")
    ; Send "^l{Sleep 50}^a"
    ControlSetText path, (input := ControlGetClassNN(ControlGetFocus("A"))), "A"
    ControlSend "{Enter}", input, "A"
    ControlFocus "Edit1", "A"
}


; #HotIf WinActive("ahk_class #32770")
; !a::{

;     backupName := ControlGetText("Edit1", "ahk_class #32770")
;     ; ControlFocus("Edit1", "ahk_exe clover.exe")
;     explorerDir := ControlGetText("Edit1", "ahk_exe clover.exe")

;     ControlFocus("Edit1", "ahk_class #32770")
;     ControlSetText(explorerDir, "Edit1", "ahk_class #32770")

;     Send "{Enter}"
;     Sleep 100
;     ControlSendText(backupName, "Edit1", "ahk_class #32770")

; }

; #HotIf WinActive("ahk_class #32770")
; !a::{

;     backupName := ControlGetText("Edit1", "ahk_class #32770")
;     explorerDir := ControlGetText("Edit1", "ahk_exe clover.exe")

;     ControlFocus("Edit1", "ahk_class #32770")
;     ControlSetText(explorerDir, "Edit2", "ahk_class #32770")

; }






; !a::{
; ; DetectHiddenText true
;     ; WinActivate("ahk_exe clover.exe")
;     ; if WinWait("ahk_exe clover.exe", , 3)
;     ; {

; ;         FocusedHwnd := ControlGetFocus("A")
; ; FocusedClassNN := ControlGetClassNN(FocusedHwnd)
; ; MsgBox 'Control with focus = {Hwnd: ' FocusedHwnd ', ClassNN: "' FocusedClassNN '"}'

;         ; SetControlDelay -1
;         ; ControlClick("Edit2", "ahk_class #32770")
;     backupName := ControlGetText("Edit1", "ahk_class #32770")
;        explorerDir := ControlGetText("Edit1", "ahk_exe clover.exe")
;     ; }
;     ; WinActivate("ahk_class #32770")
;     ; if WinActive("ahk_class #32770") {
;         ; ControlSendText("", "Edit1", "ahk_class #32770")
;         ControlFocus("Edit1", "ahk_class #32770")
;         ControlSetText(explorerDir, "Edit1", "ahk_class #32770")

;         ; Say("")
;         Send "{Enter}"
;         Sleep 100
;         ControlSendText(backupName, "Edit1", "ahk_class #32770")
;     ; }
;     ; DetectHiddenText false

; }
; #HotIf WinActive("ahk_class #32770")
; !a::{
;     ; global explorerDir := ""
;     ; explorerD := "000"
;     WinActivate("ahk_exe clover.exe")
;     explorerDir := ControlGetText("Edit1", "ahk_exe clover.exe")
;     WinActivate("ahk_class #32770")
;     ControlSetText(explorerDir, "Edit2", "ahk_class #32770")
;     ; for item in ComObjCreate("Shell.Application").Windows {
;     ;     Say(item)
;     ;     if WinExist("A") = item.hwnd {
;     ;     explorerDir := item.document.folder.self.path
;     ;     explorerD := "222"
;     ;     Break
;     ;     }
;     ; }
;     ; if explorerDir != "" {

;         ; Say("+" explorerD)
;     ; } else {
;     ;     Say("ERR" explorerD)
;     ; }

; } ;set current folder, stored from explorer
;     ; ControlSetText explorerDir, "Edit1", "ahk_class #32770"
;     ; Key "!n{Enter}"
;     ; Return
