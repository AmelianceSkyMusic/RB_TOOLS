;# Win   ! Alt   ^ Ctrl   + Shift
~RWin::
{
    if (A_PriorHotkey != "~RWin" or A_TimeSincePriorHotkey > 400)
    {
        ; Too much time between presses, so this isn't a double-press.
        KeyWait "RWin"
        WinShow("ahk_class Shell_TrayWnd")
        return
    }

    if WinExist("ahk_class Shell_TrayWnd") {
        WinHide("ahk_class Shell_TrayWnd")
	} else {
        WinShow("ahk_class Shell_TrayWnd")
	}

    ; ABS_ALWAYSONTOP   := 2
    ; ABS_AUTOHIDE      := 1
    ; ABM_GETSTATE      := 4
    ; ABM_SETSTATE      := 10
    ; Pointer32bit      := 4
    ; Pointer64bit      := 8
    ; PtrOffSet         := A_PtrSize = Pointer32bit ? 32:40
    ; RequestedCapacity := A_PtrSize = Pointer32bit ? 36:48

    ; Parameter := % A_Args[1] %

    ; VarSetCapacity(APPBARDATA, RequestedCapacity)
    ; SHBarState := DllCall("Shell32\SHAppBarMessage", "UInt", ABM_GETSTATE, "Ptr", &APPBARDATA, "Int")

    ; if Parameter = hide
    ; {
    ;     NumPut(ABS_AUTOHIDE, APPBARDATA, PtrOffSet)
    ; }
    ; else
    ;     if Parameter = show
    ;     {
    ;         NumPut(ABS_ALWAYSONTOP, APPBARDATA, PtrOffSet)
    ;     }
    ;     else
    ;     {
    ;         NumPut(SHBarState ? ABS_ALWAYSONTOP:ABS_AUTOHIDE, APPBARDATA, PtrOffSet)
    ;     }

    ; DllCall("Shell32\SHAppBarMessage", "UInt", ABM_SETSTATE, "Ptr", &APPBARDATA)

    ; ExitApp
}





