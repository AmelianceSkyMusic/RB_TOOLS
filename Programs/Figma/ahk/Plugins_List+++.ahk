menu_img_path_list := "img\"

SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.
#include ..\..\MODULES_files\get_array_from_ini.ahk

Gui_List := GuiCreate(,"Plugin List")

;~ Gui.Opt("-0x1c00000", "A") ; bordersline

Gui_List.Opt("+Resize +MinSize200x200 +MaxSize500x720 AlwaysOnTop")
;~ Gui.Opt("+HScroll500")


; Create the ListView with two columns, Name and Size:
Global LV := Gui_List.Add("ListView", "xm r20 w400 vLV", "Num|Name|Category")


; Notify the script whenever the user double clicks a row:
LV.OnEvent("DoubleClick", "FC_plugins_DoubleClick")

LV.Opt("+Report")



;~ ImageListID := IL_Create(10)  ; Create an ImageList to hold 10 small icons.

; Loop 10  ; Load the ImageList with a series of icons from the DLL.
;~ IL_Add(  1, "img/Select Similar 1.jpg", "0xFFFFFF")
;~ IL_Add(  2, "img/Select Similar 1.jpg", "0xFFFFFF")
;~ IL_Add(  3, "img/Select Similar 1.jpg", "0xFFFFFF")
;~ IL_Add(  4, "img/Select Similar 1.jpg", "0xFFFFFF")

;~ IL_Add(  5, menu_img_path_list "Mobile Upload.png") 
;~ IL_Add(  6, menu_img_path_list "Mobile Upload.png") 
;~ IL_Add(  7, menu_img_path_list "Mobile Upload.png") 
;~ IL_Add(  8, menu_img_path_list "Mobile Upload.png") 
;~ IL_Add(  9, menu_img_path_list "Mobile Upload.png") 
;~ IL_Add(  10, menu_img_path_list "Mobile Upload.png") 



sep := "|"
;~ imagesarr := "img\Component Utilities.png" sep "img\Content Reel.png" sep "img\Iconify.png"
images_arr := ["img\Component Utilities.png", "img\Content Reel.png", "img\Iconify.png"]

;~ ImageListID := IL_Create(images_arr.Length)  ; Create an ImageList with initial capacity for 10 icons.
;~ ImageListID := IL_Create([InitialCount := 2, GrowCount := 5, LargeIcons := false]) ; Create an ImageList with initial capacity for 10 icons.
LV.SetImageList(ImageListID)  ; Assign the above ImageList to the current ListView.
;~ MsgBox images_arr.Length
    ImageListID := IL_Create(10)  ; Create an ImageList with initial capacity for 10 icons.
    LV.SetImageList(ImageListID) 
    ;~ IL_Add(ImageListID,  images_arr[1])
    ;~ IL_Add(ImageListID,  images_arr[2])
    ;~ IL_Add(ImageListID,  "img\Content Reel.png", 2)

Loop images_arr.Length{
    ;~ ImageListID := IL_Create([InitialCount := 2, GrowCount := 5, LargeIcons := false]) 
    ;~ ImageListID := IL_Create(images_arr.Length)  ; Create an ImageList with initial capacity for 10 icons.
    ;~ LV.SetImageList(ImageListID) 
    
    
    IL_Add(ImageListID,  images_arr[A_Index])
    
    
    ;~ IL_Add(ImageListID, menu_img_path_list images_arr[A_Index] ".png",  A_Index)
;~ MsgBox ImageListID
}






;~ IniWrite "this is a new value", settings_file, "section2", "key" 1
;~ IniWrite imagesarr, settings_file, "Группа", "ключь"



arr_Plugin := GetArrFromINI_FC("Plugins_List.ini")
;~ arr_Plugin_arg := GetArrFromINI_FC("Plugins_List.ini")
;~ arr_Plugin := arr_Plugin_arg.arr_Plugin

    n := 0
    j := 1
    loop arr_Plugin.Length/4 {
        Add_Item_FC(arr_Plugin[1+n], j, arr_Plugin[3+n], arr_Plugin[4+n],ImageListID)
        n := n + 4
        j++
    }




;~ Loop images_arr.Length{ ; Add rows to the ListView (for demonstration purposes, one for each icon).
    ;~ LV.Add("Icon" . A_Index, A_Index, "n/a")
;~ }

;~ IL_Add(ImageListID, images_arr[1],  1)
;~ IL_Add(ImageListID, images_arr[2],  2)
;~ IL_Add(ImageListID, images_arr[3],  3)

;~ IL_Add(ImageListID, menu_img_path_list images_arr[1] ".png",  1)
;~ IL_Add(ImageListID, menu_img_path_list images_arr[2] ".png",  2)
;~ IL_Add(ImageListID, menu_img_path_list images_arr[3] ".png",  3)



Add_Item_FC(category, count, item_1_plugin_name, item_1_img, ImageListID){
    ;~ Loop arr_Plugin.Length/4 {
    ;~ IconNumber := DllCall("ImageList_ReplaceIcon", "Ptr", ImageListID, "Int", -1, "Ptr", hIcon) + 1
        LV.Add("Icon" count, count, item_1_plugin_name, category)
    ;~ MsgBox count "`n" item "`n" category "`n" img
    ;~ }
}
;~ Add_Item_FC(count, list, category){
    ;~ Loop list.Length{
        ;~ LV.Add(, count, list[A_Index], category)
        ;~ count++
    ;~ }
    ;~ return count
;~ }


LV.ModifyCol  ; Auto-size each column to fit its contents.
LV.ModifyCol(, "Left")  ; Align.
LV.ModifyCol(1, "Integer")  ; For sorting purposes, indicate that column 1 is an integer.

; Apply window events:
Gui_List.OnEvent("Size", "Gui_Size_List")
; Display the window.

Gui_List.OnEvent("Close", "ExitApp")

;~ #2::
Gui_List.Show("AutoSize Center")
;~ return



;~ LV_DoubleClick(LV, RowNumber)
;~ {
    ;~ RowText := LV.GetText(RowNumber)  ; Get the text from the row's first field.
	;~ Run  A_ScriptDir "\" RowText
;~ }

FC_plugins_DoubleClick(LV, RowNumber)
{
    RowText := LV.GetText(RowNumber) 
    ;~ SaveUsedKeyboardLayout()
    ;~ SetEnglishKeyboadLayout()
    WinActivate("ahk_exe Figma.exe")
    WinWaitActive "Figma"
    Sleep 100
    Send "^{vkBF}"
	Sleep 100
    SendInput RowText
    Send "{Enter}"
    ;~ SetUsedKeyboardLayout()
}

;~ Gui_List_Close()
;~ {
    ;~ ExitApp
;~ }

Gui_Size_List(this, MinMax, Width, Height)  ; Expand/Shrink ListView in response to the user's resizing.
{
    if MinMax = -1  ; The window has been minimized. No action needed.
        return
    ; Otherwise, the window has been resized or maximized. Resize the ListView to match.
    this["LV"].Move("W" Width - 20 " H" Height - 20)
}

#If WinActive("Plugin List")
ESC::
    WinClose()
return
