borderlessMode(hwnd = "A"){
    WinSet, AlwaysOnTop, On, %hwnd%
    WinSet, Style, -0xC40000, %hwnd%
    if(Errorlevel)
    {
        WinSet, Style, +0xC40000, %hwnd%
        WinSet, AlwaysOnTop, Off, %hwnd%
        WinRestore, %hwnd%
    }
    else
        WinMaximize, %hwnd%
    WinGetPos,,, winw,, %hwnd%
    WinMove, A,,,,% winw + 5
    WinMove, A,,,,% winw
}
F9::borderlessMode()