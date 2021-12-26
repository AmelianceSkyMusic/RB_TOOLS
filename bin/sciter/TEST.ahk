; https://quark.sciter.com/
;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance Force
Persistent
; SetKeyDelay -1
; SendMode "Play"
SetKeyDelay 0
; SetMouseDelay 0
SetStoreCapsLockMode 0
SetDefaultMouseSpeed 0
SetWorkingDir A_ScriptDir

!F1::reload

#include CLR.ahk

html_start := '
(
    <!DOCTYPE html>
    <html>
)'
html_end := '
(
    </html>
)'

html_css_start := '
(
<style>
)'
html_css_end := '
(
</style>
)'

html_js_start := '
(
<scrip>
)'
html_js_end := '
(
</scrip>
)'

html_head := FileRead("head.html")
html_body := FileRead("body.html")
html_css := FileRead("style.css")
html_js := FileRead("javascript.js")
html := html_start html_head html_css_start html_css html_css_end html_js_start html_js html_js_end html_body html_end

; CLR_Start("v3.0")
; sci := Clr_LoadLibrary(A_ScriptDir "\SciterSharpWindows_v3.dll")

sci := Clr_LoadLibrary(A_ScriptDir "\SciterSharpWindows.dll")
sciwin := Clr_CreateObject(sci, "SciterSharp.SciterWindow")
sciwin.CreateMainWindow(520, 240)
sciwin.CenterTopLevelWindow()
sciwin.Title := "Using SciterSharp in AutoHotkey"
sciwin.LoadHtml(html)
sciwin.Show()
WinSetStyle "-0xC00000", "A" ; remove caption
WinSetStyle "-0x40000", "A" ; resize
; WinSetStyle "0x1000", "A" ; resize

MouseOnDragArea_FC()
{
    MouseGetPos(&MouseX, &MouseY)
    MouseOnDragArea := (MouseX > 0 and MouseX < A_ScreenWidth) and (MouseY > 0 and MouseY < 64)
    return MouseOnDragArea
}
if MouseOnDragArea_FC() {
    Msg('Move')
}

Escape:: ExitApp()