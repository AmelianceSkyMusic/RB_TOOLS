Gui := GuiCreate()  ; Create a GUI window.
LV := Gui.Add("ListView", "h200 w180", "Icon & Number|Description")  ; Create a ListView.
ImageListID := IL_Create(10)  ; Create an ImageList to hold 10 small icons.
LV.SetImageList(ImageListID)  ; Assign the above ImageList to the current ListView.
Loop 10  ; Load the ImageList with a series of icons from the DLL.
    IL_Add(ImageListID, "shell32.dll", A_Index) 
Loop 10  ; Add rows to the ListView (for demonstration purposes, one for each icon).
    LV.Add("Icon" . A_Index, A_Index, "n/a")
LV.ModifyCol("Hdr")  ; Auto-adjust the column widths.
Gui.Show