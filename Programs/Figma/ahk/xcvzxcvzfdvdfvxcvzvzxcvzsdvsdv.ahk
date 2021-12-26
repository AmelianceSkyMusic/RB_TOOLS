
; Create a GUI window:
Gui := GuiCreate("+Resize")  ; Allow the user to maximize or drag-resize the window.

; Create some buttons:
B1 := Gui.Add("Button", "Default", "Load a folder")
B2 := Gui.Add("Button", "x+20", "Clear List")
B3 := Gui.Add("Button", "x+20", "Switch View")

; Create the ListView and its columns via Gui Add:
LV := Gui.Add("ListView", "xm r20 w700 vLV", "Name|In Folder|Size (KB)|Type")
LV.ModifyCol(3, "Integer")  ; For sorting, indicate that the Size column is an integer.

; Create an ImageList so that the ListView can display some icons:
ImageListID1 := IL_Create(10)
ImageListID2 := IL_Create(10, 10, true)  ; A list of large icons to go with the small ones.

; Attach the ImageLists to the ListView so that it can later display the icons:
LV.SetImageList(ImageListID1)
LV.SetImageList(ImageListID2)

; Apply control events:
LV.OnEvent("DoubleClick", "RunFile")
LV.OnEvent("ContextMenu", "ShowContextMenu")
B1.OnEvent("Click", Func("LoadFolder").bind(ImageListID1, ImageListID2))
B2.OnEvent("Click", (*) => LV.Delete())
B3.OnEvent("Click", "SwitchView")

; Apply window events:
Gui.OnEvent("Size", "Gui_Size")

; Display the window:
Gui.Show()

LoadFolder(ImageListID1, ImageListID2, this, *)
{
    static IconMap := Map()
    LV := this.Gui["LV"]
    this.Gui.Opt("+OwnDialogs")  ; Forces user to dismiss the following dialog before using main window.
    Folder := DirSelect(, 3, "Select a folder to read:")
    if not Folder  ; The user canceled the dialog.
        return

    ; Check if the last character of the folder name is a backslash, which happens for root
    ; directories such as C:\. If it is, remove it to prevent a double-backslash later on.
    if SubStr(Folder, -1, 1) = "\"
        Folder := SubStr(Folder, 1, -1)  ; Remove the trailing backslash.

    ; Calculate buffer size required for SHFILEINFO structure.
    sfi_size := A_PtrSize + 688
    sfi := BufferAlloc(sfi_size)

    ; Gather a list of file names from the selected folder and append them to the ListView:
    LV.Opt("-Redraw")  ; Improve performance by disabling redrawing during load.
    Loop Files, Folder "\*.*"
    {
        FileName := A_LoopFilePath  ; Must save it to a writable variable for use below.

        ; Build a unique extension ID to avoid characters that are illegal in variable names,
        ; such as dashes. This unique ID method also performs better because finding an item
        ; in the array does not require search-loop.
        SplitPath(FileName,,, FileExt)  ; Get the file's extension.
        if FileExt ~= "^(EXE|ICO|ANI|CUR)$"
        {
            ExtID := FileExt  ; Special ID as a placeholder.
            IconNumber := 0  ; Flag it as not found so that these types can each have a unique icon.
        }
        else  ; Some other extension/file-type, so calculate its unique ID.
        {
            ExtID := 0  ; Initialize to handle extensions that are shorter than others.
            Loop 7     ; Limit the extension to 7 characters so that it fits in a 64-bit value.
            {
                ExtChar := SubStr(FileExt, A_Index, 1)
                if not ExtChar  ; No more characters.
                    break
                ; Derive a Unique ID by assigning a different bit position to each character:
                ExtID := ExtID | (Ord(ExtChar) << (8 * (A_Index - 1)))
            }
            ; Check if this file extension already has an icon in the ImageLists. If it does,
            ; several calls can be avoided and loading performance is greatly improved,
            ; especially for a folder containing hundreds of files:
            IconNumber := IconMap.Has(ExtID) ? IconMap[ExtID] : 0
        }
        if not IconNumber  ; There is not yet any icon for this extension, so load it.
        {
            ; Get the high-quality small-icon associated with this file extension:
            if not DllCall("Shell32\SHGetFileInfoW", "Str", FileName
            , "Uint", 0, "Ptr", sfi, "UInt", sfi_size, "UInt", 0x101)  ; 0x101 is SHGFI_ICON+SHGFI_SMALLICON
                IconNumber := 9999999  ; Set it out of bounds to display a blank icon.
            else ; Icon successfully loaded.
            {
                ; Extract the hIcon member from the structure:
                hIcon := NumGet(sfi, 0)
                ; Add the HICON directly to the small-icon and large-icon lists.
                ; Below uses +1 to convert the returned index from zero-based to one-based:
                IconNumber := DllCall("ImageList_ReplaceIcon", "Ptr", ImageListID1, "Int", -1, "Ptr", hIcon) + 1
                DllCall("ImageList_ReplaceIcon", "Ptr", ImageListID2, "Int", -1, "Ptr", hIcon)
                ; Now that it's been copied into the ImageLists, the original should be destroyed:
                DllCall("DestroyIcon", "Ptr", hIcon)
                ; Cache the icon to save memory and improve loading performance:
                IconMap[ExtID] := IconNumber
            }
        }

        ; Create the new row in the ListView and assign it the icon number determined above:
        LV.Add("Icon" . IconNumber, A_LoopFileName, A_LoopFileDir, A_LoopFileSizeKB, FileExt)
    }
    LV.Opt("+Redraw")  ; Re-enable redrawing (it was disabled above).
    LV.ModifyCol()  ; Auto-size each column to fit its contents.
    LV.ModifyCol(3, 60)  ; Make the Size column at little wider to reveal its header.
}

SwitchView(this, *)
{
    static IconView
    LV := this.Gui["LV"]
    if not IconView
        LV.Opt("+Icon")        ; Switch to icon view.
    else
        LV.Opt("+Report")      ; Switch back to details view.
    IconView := not IconView   ; Invert in preparation for next time.
}

RunFile(LV, RowNumber)
{
    FileName := LV.GetText(RowNumber, 1) ; Get the text of the first field.
    FileDir := LV.GetText(RowNumber, 2)  ; Get the text of the second field.
    try Run(FileDir "\" FileName)
    if A_LastError
        MsgBox("Could not open " FileDir "\" FileName ".")
}

ShowContextMenu(LV, Item, IsRightClick, X, Y)  ; In response to right-click or Apps key.
{
    ; Create the popup menu to be used as the context menu:
    static ContextMenu := MenuCreate()
    ContextMenu.Add("Open", "OpenOrProperties")
    ContextMenu.Add("Properties", "OpenOrProperties")
    ContextMenu.Add("Clear from ListView", "ClearRows")
    ContextMenu.Default := "Open"  ; Make "Open" a bold font to indicate that double-click does the same thing.
    ; Show the menu at the provided coordinates, X and Y.  These should be used
    ; because they provide correct coordinates even if the user pressed the Apps key:
    ContextMenu.Show(X, Y)

    OpenOrProperties(ItemName, *)  ; The user selected "Open" or "Properties" in the context menu.
    {
        FileName := LV.GetText(Item, 1) ; Get the text of the first field.
        FileDir := LV.GetText(Item, 2)  ; Get the text of the second field.
        if (ItemName = "Open")  ; User selected "Open" from the context menu.
            try Run(FileDir "\" FileName)
        else
            try Run("properties " FileDir "\" FileName)
        if A_LastError
            MsgBox("Could not perform requested action on " FileDir "\" FileName ".")
    }

    ClearRows(*)  ; The user selected "Clear" in the context menu.
    {
        RowNumber := 0  ; This causes the first iteration to start the search at the top.
        Loop
        {
            ; Since deleting a row reduces the RowNumber of all other rows beneath it,
            ; subtract 1 so that the search includes the same row number that was previously
            ; found (in case adjacent rows are selected):
            RowNumber := LV.GetNext(RowNumber - 1)
            if not RowNumber  ; The above returned zero, so there are no more selected rows.
                break
            LV.Delete(RowNumber)  ; Clear the row from the ListView.
        }
    }
}

Gui_Size(this, MinMax, Width, Height)  ; Expand/Shrink ListView in response to the user's resizing.
{
    if MinMax = -1  ; The window has been minimized. No action needed.
        return
    ; Otherwise, the window has been resized or maximized. Resize the ListView to match.
    this["LV"].Move("W" Width - 20 " H" Height - 40)
}

