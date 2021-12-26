menu_img_path_list := "img\"

Gui_Tree := GuiCreate(,"Plugin Tree")
Gui_Tree.Opt("+Resize +MinSize300x200 +MaxSize500x720 AlwaysOnTop")

images_arr := ["Component Utilities", "Content Reel", "Iconify"]

ImageListID := IL_Create(images_arr.Length)  ; Create an ImageList with initial capacity for 10 icons.

Loop images_arr.Length{
    IL_Add(ImageListID, menu_img_path_list images_arr[A_Index] ".png",  A_Index)
;~ MsgBox menu_img_path_list images_arr[A_Index] ".png"
}
;~ Loop 10 { ; Load the ImageList with some standard system icons.
    ;~ IL_Add(ImageListID, menu_img_path_list "Content Reel.png"
;~ }
;~ TV := Gui.Add("TreeView", "ImageList" . ImageListID)
;~ TV.Add("Name of Item", 0, "Icon4")  ; Add an item to the TreeView and give it a folder icon.

TV := Gui_Tree.Add("TreeView", "xm r20 w400 vLV ImageList" . ImageListID)
;~ TV := Gui.Add("TreeView", "xm r20 w400 vLV")
P1 := TV.Add("First parent", 0, "icon1")
P1C1 := TV.Add("Parent 1's first child", P1, 1)  ; Specify P1 to be this item's parent.
P2 := TV.Add("Second parent",,"icon2")
P2C1 := TV.Add("Parent 2's first child", P2, 2)
P2C2 := TV.Add("Parent 2's second child", P2,3)
P2C2C1 := TV.Add("Child 2's first child", P2C2,"icon2")

Gui_Tree.OnEvent("Size", "Gui_Size_Tree")

Gui_Tree.OnEvent("Close", "ExitApp")

;~ #3::
;~ Gui.Show("AutoSize Center")
Gui_Tree.Show()
;~ return

Gui_Size_Tree(this, MinMax, Width, Height)  ; Expand/Shrink ListView in response to the user's resizing.
{
    if MinMax = -1  ; The window has been minimized. No action needed.
        return
    ; Otherwise, the window has been resized or maximized. Resize the ListView to match.
    this["LV"].Move("W" Width - 20 " H" Height - 20)
}

#If WinActive("Plugin Tree")
ESC::
    WinClose()
return


;~ Gui.OnEvent("Close", "myGui_Close")
