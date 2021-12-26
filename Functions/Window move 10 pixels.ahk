;# Win   ! Alt   ^ Ctrl   + Shift
A_IconHidden := false
TraySetIcon "asm.ico", ,1

A_TrayMenu.delete() ; Delete all menu
A_TrayMenu.Add("Suspend", "SuspendScript")  ; Creates a new menu item.
; A_TrayMenu.SetIcon("Suspend", "figma.ico")
SuspendScript(ItemName, ItemPos, Menu) {
    Suspend
}

A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Restart", "RestartScript")  ; Creates a new menu item.
; A_TrayMenu.SetIcon("Restart", "figma.ico")
RestartScript(ItemName, ItemPos, Menu) {
    Reload
}

A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
; A_TrayMenu.SetIcon("Exit", "figma.ico")
ExitScript(ItemName, ItemPos, Menu) {
    ExitApp
}
; -------------------------------------------------------------------------------------------
; ---------- Win+Arrows — Подвинуть активное окно на 10 пкс
; Move active of window on 10px
DetectHiddenWindows 1

#UP::
{
    WinGetPos win_x, win_y, win_w, win_h, "A"
    WinWaitActive "A"
    WinMove win_x,  win_y-10
}

#DOWN::
{
    WinGetPos win_x, win_y, win_w, win_h, "A"
    WinWaitActive "A"
    WinMove win_x,  win_y+10
}

#LEFT::
{
    WinGetPos win_x, win_y, win_w, win_h, "A"
    WinWaitActive "A"
    WinMove win_x-10,  win_y
}

#RIGHT::
{
    WinGetPos win_x, win_y, win_w, win_h, "A"
    WinWaitActive "A"
    WinMove win_x+10,  win_y
}