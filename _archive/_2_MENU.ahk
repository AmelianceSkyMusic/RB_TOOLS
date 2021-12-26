;~ ; Create the popup menu by adding some items to it.
MyMenu := MenuCreate()
pattern := A_ScriptDir "\*.*"

; Allocate memory for a SHFILEINFOW struct.
fileinfo := BufferAlloc(fisize := A_PtrSize + 688)

	Loop Files, pattern, "FD"
	{

		MyMenu.add A_LoopFileName, "Open_FC"

		if DllCall("shell32\SHGetFileInfoW", "WStr", A_LoopFileFullPath, "UInt", 0, "Ptr", fileinfo, "UInt", fisize, "UInt", 0x100)
		{
			hicon := NumGet(fileinfo, 0, "Ptr")
			; Set the menu item's icon.
			MyMenu.SetIcon A_Index "&", "HICON:" hicon
			; Because we used ":" and not ":*", the icon will be automatically
			; freed when the program exits or if the menu or item is deleted.
		}
	}

return  ; End of script's auto-execute section.

Open_FC(Item, *){
	Run  A_ScriptDir "\" Item
}

#NumPad1::MyMenu.Show  ; i.e. press the Win-Z hotkey to show the menu.