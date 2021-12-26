; https://quark.sciter.com/
; # Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance Force
Persistent
; SetKeyDelay -1
; SendMode "Play"
SetKeyDelay 0
SetWinDelay -1
; SetMouseDelay 0
SetStoreCapsLockMode 0
SetDefaultMouseSpeed 0
SetWorkingDir A_ScriptDir

!F1::reload

#include Lib\CLR.ahk
amazingApp := {}
amazingApp.name := "Amazing App"

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
<script type="text/tiscript">
)'
html_js_end := '
(
</script>
)'

html_head := FileRead("Amazing App\head.html")
html_body := FileRead("Amazing App\body.html")
html_css := FileRead("Amazing App\style.css")
html_js := FileRead("Amazing App\javascript.js")
html := html_start html_head html_css_start html_css html_css_end html_js_start html_js html_js_end html_body html_end

test_file := "test-motion-blur.htm"
test_file := ""
if test_file != "" {
    html := FileRead(test_file)
}


; CLR_Start("v3.0")
; sci := Clr_LoadLibrary(A_ScriptDir "\SciterSharpWindows_v3.dll")

sci := Clr_LoadLibrary(A_ScriptDir "\Bin\SciterSharpWindows.dll")
sciwin := Clr_CreateObject(sci, "SciterSharp.SciterWindow")
sciwin.CreateMainWindow(640, 240)
sciwin.CenterTopLevelWindow()
; sciwin.Title := "Amazing App"
sciwin.LoadHtml(html)
sciwin.Show()



if WinWaitActive(amazingApp.name , , 3) {
    WinSetStyle "-0xC00000", "A" ; remove caption
    WinSetStyle "-0x40000", "A" ; resize
    WinGetPos(&winX, &winY, &winWidth, &winHeight, "A")
    WinSetRegion("0-0 w" winWidth " h" winHeight " r24-24", "A")
}

#HotIf WinActive(amazingApp.name)

MouseInDragArea_FC()
{
    MouseGetPos(&MouseX, &MouseY)
    WinGetPos(,, &Width, &Height,)
    MouseInDragArea := (MouseX > 0 and MouseX < Width) and (MouseY > 0 and MouseY < 24)
    return MouseInDragArea
}

MouseInArea_FC()
{
    MouseGetPos(&MouseX, &MouseY)
    WinGetPos(,, &Width, &Height,)
    MouseInArea := (MouseX > 0 and MouseX < Width) and (MouseY > 0 and MouseY < Height)
    return MouseInArea
}

q::{
    if MouseInArea_FC() {
            WinGetPos(,, &Width, &Height,)
            MsgBox Width " x " Height
    }
}
~LButton::{
    if MouseInDragArea_FC() {
                ; MouseGetPos(&X, &Y)
        CoordMode "Mouse", "Screen"
        MouseGetPos(&startX, &startY)
        moveX := 0
        moveY := 0
        loop {
            WinGetPos(&winX, &winY)
            MouseGetPos(&X, &Y)
            if startX < X {
                moveX := X - startX
                startX := X
            } else if startX > X {
                moveX := X - startX                
                startX := X
            }
            if startY < Y {
                moveY := Y - startY
                startY := Y
            } else if startY > Y {
                moveY := Y - startY                
                startY := Y
            }
            winX := winX + moveX
            winY := winY + moveY
            ; Msg winX " " winY
            WinMove( winX, winY,,,)
            ; Msg "start: " startX " " startY "`n start: " moveX " " moveY
            ; sleep 100
            moveX := 0
            moveY := 0
            if !GetKeyState("LButton", "P")
                break
        }
    }
}


; Escape:: ExitApp()
Escape::{
    if WinExist("Amazing App")
    WinClose
}