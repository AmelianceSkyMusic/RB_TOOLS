;~ ; Create the popup menu by adding some items to it.
MyMenu := MenuCreate()
pattern := A_ScriptDir "\*.*"
;~ MyMenu.Add "Item 1", "MenuHandler"
;~ MyMenu.Add "Item 2", "MenuHandler"
;~ MyMenu.Add  ; Add a separator line.

; Allocate memory for a SHFILEINFOW struct.
fileinfo := BufferAlloc(fisize := A_PtrSize + 688)

	Loop Files, pattern, "FD"
	{
		;~ FileName := A_LoopFileFullPath
		
		 ; Add a menu item for each file.
    ;~ MyMenu.Add A_LoopFileName, (*) => "" ; Do nothing.

		; files := files "`n" A_LoopFileName
		MyMenu.add A_LoopFileName, "Open_FC"
		;~ MyMenu.SetIcon A_LoopFileName, hIcon,, 0
		;~ MyMenu.SetIcon(MenuItemName, FileName [, IconNumber, IconWidth])
		
		
		if DllCall("shell32\SHGetFileInfoW", "WStr", A_LoopFileFullPath, "UInt", 0, "Ptr", fileinfo, "UInt", fisize, "UInt", 0x100)
		{
			hicon := NumGet(fileinfo, 0, "Ptr")
			; Set the menu item's icon.
			MyMenu.SetIcon A_Index "&", "HICON:" hicon
			; Because we used ":" and not ":*", the icon will be automatically
			; freed when the program exits or if the menu or item is deleted.
		}
	}

; Create another menu destined to become a submenu of the above menu.
;~ Submenu1 := MenuCreate()
;~ Submenu1.Add "Item A", "MenuHandler"
;~ Submenu1.Add "Item B", "MenuHandler"

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
;~ MyMenu.Add "My Submenu", Submenu1

;~ MyMenu.Add  ; Add a separator line below the submenu.
;~ MyMenu.Add "Item 3", "MenuHandler"  ; Add another menu item beneath the submenu.
return  ; End of script's auto-execute section.

;~ MenuHandler(Item, *) {
    ;~ MsgBox "You selected " Item
;~ }

Open_FC(Item, *){
	MsgBox A_ScriptDir Item
	Run  A_ScriptDir "\" Item
}

#z::MyMenu.Show  ; i.e. press the Win-Z hotkey to show the menu.






;~ SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.

MyMenu := MenuCreate()
MyMenu.Add "Item 1", "MenuHandler"
MyMenu.Add "Item 2", "MenuHandler"
  ; Add a separator line.

;~ Msgbox list_files(A_ScriptDir)

;~ list_files(Directory)
;~ {
	;~ files :=  ""
	;~ Loop Files, Directory "\*.*"
	;~ {
		;~ ; files := files "`n" A_LoopFileName
		;~ MyMenu.add A_LoopFileName, "MenuHandler"
	;~ }
	;~ return files
;~ }


;~ Colors := "red,green,blue"
;~ Loop Parse, Colors, ","
    ;~ MsgBox "Color number " A_Index " is " A_LoopField

;~ Count := files.Count
;~ Msgbox Count



;~ Loop Files, A_ScriptDir "\*.*", "R"  ; Recurse into subfolders.
;~ {
    ;~ Result := MsgBox("Filename = " A_LoopFilePath "`n`nContinue?",, "y/n")
    ;~ if Result = "No"
        ;~ break
;~ }




;~ FileSelectFolder,Directory,%A_WorkingDir%,, Select Version Folder
;~ FileSelectFolder,User,%A_WorkingDir%,, Select User Folder
;~ Nomatch := 0
;~ Compared := -1
;~ FileAppend, % list_files(Directory), Directory.txt
;~ list_files(Directory)
;~ {
	;~ files =
	;~ Loop %Directory%\*.*
	;~ {
		;~ files = %files%`n%A_LoopFileName%
		;~ FileAppend, `n%A_LoopFileName%, Files.txt
	;~ }
	;~ return files
;~ }

;~ FileAppend, The following files do not match the default installation and may be cause for issues:,  CompareOutput.txt

;~ Loop, read, Files.txt, Files.txt
;~ {
;~ FileRead, var2, %Directory%/%A_LoopReadLine%
;~ FileRead, var1, %User%/%A_LoopReadLine%
;~ Compared := Compared + 1
;~ if (var1 = var2)
;~ {
;~ }
;~ else,
;~ {
;~ FileAppend, `r%User%/%A_LoopReadLine% does not match default install, CompareOutput.txt
;~ Nomatch := Nomatch + 1
;~ }
;~ }
;~ FileDelete, %A_WorkingDir%/Files.txt
;~ FileDelete, %A_WorkingDir%/Directory.txt

;~ if (Nomatch = 0)
;~ {
;~ FileDelete, %A_WorkingDir%/CompareOutput.txt
;~ Msgbox Files compared %Compared%`nAll files matched
;~ }
;~ else,
;~ {
;~ Msgbox Files compared: %Compared%`nFiles that did not match: %Nomatch%`nFiles that did not match in CompareOutput.txt
;~ Msgbox % list_files(A_WorkingDir)
;~ }
;~ Return






;~ FileMenu := MenuCreate()
;~ FileMenu.Add "&Open`tCtrl+O", (*) => FileSelect()  ; See remarks below about Ctrl+O.
;~ FileMenu.Add "E&xit", (*) => ExitApp()
;~ HelpMenu := MenuCreate()
;~ HelpMenu.Add "&About", (*) => MsgBox("Not implemented")
;~ Menus := MenuBarCreate()
;~ Menus.Add "&File", FileMenu  ; Attach the two submenus that were created above.
;~ Menus.Add "&Help", HelpMenu
;~ Gui := GuiCreate()
;~ Gui.MenuBar := Menus
;~ Gui.Show "w300 h200"


;~ ; Create the popup menu by adding some items to it.
;~ MyMenu := MenuCreate()
;~ MyMenu.Add "Item 1", "MenuHandler"
;~ MyMenu.Add "Item 2", "MenuHandler"
;~ MyMenu.Add  ; Add a separator line.

;~ ; Create another menu destined to become a submenu of the above menu.
;~ Submenu1 := MenuCreate()
;~ Submenu1.Add "Item A", "MenuHandler"
;~ Submenu1.Add "Item B", "MenuHandler"

;~ ; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
;~ MyMenu.Add "My Submenu", Submenu1

;~ MyMenu.Add  ; Add a separator line below the submenu.
;~ MyMenu.Add "Item 3", "MenuHandler"  ; Add another menu item beneath the submenu.
;~ return  ; End of script's auto-execute section.

;~ MenuHandler(Item, *) {
    ;~ MsgBox "You selected " Item
;~ }

;~ #z::MyMenu.Show  ; i.e. press the Win-Z hotkey to show the menu.
