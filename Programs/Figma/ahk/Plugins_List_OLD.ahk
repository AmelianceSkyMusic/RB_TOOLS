#include ..\..\RB [FUNCTION] Functions.ahk

    Global menu_img_path_list := "img\"

    SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.
    #include ..\..\MODULES_files\get_array_from_ini.ahk

    Gui_Plugins_List := Gui.New("","Plugin List")
    ; Gui_Plugins_List.BackColor := "1E1E1E"Gui_Plugins_List.BackColor := "FFFFFE"
    ; Gui_Plugins_List.BackColor := "FFFFFE"
    ; WinSetTransColor("FFFFFE 255", Gui_Plugins_List)

    ;~ Gui.Opt("-0x1c00000", "A") ; bordersline

    Gui_Plugins_List.Opt("+Resize +MinSize200x200 +MaxSize720x720 AlwaysOnTop")
    ;~ Gui.Opt("+HScroll500")


    ; Create the ListView with two columns, Name and Size:
    ;~ Global LV := Gui_Plugins_List.Add("ListView", "xm r20 w720 vLV", "Num","Name",'Category","Key',"Description")
    Global LV := Gui_Plugins_List.Add("ListView", "xm r20 w720 vLV", ["Num","Name",'Category","Key',"Description"])



    ; Notify the script whenever the user double clicks a row:
    LV.OnEvent("ItemFocus", "LV_DoubleClick")
    ; Notify the script whenever the user double clicks a row:
    LV.OnEvent("DoubleClick", "FC_plugins_DoubleClick")

    LV.Opt("+Report")


    ;~ sep := "|"
    ;~ imagesarr := "img\Component Utilities.png" sep "img\Content Reel.png" sep "img\Iconify.png"
    ;~ images_arr := ["img\Component Utilities.png", "img\Content Reel.png", "img\Iconify.png"]
    ;~ LV.SetImageList(ImageListID)  ; Assign the above ImageList to the current ListView.
    ImageListID := IL_Create(10)  ; Create an ImageList with initial capacity for 10 icons.
    LV.SetImageList(ImageListID) 
    


    ;~ Loop images_arr.Length{
        ;~ IL_Add(ImageListID,  images_arr[A_Index])
    ;~ }






    ;~ IniWrite "this is a new value", settings_file, "section2", "key" 1
    ;~ IniWrite imagesarr, settings_file, "������", "�����"



    arr_Plugin := GetArrFromINI_FC("Plugins_List.ini")


        n := 0
        j := 1
        loop arr_Plugin.Length/6{
            Add_Item_FC(arr_Plugin[1+n], j, arr_Plugin[3+n], arr_Plugin[4+n],
                        arr_Plugin[5+n], arr_Plugin[6+n], ImageListID)
            n := n + 6
            j++
        }



    Add_Item_FC(category, count, item_1_plugin_name, item_1_img, item_3_key, item_4_description, ImageListID){
        
        img_url := menu_img_path_list item_1_img
        IL_Add(ImageListID,  img_url)
        LV.Add("Icon" count, count, item_1_plugin_name, category, item_3_key, item_4_description)

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
    Gui_Plugins_List.OnEvent("Size", "Gui_Size_List")
    ; Display the window.

    Gui_Plugins_List.OnEvent("Close", "ExitApp")

    ;~ #2::
    Gui_Plugins_List.Show("AutoSize Center")
    ;~ return


    FC_plugins_DoubleClick(LV,RowNumber)
    {
        RowText := LV.GetText(RowNumber, 2) 

        WinActivate("ahk_exe Figma.exe")
        WinWaitActive "Figma"
        Sleep 100
        Send "^{vkBF}"
        Sleep 100
        SendInput RowText
        Send "{Enter}"

    }


    Gui_Size_List(this, MinMax, Width, Height)  ; Expand/Shrink ListView in response to the user's resizing.
    {
        if MinMax = -1  ; The window has been minimized. No action needed.
            return
        ; Otherwise, the window has been resized or maximized. Resize the ListView to match.
        ;~ this["LV"].Move("W" Width - 20 " H" Height - 20)
        this["LV"].Move(,, Width - 20, Height - 40)
    }

    LV_DoubleClick(LV, RowNumber)
    {
        RowText := LV.GetText(RowNumber)  ; Get the text from the row's first field.
        ToolTip ("You double-clicked row number " RowNumber ". Text: '" RowText "'")
        SetTimer () => ToolTip(), -1000
    }

    #HotIf WinActive("Plugin List")
    ESC:: WinClose()


    ;~ InputChars := "r" ; Store the character for Ctrl-C in the CtrlC var.
    ;~ ih := InputHook("L1")
    ;~ ih.Start()
    ;~ ih.Wait()
    ;~ if (ih.Input = InputChars)
        ;~ MsgBox "You pressed r."
    ;~ return


    MsgBox KeyWaitAny()

    ; Same again, but don't block the key.
    MsgBox KeyWaitAny("V")

    KeyWaitAny(Options:="")
    {
        ih := InputHook(Options)
        ih.KeyOpt("{All}", "ES")  ; End and Suppress
        ih.Start()
        ErrorLevel := ih.Wait()  ; Store EndReason in ErrorLevel
        return ih.EndKey  ; Return the key name
    }
    return


    :*:1::
    {
        MsgBox "123456"
    }

    :*:2::
    {
        
    }

    :*:3::
    {
        
    }

    :*:4::
    {
        
    }

    :*:5::
    {
        
    }

    :*:6::
    {
        
    }

    :*:7::
    {
        
    }

    :*:8::
    {
        
    }

    :*:9::
    {
        
    }

    :*:10::
    {
        
    }

    :*:11::
    {
        
    }

    :*:12::
    {
        
    }

    :*:13::
    {
        
    }

    :*:14::
    {
        
    }

    :*:15::
    {
        
    }

    :*:16::
    {
        
    }

    :*:17::
    {
        
    }

