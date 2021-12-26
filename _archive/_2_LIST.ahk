;~ Gui := GuiCreate()  ; Create a GUI window.
;~ LV := Gui.Add("ListView", "h200 w180", "Icon & Number|Description")  ; Create a ListView.
;~ ImageListID := IL_Create(10)  ; Create an ImageList to hold 10 small icons.
;~ LV.SetImageList(ImageListID)  ; Assign the above ImageList to the current ListView.
;~ Loop 10  ; Load the ImageList with a series of icons from the DLL.
    ;~ IL_Add(ImageListID, "shell32.dll", A_Index) 
;~ Loop 10  ; Add rows to the ListView (for demonstration purposes, one for each icon).
    ;~ LV.Add("Icon" . A_Index, A_Index, "n/a")
;~ LV.ModifyCol("Hdr")  ; Auto-adjust the column widths.
;~ Gui.Show

;~ pattern := A_ScriptDir "\*"
;~ n := 15

;~ ; Create a menu.
;~ Fmenu := MenuCreate()

;~ ; Allocate memory for a SHFILEINFOW struct.
;~ fileinfo := BufferAlloc(fisize := A_PtrSize + 688)

;~ Loop Files, pattern, "FD"
;~ {
    ;~ ; Add a menu item for each file.
    ;~ Fmenu.Add A_LoopFileName, (*) => "" ; Do nothing.
    
    ;~ ; Get the file's icon.
    ;~ if DllCall("shell32\SHGetFileInfoW", "WStr", A_LoopFileFullPath
        ;~ , "UInt", 0, "Ptr", fileinfo, "UInt", fisize, "UInt", 0x100)
    ;~ {
        ;~ hicon := NumGet(fileinfo, 0, "Ptr")
        ;~ ; Set the menu item's icon.
        ;~ Fmenu.SetIcon A_Index "&", "HICON:" hicon
        ;~ ; Because we used ":" and not ":*", the icon will be automatically
        ;~ ; freed when the program exits or if the menu or item is deleted.
    ;~ }
;~ }
;~ until A_Index = n
;~ Fmenu.Show

; Create the window.
Gui := GuiCreate()

; Create the ListView with two columns, Name and Size:
LV := Gui.Add("ListView", "r20 w500", "Name|Size (KB)|Type")

; Notify the script whenever the user double clicks a row:
LV.OnEvent("DoubleClick", "LV_DoubleClick")

; Gather a list of file names from a folder and put them into the ListView:
Loop Files, A_ScriptDir "\*.*"
{
    LV.Add(, A_LoopFileName, A_LoopFileSizeKB,A_LoopFileExt)
			;~ if DllCall("shell32\SHGetFileInfoW", "WStr", A_LoopFileFullPath, "UInt", 0, "Ptr", fileinfo, "UInt", fisize, "UInt", 0x100)
		;~ {
			;~ hicon := NumGet(fileinfo, 0, "Ptr")
			;~ ; Set the menu item's icon.
			;~ LV.SetIcon A_Index "&", "HICON:" hicon
			;~ ; Because we used ":" and not ":*", the icon will be automatically
			;~ ; freed when the program exits or if the menu or item is deleted.
		;~ }
}

LV.ModifyCol  ; Auto-size each column to fit its contents.
LV.ModifyCol(2, "Integer")  ; For sorting purposes, indicate that column 2 is an integer.

; Display the window.
Gui.Show

LV_DoubleClick(LV, RowNumber)
{
    RowText := LV.GetText(RowNumber)  ; Get the text from the row's first field.
    ;~ ToolTip("You double-clicked row number " RowNumber ". Text: '" RowText "'")
	Run  A_ScriptDir "\" RowText
}