#include CLR.ahk
; FileRead html, main.html
html := FileRead("main.html")

sci := Clr_LoadLibrary(A_ScriptDir "\SciterSharpWindows.dll")
sciwin := Clr_CreateObject(sci, "SciterSharp.SciterWindow")
sciwin.CreateMainWindow(400, 300)
sciwin.CenterTopLevelWindow()
sciwin.Title := "Using SciterSharp in AutoHotkey"
sciwin.LoadHtml(html)
sciwin.Show()

Escape:: ExitApp()