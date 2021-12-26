#HotIf WinActive("ahk_exe Studio One.exe")

MButton:: {
    IDC_SIZEALL := 32646
	CursorHandle := DllCall( "LoadCursor", "Uint", 0, "Int", IDC_SIZEALL)
	Cursors := 32512,32513,32514,32515,32516,32640,32641,32642,32643,32644,32645,32646,32648,32649,32650,32651
    Loop parse, Cursors, "``"
	{
		DllCall( "SetSystemCursor", "Uint", CursorHandle, "Int", A_Loopfield)
	}
	Send("{MButton Down}")
}

MButton Up:: {
    SPI_SETCURSORS := 0x57
	DllCall( "SystemParametersInfo", "UInt", SPI_SETCURSORS, "UInt", 0, "UInt", 0, "UInt", 0)
	    Send("{MButton Up}")
}
