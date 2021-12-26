#Include Lib/JsRT.ahk

; Unlike TrayTip, this API does not require a tray icon:
#NoTrayIcon

; Toast notifications from desktop apps can only use local image files.
; if !FileExist(A_ScriptDir "\sample.png")
;     Download "https://autohotkey.com/boards/styles/simplicity/theme/images/announce_unread.png"
;     , A_ScriptDir "\sample.png"
; The templates are described here:
;  http://msdn.com/library/windows/apps/windows.ui.notifications.toasttemplatetype.aspx
; toast_template := "toastImageAndText02"
; Image path/URL must be absolute, not relative.
; toast_image := A_ScriptDir "\sample.png"
; Text is an array because some templates have multiple text elements.
; toast_text := ["Hello, world!", "This is the sub-text."]

; For Windows 10.0.16299 (and possibly earlier or later versions), the AppID
; must identify an app which has a shortcut on the Start screen, otherwise
; the notification won't display.  AppIDs for desktop apps seem to be the
; path of the executable, with system/known folders replaced with GUIDs.
; If this doesn't work, the Get-StartApps powershell command can be used to
; get a list of AppIDs on the system.
; This assumes AutoHotkey is installed in the default location:
toast_appid := (A_Is64bitOS ? "{6D809377-6AF0-444b-8957-A3773F02200E}"
        : "{905e63b6-c1bf-494e-b29c-65b732d3d21a}")
    . "\AutoHotkey\AutoHotkey.exe"

; Only the Edge version of JsRT supports WinRT.
js := (JsRT.Edge)()
js.AddObject "yesno", (s) => MsgBox(s, , "y/n") = "yes"

; Enable use of WinRT.  "Windows.UI" or "Windows" would also work.
; js.ProjectWinRTNamespace("Windows.UI.Notifications")
js.ProjectWinRTNamespace("Windows")
; javaScript := A_ScriptDir "\Example_JsRT.js"
code := FileRead("Example_JsRT.js")
; MsgBox code
; MsgBox "'`n(`n" javaScript "`n)'"
; code := '
; (
;     toast = (help) => {
;         return help;
;     }
; )'

try {
    ; Define the toast function.
    js.Exec(code)
    ; Clear all toasts.
    ; js.clearAllToasts(toast_appid)
    ; Show a toast notification.
    js.toast(toast_appid, "help")
} catch as ex {
    try errmsg := ex.stack
    if !errmsg
        errmsg := "Error: " ex.message
    MsgBox errmsg
}
; Note: If the notification wasn't hidden, it will remain after we exit.
ExitApp
























; #Include Lib/JsRT.ahk
; /* Preferred usage:
;       ; Put JsRT.ahk in a Lib folder, then:
;       #Include <JsRT>
;  */

; ; if MsgBox("Use Edge version of JsRT?",, "y/n") = "yes"
; ;     js := (JsRT.Edge)()
; ; else
; ;     js := (JsRT.IE)()

; js := (JsRT.Edge)()

; javaScript := '
; (
;     function ToJS(v) {
;         MsgBox("JScript says foo is " + v.foo);
;         Alert("helo");
;         ToAHK(v);
;         return v;
;     }
; )'

; js.Exec javaScript

; ; Add functions callable by name:
; js.AddObject "MsgBox", MyMsgBox
; js.AddObject "ToAHK", ToAHK

; ; Pass an AutoHotkey object to a JScript function:
; theirObj := js.ToJS(myObj := {foo: "bar"})

; ; ...and check the object it returned to us.
; ; MsgBox "ToJS returned " (myObj=theirObj ? "the original":"a different") " object and foo is " theirObj.foo


; ToAHK(v) {
;     ; MsgBox "ToAHK got " (myObj=v ? "the original":"a different") " object and foo is " v.foo, "ToAHK"
; }

; MyMsgBox(s) {
;     ; MsgBox s, "JsRT"
; }
