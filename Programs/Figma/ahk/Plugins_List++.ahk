menu_img_path_list := "img\"


; Create the window.
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
settings_file := "Plugins_List.ini"
;~ IniWrite "this is a new value", settings_file, "section2", "key" 1
;~ IniWrite imagesarr, settings_file, "√руппа", "ключь"

arr_Plugin := []
SectionNames := IniRead(settings_file)

;~ For key, value in Value
    ;~ MsgBox key " = " value
;~ MsgBox Value "`n`n" Section "`n`n" SectionNames
Loop parse, SectionNames, "`n", "`r"
{
    SectionNames_lp := A_LoopField
    
    Line_Result := IniRead(settings_file, SectionNames_lp)
    Loop parse, Line_Result, "`n", "`r"
    {
        KeyLine_Result := A_LoopField
        KeyName_Result := StrSplit(KeyLine_Result, "=")
                        KeyName_Result := KeyName_Result[1]
                        Key_Result := IniRead(settings_file, SectionNames_lp, KeyName_Result)
                        ;~ KeySplit_Result := StrSplit(Key_Result, "|")
                        
                            arr_Plugin.Push(SectionNames_lp) ; push Category
                            arr_Plugin.Push(KeyName_Result) ; push key Name

                        Loop parse, Key_Result, "|"
                        {
                            KeySplit_Result := A_LoopField
                            arr_Plugin.Push(KeySplit_Result) ; push others values
                        }
                
    }
                            
                            
                            
                    ;~ #1
                    ;~ TestString := "This is a test."
                    ;~ word_array := StrSplit(TestString, A_Space, ".")  ; Omits periods.
                    ;~ MsgBox("The 4th word is " word_array[4])



                    ;~ #2
                    ;~ Colors := "red,green,blue"
                    ;~ For i, color in StrSplit(Colors, ",")
                        ;~ MsgBox "Color number " i " is " color


        
        
        
        
        
    
    
    ;~ Table_Result := MsgBox(A_LoopField )
    
}
until Table_Result = "No"

                for k, v in arr_Plugin
                       MsgBox v


ImageListID := IL_Create(images_arr.Length)  ; Create an ImageList with initial capacity for 10 icons.
LV.SetImageList(ImageListID)  ; Assign the above ImageList to the current ListView.


Loop images_arr.Length{
    IL_Add(ImageListID,  images_arr[A_Index], A_Index)
    ;~ IL_Add(ImageListID, menu_img_path_list images_arr[A_Index] ".png",  A_Index)
;~ MsgBox ImageListID
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

Count_list := 10

Utilites_list := ["Mobile Upload", "Find and Replace", "Scripter"]
Count_list := Add_Item_FC( Count_list, Utilites_list, "Utilites")

Component_list := ["Component Utilities / Copy Component", "Component Utilities / Create Component from Layer","Component Utilities / Replace with Component", "Component Utilities / Reset", "FC_plugins"]
Count_list := Add_Item_FC( Count_list, Component_list, "Component")

Icons_list := ["Iconify"]
Count_list := Add_Item_FC( Count_list, Icons_list, "Icons")

Content_list := ["Content Reel", "UI Faces"]
Count_list := Add_Item_FC( Count_list, Content_list, "Content")

Styles_list := ["Х Styles", "Chroma Colors (стили в цвета)", "Match fills to local style", "Regulator", "Text Styles Generator"]
Count_list := Add_Item_FC( Count_list, Styles_list, "Styles")

Fonts_list := ["Better Font Picker", "Typescales", "Font Master"]
Count_list := Add_Item_FC( Count_list, Fonts_list, "Fonts")


Others_list := ["Select Similar", "Similayer", "Lights Off", "Lights On", "Design Lint", "TinyImage JPG/PNG Compressor"]
Count_list := Add_Item_FC( Count_list, Others_list, "Others")


Add_Item_FC(count, list, category){
    Loop list.Length{
        LV.Add(, count, list[A_Index], category)
        count++
    }
    return count
}


LV.ModifyCol  ; Auto-size each column to fit its contents.
LV.ModifyCol(, "Left")  ; For sorting purposes, indicate that column 2 is an integer.

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
