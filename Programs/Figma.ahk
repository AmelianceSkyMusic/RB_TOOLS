;# Win   ! Alt   ^ Ctrl   + Shift

#HotIf (WinActive("ahk_exe Figma.exe") or WinActive("ahk_exe Figma Beta.exe")) and not WinActive("ahk_class #32770")

;~ 0xF0C00419 ; -- RU
;~ 0xF0C10409 ; -- EN
;~ 0xF0A80422 ; --UA
EnLanguageCode := 0xF0C10409
UsedLanguage := ""
fg := {}
fg.name := "Figma"
fg.interfaceScale := "100"
fg.menuFolder := A_ScriptDir "\Programs\Figma\Menu"
fg.img_path := A_ScriptDir "\Programs\Figma\img" "_" fg.interfaceScale "\"

fg.menu := createMenu("Figma", fg.menuFolder)

; ProgramMenu := createMenu("Programs", A_ScriptDir "\Menus\")

~LShift::
{
    if mt("LShift") = 2 {
        ; PostMessage 0x0050, 0, 0x4090409, , "A"	; US 0x0050 is WM_INPUTLANGCHANGEREQUEST
        fg.menu.Show()
        sleep 1000
    }
}

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
#include Figma\ahk\Plugins_Menu.ahk
;~ #include Figma_files\ahk\Plugins_List.ahk
;~ #include Figma_files\ahk\Plugins_Tree.ahk

; -------------------------------------------------------------------------------------------
; ---------------------------------- CHECK MOUSE AREA ---------------------------------------
; -------------------------------------------------------------------------------------------
MouseOnWorkArea_FC( )
{
	MouseGetPos(&MouseX, &MouseY)
	MouseOnWorkArea := (MouseX > 240 and MouseX < 1127) and (MouseY > 77 and MouseY < 767)
	return MouseOnWorkArea
}

MouseOnLeftArea_FC( )
{
	MouseGetPos(&MouseX, &MouseY)
	MouseOnWorkArea := (MouseX < 240) and (MouseY > 77 and MouseY < 767)
	return MouseOnWorkArea
}

MouseOnRightArea_FC( )
{
	MouseGetPos(&MouseX, &MouseY)
	MouseOnWorkArea := (MouseX > 1127) and (MouseY > 77 and MouseY < 767)
	return MouseOnWorkArea
}

; -------------------------------------------------------------------------------------------
; -----------------------------------INCLUDES-------------------------------------------
; -------------------------------------------------------------------------------------------
; #Include MODULES_files\image_functions.ahk
; index := {}
; index.scriptDir := A_ScriptDir
; asdfasdf := index.scriptDir "\MODULES_files\windows_actions.ahk"
; MsgBox asdfasdf
#include %A_InitialWorkingDir%\MODULES_files\windows_actions.ahk


;~ global fg.img_path := "Figma_files\img\"
;~ global fg.ahk_path := "Figma_files\ahk\"


; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;~ #1:: Run "Figma_files\ahk\Plugins_Menu.ahk"
#2:: Run "Figma\ahk\Plugins_List_OLD.ahk"
; #3:: Run "Figma_files\ahk\Plugins_Tree.ahk"
#4:: Run "Figma\ahk\Plugins_List.ahk"
;~ #include Figma_files\ahk\Plugins_List.ahk
;~ #include Figma_files\ahk\Plugins_Tree.ahk

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; ------------------------------------- HOTKEYS ---------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

+!c::Send "+{h}" ; flip horizontal
+!e::Send "+{v}" ; flip vertical

F1::Send "^+{\}" ; -- show hide layers
^!Numpad0::Send "^+{e}" ; -- show hide layers

; -------------------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging.
MButton::
{
	Send "{Space down}"
	Sleep 100
	Send "{LButton down}"
	KeyWait "MButton"
	Send "{LButton up}{Space up}"
}

;Duplicate ASM
;~ LButton & RButton::
;~ send, ^c
;~ send, ^+v
;~ Return

; -------------------------------------------------------------------------------------------
; --------------------------------IMAGE CLICK------------------------------------------
; -------------------------------------------------------------------------------------------
;~ isImage_FC(fg.img_path)
;~ isImage := isImage_FC()
;~ isImage.img_is
;~ isImage.FoundX
;~ isImage.FoundY
; ---------- Go To main Component ----------
#x::isImageClick_FC(fg.img_path, "go_to_main_component.png", 5, 5)

; ---------- Return To Instance ----------
#z::isImageClick_FC(fg.img_path, "return_to_instance.png", 0, 0)

; ---------- Run Present (Run Prototype) ----------
F9::isImageClick_FC(fg.img_path, "run_present.png", 20, 20)

; ---------- Add fill color style ----------
#NumpadAdd::
{
	;~ Send "+{Tab}"
	;~ Sleep 200
	isImageClick_FC(fg.img_path, "fill_bar.png", 164, 20)
	Sleep 200
	isImageClick_FC(fg.img_path, "color_style_bar.png", 176, 16)
	;~ Sleep 100
	;~ Sendinput "i"
}

; ---------- Add fill color style ----------
#s::
{
	MouseGetPos(&start_xpos, &start_ypos)
	layer_hide__color_style_yes := isImage_FC(fg.img_path, "layer_hide__color_style_yes.png")
	layer_show__color_style_yes := isImage_FC(fg.img_path, "layer_show__color_style_yes.png")
	if (layer_hide__color_style_yes.img_is){
		isImageClick_FC(fg.img_path, "layer_hide__color_style_yes.png", -100, 66, 1, false)
	}else if (layer_show__color_style_yes.img_is ){
		isImageClick_FC(fg.img_path, "layer_show__color_style_yes.png", -100, 66, 1, false)
	} else {
		MouseMove start_xpos, start_ypos
		Say("Select object with style and try again")
		return
	}
	; }
	; isImageWaitForImgClick_FC(fg.img_path, "color_styles_parameters.png", 160, 20)
	color_style_bar := isImageWaitForImg_FC(fg.img_path, "color_style_bar.png")

	isImageWaitForImgClick_FC(fg.img_path, "selected_style.png", 160, 20, 2, false, , , color_style_bar.FoundX-100, color_style_bar.FoundY-100)
	; if color_style_bar.img_is {
	; 	Say(color_style_bar.FoundX)
	; 	isImageWaitForImgClick_FC(fg.img_path, "selected_style.png", 160, 20) ;, false, 50, 1000, color_style_bar.FoundX, color_style_bar.FoundY)

		isImageWaitForImgClick_FC(fg.img_path, "edit_style_properties.png", 20, 45, 1, false)
		isImageWaitForImgClick_FC(fg.img_path, "eye_dropper_color_palette.png", 5, 5, 1, false)
		MouseMove start_xpos, start_ypos

		KeyWait "LButton", "D"  ; Wait for the left mouse button to be pressed down.
		; Send "Esc"
		Send "{Esc}"
		Sleep 100
		Send "{Esc}"
		Sleep 100
		Send "{Esc}"
}

;------ Change proportional width and height
$+Enter::
$+NumpadEnter::
{
	if NOT MouseOnRightArea_FC()
	{
		Send "+{enter}"
	} else {
		isImage_width_input_active := isImage_FC(fg.img_path, "width_input_active.png")
		isImage_height_input_active := isImage_FC(fg.img_path, "height_input_active.png")
		if (isImage_width_input_active.img_is){
			Send "^{a}"
			Send "^{c}"
			Send "{tab}"
			Send "^{v}"
			Send "{enter}"
		} else if (isImage_height_input_active.img_is){
			Send "^{a}"
			Send "^{c}"
			Send "+{tab}"
			Send "^{v}"
			Send "{enter}"
		}
	}
}

;------ Change proportional width and height and turn on constrain proportions
$^+Enter::
$^+NumpadEnter::
{
	if NOT MouseOnRightArea_FC()
	{


		Send "^+{enter}"
	} else {
		isImage_width_input_active := isImage_FC(fg.img_path, "width_input_active.png")
		isImage_height_input_active := isImage_FC(fg.img_path, "height_input_active.png")
		if (isImage_width_input_active.img_is){
			Send "^{a}"
			Send "^{c}"
			Send "{tab}"
			Send "^{v}"
			Send "{enter}"
		} else if (isImage_height_input_active.img_is){
			Send "^{a}"
			Send "^{c}"
			Send "+{tab}"
			Send "^{v}"
			Send "{enter}"
		}
		isImageClick_FC(fg.img_path, "constrain_proportions_off.png", 0, 0)
	}
}

$^Enter::
$^NumpadEnter::
{
	if NOT MouseOnRightArea_FC()
	{
		Send "^{enter}"
	} else {
		isImage_width_input_active := isImage_FC(fg.img_path, "width_input_active.png")
		isImage_height_input_active := isImage_FC(fg.img_path, "height_input_active.png")
		if (isImage_width_input_active.img_is){
			Send "^{a}"
			Send "^{c}"
			Send "^{z}"
			isImageClick_FC(fg.img_path, "constrain_proportions_off.png", 2, 5)
			isImageClick_FC(fg.img_path, "width_input_leter.png", 40, 10)
			Send "^{a}"
			Send "^{v}"
			Send "{enter}"
		} else if (isImage_height_input_active.img_is){
			Send "^{a}"
			Send "^{c}"
			Send "^{z}"
			isImageClick_FC(fg.img_path, "constrain_proportions_off.png", 2, 5)
			isImageClick_FC(fg.img_path, "height_input_leter.png", 40, 10)
			Send "^{a}"
			Send "^{v}"
			Send "{enter}"
		}
	}
}

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; ---------------------------------------INPUT HOTKEYS---------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
^!m::RunCommand_FC("EasyMask")
#vkC0::RunCommand_FC("ViewFinder") ;win+`


F5::RunCommand_FC("Union Selection")
F6::RunCommand_FC("Subtract Selection")
F7::RunCommand_FC("Intersect Selection")
F8::RunCommand_FC("Exclude Selection")

!r::RunCommand_FC("Rotate 90° right")
!h::RunCommand_FC("Pack horizontal")
!v::RunCommand_FC("Pack vertical")


^!i::RunCommand_FC( "Match fills to local style")
#i::
{
	Send("i")
	KeyWait "LButton", "D"  ; Wait for the left mouse button to be pressed down.
	RunCommand_FC( "Match fills to local style")
}

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -----------------------------------MULTI INPUT HOTKEYS-------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; $v::
; {
; 	if (ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200) {
; 		RunCommand_FC("Set Layer Size")
; 		; Msg("1")
; 	} else {
; 		Send "{v}"
; 		; Msg("2")
; 	}
; }

$^v::
{
	switch l := mt("v") {
		case -1: Msg "long"
		case 1: Send "^{v}"
		case 2: fg_isImageRightClick(fg.img_path, "paste_here.png")
		default: Send "^{v}"
	}
}

$^s::
{
	switch l := mt("s") {
		case -1: Msg "long"
		case 1: Send "^{s}"
		case 2: RunCommand_FC("Set Layer Size")
		case 3: RunCommand_FC("Proportional Scale")
		case 4: Msg "чотыре"
		default: Send "^{s}"
	}
}

; s::
; {
; 	if (ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200) {
; 		RunCommand_FC("Proportional Scale")
; 		; Msg("1")
; 	} else {
; 		Send "{s}"
; 		; Msg("2")
; 	}
; }

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; ----------------------       --------CUSTOM ACTION-----------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;----- Move object in more distance
+^UP:: ;--Shift+Ctrl+UP
{
	Loop 10
	Send "+{UP}"
}

+^RIGHT:: ;--Shift+Ctrl+RIGHT
{
	Loop 10
	Send "+{RIGHT}"
}

+^DOWN:: ;--Shift+Ctrl+DOWN
{
	Loop 10
	Send "+{DOWN}"
}

+^LEFT:: ;--Shift+Ctrl+LEFT
{
	Loop 10
	Send "+{LEFT}"
}
; -------------------------------------------------------------------------------------------
^i::
{
	Send "i"
	KeyWait "LButton", "D"
	Sleep 200
	isImage_toolbar_move_active := isImage_FC(fg.img_path, "toolbar_move_active.png")
	if (isImage_toolbar_move_active.img_is){
		RunCommand_FC( "Match fills to local style")
	}
}

; -------------------------------------------------------------------------------------------
; ;Zoom in - Switches Ctrl+Wheelup with Wheelup
; $Wheelup::
; {
; 	if MouseOnWorkArea_FC() ; if mouse in on a work area then zoom in with switched  zoon
; 	{
; 		Send "{Ctrl down}"
; 		Send "{Wheelup}"
; 		Send "{Wheelup}"
; 		Send "{Ctrl up}"
; 		return
; 	}
; 	Send "{Wheelup}"					; else just scroll
; }

; ;Zoom out - Switches Ctrl+Wheeldown with Wheeldown
; $Wheeldown::
; {
; 	if MouseOnWorkArea_FC()
; 	{
; 		Send "{Ctrl down}"
; 		Send "{Wheeldown}"
; 		Send "{Wheeldown}"
; 		Send "{Ctrl up}"
; 		return
; 	}
; 	Send "{Wheeldown}"
; }

; -------------------------------------------------------------------------------------------
;Colour inactive element of shape ASM
;~ RButton::
;~ Send "x"
;~ Send "{LButton down}{LButton up}"
;~ Send "x"
;~ return

;Duplicate
~LButton & RButton::
{
	Send "{Alt down}"
	KeyWait "LButton"
	Send "{Alt up}"
}

;Del ASM
~RButton & LButton::
{
	Send "{Delete}"
}

;Align Horizontal ASM
!c::Send "!{vk48}"
	;~ Sendinput "{vk43}"

;Align Vertical ASM
!e::Send "!{vk56}"
	;~ Sendinput "{vk45}"





; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; ------------------------------------- FUNCTIONS -------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; Run string
RunCommand_FC(Command)
{
    ;~ SaveUsedKeyboardLayout()
    ;~ SetEnglishKeyboadLayout()
    Send "^p"

	ClipSaved := ClipboardAll()
	A_Clipboard := Command
	img := isImageWaitForImg_FC(fg.img_path, "menu_search_fragment.png", 485, 130, 530, 180)

	if img.img_is = 1 {
		Send "^v"
		Send "{Enter}"
		Sleep 200
		A_Clipboard := ClipSaved
	} else {
		return
	}

}

; ----- TEST -----!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#w::{
	Msg fg.img_path "menu_search_fragment.png"
	isImage_FC(fg.img_path, "menu_search_fragment.png", 470, 120, 570, 180)
}

/*
; -------------------------------------------------------------------------------------------
;~ "Figma_files\img\text_active.png")
isImage_FC(fg.img_path)
{
	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, fg.img_path)
			img_is:= true
		else
			img_is := false
	;~ Mousemove FoundX, FoundY
	return {img_is : img_is, FoundX:FoundX, FoundY:FoundY}
}

isImageClick_FC(fg.img_path, plus_x, plus_y)
{
	MouseGetPos(&start_xpos, &start_ypos)
	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, fg.img_path) {
			img_is:= true
	} else {
			img_is := false
			return img_is
	}
	;~ MouseMove FoundX, FoundX, 1
	;~ MsgBox img_is
	FoundX := FoundX + plus_x
	FoundY := FoundY + plus_y
	MouseClick left, FoundX, FoundY, 1, 1
	MouseMove start_xpos, start_ypos, 1
	return img_is
}
*/
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;^!z::
;Run, Illustrator.exe A_Desktop\test.jsx
;return
; !!!-------------------------------------------------------------------------------------------!!!
; !!!-------------------------------------------------------------------------------------------!!!
; !!!-----!!!!!------------------------------ GUI ------------------------------------!!!!!-----!!!
; !!!-------------------------------------------------------------------------------------------!!!
; !!!-------------------------------------------------------------------------------------------!!!

; -------------------------------------------------------------------------------------------
; ----------------------------- GUI Figma Interface Scale -----------------------------------
; -------------------------------------------------------------------------------------------
changeScale() {
	figmaInterfaceScale := Gui.New()

	figmaInterfaceScale.MarginX := 16
	figmaInterfaceScale.MarginY := 16

	figmaInterfaceScale.Add("Text", "cCCCCCC section", "Figma scale (%):")  ; Save this control's position and start a new section.
	figmaInterfaceScale.Add("Edit", "vchangedInterfaceScale section ys").value := fg.interfaceScale  ; Start a new column within this section.

	btnOk := figmaInterfaceScale.Add("Button", "default w212 xm hp", "Set Scale")  ; xm puts it at the bottom left corner.
	btnOk.OnEvent("Click", (*) => changeFolder(figmaInterfaceScale))

	; figmaInterfaceScale.OnEvent("Close", "ProcessUserExit")
	; figmaInterfaceScale.OnEvent("Escape", "ProcessUserExit")

	figmaInterfaceScale.BackColor := "333333"
	figmaInterfaceScale.Title := "Figma Interface Scale"
	figmaInterfaceScale.Opt("ToolWindow")
	figmaInterfaceScale.Opt("+E0x40000")

	figmaInterfaceScale.Show()

	WinSetAlwaysOnTop true, "Figma Interface Scale"

	changeFolder(thisGui, *)
	{
		global fg
		sevedElm := thisGui.Submit(false)  ; Save the contents of named controls into an object.
		fg.interfaceScale := sevedElm.changedInterfaceScale
		figmaInterfaceScale.Destroy
		Say("Scale set to: " fg.interfaceScale "%")
		fg.img_path := "Figma\img" "_" fg.interfaceScale "\"
		return
	}

	; ProcessUserExit(thisGui, *) {
	; 	figmaInterfaceScale.Destroy
	; 	Msg(interfaceScale)
	; 	return interfaceScale
	; }
}

~^!+#s::
{
	changeScale()
}

^q::Say("Interface Scale: " fg.interfaceScale "%")

; -------------------------------------------------------------------------------------------
; -------------------------------- GUI Width and Height -------------------------------------
; -------------------------------------------------------------------------------------------
setHeightWeight(w, h, proportionsTemp) {
	figmaInterfaceScale := Gui.New()

	figmaInterfaceScale.MarginX := 16
	figmaInterfaceScale.MarginY := 16

	figmaInterfaceScale.Add("Text", "cCCCCCC section", "W:")  ; Save this control's position and start a new section.
	figmaInterfaceScale.Add("Text", "cCCCCCC", "H:")  ; Save this control's position and start a new section.
	figmaInterfaceScale.Add("Edit", "vw section ys").value := w  ; Start a new column within this section.
	figmaInterfaceScale.Add("Edit", "vh").value := h  ; Start a new column within this section.
	figmaInterfaceScale.Add("CheckBox", "vconstrainProportions cCCCCCC hp", "Constrain Proportions").value := proportionsTemp

	btnOk := figmaInterfaceScale.Add("Button", "default w150 xm hp", "Set Scale")  ; xm puts it at the bottom left corner.
	btnOk.OnEvent("Click", (*) => changeFolder(figmaInterfaceScale))

	; figmaInterfaceScale.OnEvent("Close", "ProcessUserExit")
	; figmaInterfaceScale.OnEvent("Escape", "ProcessUserExit")

	figmaInterfaceScale.BackColor := "333333"
	figmaInterfaceScale.Title := "Set Height And Weight"
	figmaInterfaceScale.Opt("ToolWindow")
	figmaInterfaceScale.Opt("+E0x40000")

	figmaInterfaceScale.Show()

	WinSetAlwaysOnTop true, "Set Height And Weight"

	changeFolder(thisGui, *)
	{

		sevedElm := thisGui.Submit(false)  ; Save the contents of named controls into an object.
		w := sevedElm.w
		h := sevedElm.h
		constrainProportions := sevedElm.constrainProportions
		figmaInterfaceScale.Destroy

		A_Clipboard := w
		isImageClick_FC(fg.img_path, "width_input_unactive.png", 46, 16)
		Send "^v"
		sleep 100

		A_Clipboard := h
		isImageClick_FC(fg.img_path, "height_input_unactive.png", 46, 16)
		Send "^v"
		sleep 100

		Send "{Enter}"

		if constrainProportions {
			isImageClick_FC(fg.img_path, "constrain_proportions_off.png", 16, 16)
		} else {
			isImageClick_FC(fg.img_path, "constrain_proportions_on.png", 16, 16)
		}





		return
	}

	; ProcessUserExit(thisGui, *) {
	; 	figmaInterfaceScale.Destroy
	; 	Msg(interfaceScale)
	; 	return interfaceScale
	; }
}


w::
{

	; MouseClickDrag "left", 0, 200, 600, 400

	if (ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200) {
		; setHeightWeight()

		isImage_width_input_unactive := isImage_FC(fg.img_path, "width_input_unactive.png")
		isImage_width_input_active := isImage_FC(fg.img_path, "width_input_active.png")
		isImage_height_input_unactive := isImage_FC(fg.img_path, "height_input_unactive.png")
		isImage_height_input_active := isImage_FC(fg.img_path, "height_input_active.png")

		isImage_constrain_proportions_on := isImage_FC(fg.img_path, "constrain_proportions_on.png")
		isImage_constrain_proportions_off := isImage_FC(fg.img_path, "constrain_proportions_off.png")


		ClipSaved := ClipboardAll()
		if (isImage_width_input_unactive.img_is || isImage_width_input_active.img_is){
			A_Clipboard := ""
			isImageClick_FC(fg.img_path, "width_input_unactive.png", 46, 16)
			Send "^c"
			ClipWait
			wTemp := A_Clipboard
		}

		if (isImage_height_input_unactive.img_is || isImage_height_input_active.img_is){
			A_Clipboard := ""
			isImageClick_FC(fg.img_path, "height_input_unactive.png", 46, 16)
			Send "^c"
			ClipWait
			hTemp := A_Clipboard
		}

		if (isImage_constrain_proportions_on.img_is) {
			proportionsTemp := 1

		} else if (isImage_constrain_proportions_off.img_is){
			proportionsTemp := 0
		}

		setHeightWeight(wTemp, hTemp, proportionsTemp)
		A_Clipboard := ClipSaved
	} else {
		Send "{w}"
		; Msg("2")
	}

}

#+e::Msg("v")
; #+e::isImageWaitForImgClick_FC(fg.img_path, "text_unactive.png")

fg_isImageRightClick(pth, img, x := 0, y := 0 ){
	Send("{RButton}")
	isImageWaitForImgClick_FC(pth, img, x, y,,,false,,)
	Send("{Enter}")
}

	; ClipSaved := ClipboardAll()
	; A_Clipboard := Command
	; img := isImageWaitForImg_FC(fg.img_path, "menu_search_fragment.png", 0, 0, 300, 300)

	; if img.img_is = 1 {
	; 	Send "^v"
	; 	Send "{Enter}"
	; 	Sleep 200
	; 	A_Clipboard := ClipSaved
	; } else {
	; 	return
	; }



;~ SoundPlay "*-1"
#HotIf (WinActive("ahk_exe Figma.exe") or WinActive("ahk_exe Figma Beta.exe")) and not WinActive("ahk_class #32770") and MouseOnWorkArea_FC()
;Zoom in - Switches Ctrl+Wheelup with Wheelup
$Wheelup::
{
	; if MouseOnWorkArea_FC() ; if mouse in on a work area then zoom in with switched  zoon
	; {
		Send "{Ctrl down}"
		Send "{Wheelup}"
		Send "{Wheelup}"
		Send "{Ctrl up}"
		return
	; }
	; Send "{Wheelup}"					; else just scroll
}

;Zoom out - Switches Ctrl+Wheeldown with Wheeldown
$Wheeldown::
{
	; if MouseOnWorkArea_FC()
	; {
		Send "{Ctrl down}"
		Send "{Wheeldown}"
		Send "{Wheeldown}"
		Send "{Ctrl up}"
	; 	return
	; }
	; Send "{Wheeldown}"
}
