#HotIf WinActive("ahk_exe Studio One.exe")

SetTitleMatchMode "RegEx"
CoordMode "Mouse", "Screen"

; Constants
kShift := 0x4
kControl := 0x8
kNone := 0x0

sensX := ""
sensY := ""

; Default Values
If (sensX = "") {
    sensX := 4
}

If (sensY = "") {
    sensY := 4
}


CheckWin() {
    MouseGetPos ,, &wndControl
    ProcessName := WinGetProcessName("ahk_id" wndControl)
    ProcessName := StrLower(ProcessName)
    If (ProcessName = "studio one.exe") {
    return true
    }
    return false
}

IDC_ARROW := 32512
IDC_IBEAM := 32513
IDC_WAIT := 32514
IDC_CROSS := 32515
IDC_UPARROW := 32516
IDC_SIZE := 32640
IDC_ICON := 32641
IDC_SIZENWSE := 32642
IDC_SIZENESW := 32643
IDC_SIZEWE := 32644
IDC_SIZENS := 32645
IDC_SIZEALL := 32646
IDC_NO := 32648
IDC_HAND := 32649
IDC_APPSTARTING := 32650
IDC_HELP := 32651

#HotIf CheckWin()
MButton:: {
    IDC_SIZEALL := 32646
	CursorHandle := DllCall( "LoadCursor", "Uint", 0, "Int", IDC_SIZEALL)
	Cursors := 32512,32513,32514,32515,32516,32640,32641,32642,32643,32644,32645,32646,32648,32649,32650,32651
    Loop parse, Cursors, "``"
	{
		DllCall( "SetSystemCursor", "Uint", CursorHandle, "Int", A_Loopfield)
	}
    global lastX, lastY, startX, startY, dragWnd
    MouseGetPos(&lastX, &lastY)
    MouseGetPos(&startX, &startY, &dragWnd)
    SetTimer timer_fc, 10
}

MButton Up:: {
    SetTimer timer_fc, 0
    SPI_SETCURSORS := 0x57
	DllCall( "SystemParametersInfo", "UInt", SPI_SETCURSORS, "UInt", 0, "UInt", 0, "UInt", 0)
        ; h_cursor := DllCall("CopyImage"
        ;     , "Ptr", visible ? handles.default : handles.blank
        ;     , "UInt", 2, "Int", 0, "Int", 0, "UInt", 0)
        ; DllCall("SetSystemCursor")
}


#HotIf
PostMW(hWnd, delta, modifiers, x, y)
{
    CoordMode "Mouse", "Screen"
    PostMessage(0x20A, delta << 16 | modifiers, y << 16 | x ,, "A")
}

timer_fc() {
    global lastX, lastY
    MouseGetPos(&curX, &curY)
    dX := (curX - lastX)
    dY := (curY - lastY)
    scrollX := dX * sensX
    scrollY := dY * sensY

    If (dX != 0) {
        PostMW(dragWnd, scrollX, kShift, startX, startY)
    }
    If (dY != 0) {
        PostMW(dragWnd, scrollY, kNone, startX, startY)
    }

    lastX := curX
    lastY := curY
}
