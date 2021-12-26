/*
;~ ; Create the popup menu by adding some items to it.
menu_img_path := "Figma_files\ahk\img\"
zoom_icon := 16

Menu_1 := MenuCreate()

; ---------------------------------------------------------------------
Menu_1.Add "Х Utilites:", "FC_plugins"
Menu_1.Disable("Х Utilites:")

Menu_1.Add "Mobile Upload", "FC_plugins"
Menu_1.SetIcon "Mobile Upload", menu_img_path "Mobile Upload.png",,zoom_icon

Menu_1.Add "Find and Replace", "FC_plugins"
Menu_1.SetIcon "Find and Replace", menu_img_path "Find and Replace.png",,zoom_icon

Menu_1.Add "Scripter", "FC_plugins"
Menu_1.SetIcon "Scripter", menu_img_path "Scripter.png",,zoom_icon


; ---------------------------------------------------------------------
Menu_1.Add  ; Add a separator line.
Menu_1.Add  ; Add a separator line.
Menu_1.Add "Х Component:", "FC_plugins"
Menu_1.Disable("Х Component:")


Menu_1.Add "Component Utilities / Copy Component", "FC_plugins"
Menu_1.SetIcon "Component Utilities / Copy Component", menu_img_path "Component Utilities.png",,zoom_icon

Menu_1.Add "Component Utilities / Create Component from Layer", "FC_plugins"
Menu_1.SetIcon "Component Utilities / Create Component from Layer", menu_img_path "Component Utilities.png",,zoom_icon

Menu_1.Add "Component Utilities / Replace with Component", "FC_plugins"
Menu_1.SetIcon "Component Utilities / Replace with Component", menu_img_path "Component Utilities.png",,zoom_icon

Menu_1.Add "Component Utilities / Reset", "FC_plugins"
Menu_1.SetIcon "Component Utilities / Reset", menu_img_path "Component Utilities.png",,zoom_icon



; ---------------------------------------------------------------------
Menu_1.Add  ; Add a separator line.
Menu_1.Add  ; Add a separator line.
Menu_1.Add "Х Icons:", "FC_plugins"
Menu_1.Disable("Х Icons:")


Menu_1.Add "Iconify", "FC_plugins"
Menu_1.SetIcon "Iconify", menu_img_path "Iconify.png",,zoom_icon

Menu_1.Add "Icons8", "FC_plugins"
Menu_1.SetIcon "Icons8", menu_img_path "Icons8.png",,zoom_icon



; ---------------------------------------------------------------------
Menu_1.Add  ; Add a separator line.
Menu_1.Add  ; Add a separator line.
Menu_1.Add "Х Content:", "FC_plugins"
Menu_1.Disable("Х Content:")



Menu_1.Add "Content Reel", "FC_plugins"
Menu_1.SetIcon "Content Reel", menu_img_path "Content Reel.png",,zoom_icon
Menu_1.Add "UI Faces", "FC_plugins"
Menu_1.SetIcon "UI Faces", menu_img_path "UI Faces.png",,zoom_icon



; ---------------------------------------------------------------------
Menu_1.Add  ; Add a separator line.
Menu_1.Add  ; Add a separator line.
Menu_1.Add "Х Styles:", "FC_plugins"
Menu_1.Disable("Х Styles:")



;~ Menu_1.Add "Chroma Colors (стили в цвета)", "FC_plugins"
Menu_1.Add "", ""
;~ Menu_1.SetIcon "Chroma Colors (стили в цвета)", menu_img_path "Chroma Colors.png",,zoom_icon
Menu_1.SetIcon "", menu_img_path "Chroma Colors.png",,zoom_icon

Menu_1.Add "Match fills to local style", "FC_plugins"
Menu_1.SetIcon "Match fills to local style", menu_img_path "Match fills to local style.png",,zoom_icon

Menu_1.Add "Regulator", "FC_plugins"
Menu_1.SetIcon "Match fills to local style", menu_img_path "Match fills to local style.png",,zoom_icon

Menu_1.Add "Text Styles Generator", "FC_plugins"
Menu_1.SetIcon "Text Styles Generator", menu_img_path "Text Styles Generator.png",,zoom_icon



; ---------------------------------------------------------------------
Menu_1.Add  ; Add a separator line.
Menu_1.Add  ; Add a separator line.
Menu_1.Add "Х Fonts:", "FC_plugins"
Menu_1.Disable("Х Fonts:")



Menu_1.Add "Better Font Picker", "FC_plugins"
Menu_1.SetIcon "Better Font Picker", menu_img_path "Better Font Picker.png",,zoom_icon

Menu_1.Add "Typescales", "FC_plugins"
Menu_1.SetIcon "Typescales", menu_img_path "Typescales.png",,zoom_icon

Menu_1.Add "Font Master", "FC_plugins"
Menu_1.SetIcon "Font Master", menu_img_path "Font Master.png",,zoom_icon

;~ Menu_1.Add "Typescales", "FC_plugins"



; ---------------------------------------------------------------------
;~ Menu_1.Add  ; Add a separator line.
;~ Menu_1.Add  ; Add a separator line.
;~ Menu_1.Add "Х Objects:", "FC_plugins"
;~ Menu_1.Disable("Х Objects:")

;~ Menu_1.Add "Select Similar", "FC_plugins"
;~ Menu_1.Add "Similayer", "FC_plugins"



; ---------------------------------------------------------------------
Menu_1.Add  ; Add a separator line.
Menu_1.Add  ; Add a separator line.
Menu_1.Add "Х Others:", "FC_plugins"
Menu_1.Disable("Х Others:")

; Create another menu destined to become a submenu of the above menu.
Submenu_Others := MenuCreate()

Submenu_Others.Add "Select Similar", "FC_plugins"
Submenu_Others.SetIcon "Select Similar", menu_img_path "Select Similar.png",,zoom_icon

Submenu_Others.Add "Similayer", "FC_plugins"
Submenu_Others.SetIcon "Similayer", menu_img_path "Similayer.png",,zoom_icon

Submenu_Others.Add "Lights Off", "FC_plugins"

Submenu_Others.Add "Lights On", "FC_plugins"

Submenu_Others.Add "Design Lint", "FC_plugins"
Submenu_Others.SetIcon "Design Lint", menu_img_path "Design Lint.png",,zoom_icon

Submenu_Others.Add "TinyImage JPG/PNG Compressor", "FC_plugins"



; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
Menu_1.Add "TESTED", Submenu_Others





;~ MyMenu.Add "Item 2", "MenuHandler"
;~ MyMenu.Add  ; Add a separator line.

; Allocate memory for a SHFILEINFOW struct.
;~ fileinfo := BufferAlloc(fisize := A_PtrSize + 688)

	;~ Loop Files, pattern, "FD"
	;~ {

		;~ MyMenu.add A_LoopFileName, "Open_FC"
		
		;~ if DllCall("shell32\SHGetFileInfoW", "WStr", A_LoopFileFullPath, "UInt", 0, "Ptr", fileinfo, "UInt", fisize, "UInt", 0x100)
		;~ {
			;~ hicon := NumGet(fileinfo, 0, "Ptr")
			;~ ; Set the menu item's icon.
			;~ MyMenu.SetIcon A_Index "&", "HICON:" hicon
			;~ ; Because we used ":" and not ":*", the icon will be automatically
			;~ ; freed when the program exits or if the menu or item is deleted.
		;~ }
	;~ }


return  ; End of script's auto-execute section.

FC_plugins(Item, *)
{
    ;~ SaveUsedKeyboardLayout()
    ;~ SetEnglishKeyboadLayout()
    Send "^{vkBF}"
	Sleep 100
    SendInput Item
    Send "{Enter}"
    ;~ SetUsedKeyboardLayout()
}

#1:: Menu_1.Show  ; i.e. press the Win-Z hotkey to show the menu.
*/


