; AHK2
#SingleInstance ignore 
#If WinActive("ahk_exe obs64.exe")
TraySetIcon "obs.ico", ,1

A_TrayMenu.delete() ; Delete all menu
A_TrayMenu.Add("Suspend", "SuspendScript")  ; Creates a new menu item.
A_TrayMenu.SetIcon("Suspend", "obs.ico")
SuspendScript(ItemName, ItemPos, Menu) {
    Suspend
}

A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Restart", "RestartScript")  ; Creates a new menu item.
A_TrayMenu.SetIcon("Restart", "obs.ico")
RestartScript(ItemName, ItemPos, Menu) {
    Reload
}

A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
A_TrayMenu.SetIcon("Exit", "obs.ico")
ExitScript(ItemName, ItemPos, Menu) {
    ExitApp
}


; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
is_suspended := false
this_program := "OBS Studio"

;~ 0xF0C00419 ; -- RU

;~ 0xF0C10409 ; -- EN

;~ 0xF0A80422 ; --UA

;~ EnLanguageCode := 0x4090409
EnLanguageCode := 0xF0C10409
UsedLanguage := ""

;~ global img_path := "Figma_files\img\"
;~ global ahk_path := "Figma_files\ahk\"

WinGetPos , , win_x, win_y, "A"

SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
#include Figma_files\ahk\Plugins_Menu.ahk
;~ #include Figma_files\ahk\Plugins_List.ahk
;~ #include Figma_files\ahk\Plugins_Tree.ahk

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
SaveUsedKeyboardLayout()
{
  global UsedLanguage
  UsedLanguage := GetKeyboardLayout()
  Msgbox UsedLanguage
}

SetEnglishKeyboadLayout()
{
  global EnLanguageCode
  SetKeyboardLayout(EnLanguageCode)
  Msgbox EnLanguageCode
}

SetUsedKeyboardLayout()
{
  global UsedLanguage
  SetKeyboardLayout(UsedLanguage)
}

GetKeyboardLayout()
{
  ;~ SetFormat, Integer, H
  WinID := WinGetID(A)
  ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
  Return DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
}

SetKeyboardLayout(Language)
{
	;~ PostMessage Msg [, wParam, lParam, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]
  PostMessage 0x50,, Language,, A
}

; -------------------------------------------------------------------------------------------
/*
MouseOnWorkArea_FC( )
{
	MouseGetPos MouseX, MouseY
	MouseOnWorkArea := (MouseX > 240 and MouseX < 1127) and (MouseY > 77 and MouseY < 767)
	return MouseOnWorkArea
}

MouseOnLeftArea_FC( )
{
	MouseGetPos MouseX, MouseY
	MouseOnWorkArea := (MouseX < 240) and (MouseY > 77 and MouseY < 767)
	return MouseOnWorkArea
}

MouseOnRightArea_FC( )
{
	MouseGetPos MouseX, MouseY
	MouseOnWorkArea := (MouseX > 1127) and (MouseY > 77 and MouseY < 767)
	return MouseOnWorkArea
}
*/


; -------------------------------------------------------------------------------------------
#SuspendExempt  ; Exempt the following hotkey from Suspend.
#Esc::
SoundPlay "*-1, WAIT"
if (is_suspended){
	;~ if MsgBox("Script is suspended! `nUnsuspend it?",  this_program, "OC") = "OK" {
		Suspend ;"Toggle"
		SoundPlay "*-1, WAIT"
		is_suspended := false
		Tooltip "script is ON", win_x/2, win_y/2
		Sleep 1000
		Tooltip
	;~ } else {
		;~ SoundPlay "*16, WAIT"
		;~ is_suspended := true
	;~ }
} else {
	;~ if MsgBox("Script is working! `nWill script suspend?", this_program, "OC") = "OK" {
		Suspend ;"Toggle"
		SoundPlay "*-1, WAIT"
		is_suspended := true
		Tooltip "script is OFF", win_x/2, win_y/2
		Sleep 1000
		Tooltip
		;~ Sleep 29000
		;~ Tooltip "script is ON", win_x/2, win_y/2
		;~ Suspend
		;~ Sleep 1000
		;~ Tooltip
	;~ } else {
		;~ SoundPlay "*16, WAIT"
		;~ is_suspended := false
	;~ }
}
return

; -------------------------------------------------------------------------------------------
#vk46:: ; Win+F  - fullscreen

if menu_toggle := !menu_toggle

    {
        handle := DllCall("GetMenu", "Ptr", WinActive("A"))

        DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", 0)
    
    WinSetStyle "-0x1c00000", "A" ; bordersline
        ;~ WinSet, Style, -0x1c00000,  ;CAPTION|DLGFRAME|MAXIMIZE

        hMenu := handle

        WinMaximize
return
    }
    else

    {
        DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", hMenu)
        WinSetStyle "+0x1c00000", "A" ; bordersline
        ;~ WinSet, Style, +0x1c00000,  ;CAPTION|DLGFRAME|MAXIMIZE

        hMenu := 0

WinRestore
        return
    }
;~ WinSetStyle "^0x400000", "A" ; bordersline

;~ WinSetStyle "^0xC00000", "A"
;~ WinSetStyle "^0x80000", "A" ; Icon in Title
;~ WinSetStyle "^0x40000", "A" ; Size change lines
;~ WinSetStyle "^0x20000000", "A" ; Size change lines
return
#SuspendExempt False  ; Disable exemption for any hotkeys/hotstrings below this.
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
{ 
; -------------------------------------------------------------------------------------------
; -----------------------------------INCLUDES-------------------------------------------
; -------------------------------------------------------------------------------------------
#Include MODULES_files\image_functions.ahk
#Include MODULES_files\change_case.ahk
#include MODULES_files\windows_actions.ahk

;~ global img_path := "Figma_files\img\"
;~ global ahk_path := "Figma_files\ahk\"
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------


Numpad7::  ;-- Заставка + музика
Send "{Numpad1}"

Send "{1}" 	;-- Desctop (PotPlayer) ON
;~ Send "{2}"  	;-- Mix/Aux ON
;~ Send "{3}" 	;-- Звук из 1/2 ON
Send "{4}"		;-- Звук из AIMP ON

;~ Send "{q}" 	;-- Desctop (PotPlayer) Off
Send "{w}"  	;-- Mix/Aux Off
Send "{e}" 	;-- Звук из 1/2 Off
;~ Send "{r}"		;-- Звук из AIMP Off

return

Numpad8::  ;--  Сцена камеры
Send "{Numpad2}"

;~ Send "{1}" 	;-- Desctop (PotPlayer) ON
;~ Send "{2}"  	;-- Mix/Aux ON
Send "{3}" 	;-- Звук из 1/2 ON
;~ Send "{4}"		;-- Звук из AIMP ON

Send "{q}" 	;-- Desctop (PotPlayer) Off
Send "{w}"  	;-- Mix/Aux Off
;~ Send "{e}" 	;-- Звук из 1/2 Off
Send "{r}"		;-- Звук из AIMP Off

return

Numpad9:: ;-- Караоке
Send "{Numpad3}"

Send "{1}" 	;-- Desctop (PotPlayer) ON
;~ Send "{2}"  	;-- Mix/Aux ON
Send "{3}" 	;-- Звук из 1/2 ON
;~ Send "{4}"		;-- Звук из AIMP ON

;~ Send "{q}" 	;-- Desctop (PotPlayer) Off
Send "{w}"  	;-- Mix/Aux Off
;~ Send "{e}" 	;-- Звук из 1/2 Off
Send "{r}"		;-- Звук из AIMP Off
return

/*
Send "{1}" 	;-- Desctop (PotPlayer) ON
Send "{2}"  	;-- Mix/Aux ON
Send "{3}" 	;-- Звук из 1/2 ON
Send "{4}"		;-- Звук из AIMP ON

Send "{q}" 	;-- Desctop (PotPlayer) Off
Send "{w}"  	;-- Mix/Aux Off
Send "{e}" 	;-- Звук из 1/2 Off
Send "{r}"		;-- Звук из AIMP Off
*/























; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

/*
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;~ #1:: Run "Figma_files\ahk\Plugins_Menu.ahk"
#2:: Run "Figma_files\ahk\Plugins_List.ahk"
#3:: Run "Figma_files\ahk\Plugins_Tree.ahk"
;~ #include Figma_files\ahk\Plugins_List.ahk
;~ #include Figma_files\ahk\Plugins_Tree.ahk

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
	
#^+vk9::Suspend ; -- Win+Ctrl+Shift+Tab
;~ #^!+s::Suspend
;~ #^!+p::Pause



; -------------------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging. 
MButton:: 
Send "{Space down}"
Sleep 100
Send "{LButton down}"
KeyWait "MButton"
Send "{LButton up}{Space up}"
Return 

;Duplicate ASM
;~ LButton & RButton:: 
;~ send, ^c
;~ send, ^+v
;~ Return 

; -------------------------------------------------------------------------------------------
; --------------------------------IMAGE CLICK------------------------------------------
; -------------------------------------------------------------------------------------------
;~ isImage_FC(img_path)

;~ isImage := isImage_FC()
;~ isImage.img_is
;~ isImage.FoundX
;~ isImage.FoundY
!vkBC:: ;-- Alt+<
;~ isImage1 := isImage_FC(img_path, "text_active.png")
;~ isImage2 := isImage_FC(img_path, "menu_active.png")
;~ if (isImage1.img_is ||  isImage2.img_is){
	;~ Send "{vkBC}"
	;~ return
;~ }
isImageClick_FC(img_path, "Go_to_Master_Component.png", 5, 2)
return

!vkBE:: ;-- Alt+>
;~ isImage1 := isImage_FC(img_path, "img\text_active.png")
;~ isImage2 := isImage_FC(img_path, "menu_active.png")
;~ if (isImage1.img_is ||  isImage2.img_is){
	;~ Send "{vkBE}"
	;~ return
;~ }
isImageClick_FC(img_path, "Return_to_Instance.png", 0, 0)
return

F5:: 
;~ isImage1 := isImage_FC("Figma_files\img\text_active.png")
;~ isImage2 := isImage_FC("Figma_files\img\menu_active.png")
;~ if (isImage1.img_is ||  isImage2.img_is){
	;~ Send "{vkBE}"
	;~ return
;~ }
isImageClick_FC(img_path, "RUN_Present.png", 20, 20)
return

#vk6B:: ;- win+ Add fill color style
;~ Send "+{Tab}"
;~ Sleep 200
isImageClick_FC(img_path, "fill_parameters.png", 182, 21)
Sleep 200
isImageClick_FC(img_path, "color_styles_parameters.png", 190, 20)
;~ Sleep 100
;~ Sendinput "i"
return

#s:: ;- win+ Add fill color style
	layerHide_colorStyleYes_active := isImage_FC(img_path, "layerHide_colorStyleYes.png")
	layerShow_colorStyleYes_active := isImage_FC(img_path, "layerShow_colorStyleYes.png")
	
if (layerHide_colorStyleYes_active.img_is ){
	isImageClick_FC(img_path, "layerHide_colorStyleYes.png", -100, 50)
}else if (layerShow_colorStyleYes_active.img_is ){
	isImageClick_FC(img_path, "layerShow_colorStyleYes.png", -100, 50)
} else {
	return
}
ImageForceClick_FC(img_path, "color_styles_parameters.png", 160, 20)
ImageForceClick_FC(img_path, "edit_style_properties.png", 20, 55)
ImageForceClick_FC(img_path, "eye_dropper_color_palette.png", 5, 5)

;~ Hotkey "Enter", "backReturnLabel"
;~ return

Hotkey "Esc", "emptyLabel", "on"

KeyWait "Esc", "D"
Hotkey "Esc", "off"



isImageClick_FC(img_path, "eye_dropper_color_palette_acive.png", 5, 5)
isImageClick_FC(img_path, "edit_color_opacity_close_button.png", 60, 20)

return

emptyLabel:
return

;~ #s:: ;- win+ Add fill color style
	;~ layerHide_colorStyleYes_active := isImage_FC(img_path, "layerHide_colorStyleYes.png")
	;~ layerShow_colorStyleYes_active := isImage_FC(img_path, "layerShow_colorStyleYes.png")
	
;~ if (layerHide_colorStyleYes_active.img_is ){
	;~ isImageClick_FC(img_path, "layerHide_colorStyleYes.png", -100, 50)
;~ }

;~ if (layerShow_colorStyleYes_active.img_is ){
	;~ isImageClick_FC(img_path, "layerShow_colorStyleYes.png", -100, 50)
;~ }
;~ Sleep 200
;~ isImageClick_FC(img_path, "color_styles_parameters.png", 160, 20)
;~ Sleep 300
;~ isImageClick_FC(img_path, "edit_style_properties.png", 20, 55)
;~ Sleep 200
;~ isImageClick_FC(img_path, "eye_dropper_color_palette.png", 5, 5)


;~ return

;~ ^r:: ;-- rename  layer +enable text tool
	;~ Tooltip "press «Enter» for apply", win_x/2, win_y/2
;~ isImageClick_FC(img_path, "text_unactive.png", 0, 0)
;~ Send "^{r}"
;~ KeyWait "Enter", "D"
;~ Tooltip , , ,
;~ Send "{v}"
;~ return

;~ F4::
;~ If (A_PriorHotKey = "F4" AND A_TimeSincePriorHotkey < 500)
;~ {
	;~ Send, +{End}
	;~ KeyWait, F1
	;~ ToolTip "Hotkey"
;~ }
;~ return

;------ Change proportional width and height
$+Enter::
$+NumpadEnter::
if NOT MouseOnRightArea_FC()
{
	Send "+{enter}"
} else {
	isImage_width_input_active := isImage_FC(img_path, "width_input_active.png")
	isImage_height_input_active := isImage_FC(img_path, "height_input_active.png")
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
return

;------ Change proportional width and height and turn on constrain proportions
$^+Enter::
$^+NumpadEnter::
if NOT MouseOnRightArea_FC()
{
	Send "^+{enter}"
} else {
	isImage_width_input_active := isImage_FC(img_path, "width_input_active.png")
	isImage_height_input_active := isImage_FC(img_path, "height_input_active.png")
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
	isImageClick_FC(img_path, "constrain_proportions_off.png", 0, 0)
}
return

$^Enter::
$^NumpadEnter::
if NOT MouseOnRightArea_FC()
{
	Send "^{enter}"
} else {
	isImage_width_input_active := isImage_FC(img_path, "width_input_active.png")
	isImage_height_input_active := isImage_FC(img_path, "height_input_active.png")
	if (isImage_width_input_active.img_is){
		Send "^{a}"
		Send "^{c}"
		Send "^{z}"
		isImageClick_FC(img_path, "constrain_proportions_off.png", 2, 5)
		isImageClick_FC(img_path, "width_input_leter.png", 40, 10)
		Send "^{a}"
		Send "^{v}"
		Send "{enter}"
	} else if (isImage_height_input_active.img_is){
		Send "^{a}"
		Send "^{c}"
		Send "^{z}"
		isImageClick_FC(img_path, "constrain_proportions_off.png", 2, 5)
		isImageClick_FC(img_path, "height_input_leter.png", 40, 10)
		Send "^{a}"
		Send "^{v}"
		Send "{enter}"
	}
}
return

; -------------------------------------------------------------------------------------------
; -------------------------------INPUT HOTKEYS---------------------------------------
; -------------------------------------------------------------------------------------------
;~ ^!m::
	;~ Send "^{vkBF}"
	;~ SendInput "EasyMask"
	;~ Send "{Enter}"
;~ return
^!m::FC("EasyMask")

^!i::FC( "Match fills to local style")

#vkC0::FC( "ViewFinder") ;win+`

; -------------------------------------------------------------------------------------------
; -------------------------------REMAP HOTKEYS-------------------------------------
; -------------------------------------------------------------------------------------------
F1:: ; -- show hide layers
Send "^+{\}"
return

^!Numpad0:: ; -- show hide layers
Send "^+{e}"
return
*/

/*
^/:: ;-- Ctrl+/
;~ SaveUsedKeyboardLayout()
SetEnglishKeyboadLayout()
;~ WinGetPos , , win_x, win_y, "A"
;~ Tooltip "press «Enter» for apply", win_x/2, win_y/2
Send "^{vkBF}" ; --  Ctrl+/
;~ KeyWait "Enter", "D"
;~ Tooltip , , ,
;~ Send "{v}"
;~ SetUsedKeyboardLayout()
return
*/
; -------------------------------------------------------------------------------------------
; ------------------------------CUSTOM ACTION--------------------------------------
; -------------------------------------------------------------------------------------------
/*
;----- Move object in more distance
+^UP:: ;--Shift+Ctrl+UP
Loop 10
Send "+{UP}"
return

+^RIGHT:: ;--Shift+Ctrl+RIGHT
Loop 10
Send "+{RIGHT}"
return

+^DOWN:: ;--Shift+Ctrl+DOWN
Loop 10
Send "+{DOWN}"
return

+^LEFT:: ;--Shift+Ctrl+LEFT
Loop 10
Send "+{LEFT}"
return
; -------------------------------------------------------------------------------------------
^i::
Send "i"
KeyWait "LButton", "D" 
Sleep 200
isImage_toolbar_move_active := isImage_FC(img_path, "toolbar_move_active.png")
if (isImage_toolbar_move_active.img_is){
	FC( "Match fills to local style")
}
return

; -------------------------------------------------------------------------------------------
;Zoom in - Switches Ctrl+Wheelup with Wheelup 
Wheelup:: 
if MouseOnWorkArea_FC() ; if mouse in on a work area then zoom in with switched  zoon
{
	Send "{Ctrl down}"
	Send "{Wheelup}"
	Send "{Wheelup}"
	Send "{Ctrl up}"
	return
}
Send "{Wheelup}"					; else just scroll
return

;Zoom out - Switches Ctrl+Wheeldown with Wheeldown 
Wheeldown:: 
if MouseOnWorkArea_FC()
{
	Send "{Ctrl down}"
	Send "{Wheeldown}"
	Send "{Wheeldown}"
	Send "{Ctrl up}"
	return
}
Send "{Wheeldown}"
return
*/
; -------------------------------------------------------------------------------------------
;Colour inactive element of shape ASM
;~ RButton:: 
;~ Send "x"
;~ Send "{LButton down}{LButton up}"
;~ Send "x"
;~ return
/*
;Duplicate
~LButton & RButton:: 
Send "{Alt down}"
KeyWait "LButton"
Send "{Alt up}"
return

;Del ASM
~RButton & LButton:: 
Send "{Delete}"
return

;Align Horizontal ASM
!c::
Send "!{vk48}"
;~ Sendinput "{vk43}"
return

;Align Vertical ASM
!e::
Send "!{vk56}"
;~ Sendinput "{vk45}"
return
*/
/*
;Align Left ASM
l::
isImage1 := isImage_FC("Figma_files\img\text_active.png")
isImage2 := isImage_FC("Figma_files\img\menu_active.png")
if (isImage1.img_is ||  isImage2.img_is){
	Send "{vk4C}"
	return
}
Send "!{vk41}"
;~ Sendinput "{vk4C}"
return

;Align Right ASM
r::
isImage1 := isImage_FC("Figma_files\img\text_active.png")
isImage2 := isImage_FC("Figma_files\img\menu_active.png")
if (isImage1.img_is ||  isImage2.img_is){
	Send "{vk52}"
	return
}
Send "!{vk44}"
;~ Sendinput "{vk52}"
return

;Align Top ASM
t::
isImage1 := isImage_FC("Figma_files\img\text_active.png")
isImage2 := isImage_FC("Figma_files\img\menu_active.png")
if (isImage1.img_is ||  isImage2.img_is){
	Send "{vk54}"
	return
}
Send "!{vk57}"
;~ Sendinput "{vk54}"
return

;Align Button ASM
b::
isImage1 := isImage_FC("Figma_files\img\text_active.png")
isImage2 := isImage_FC("Figma_files\img\menu_active.png")
if (isImage1.img_is ||  isImage2.img_is){
	Send "{vk42}"
	return
}
Send "!{vk53}"
;~ Sendinput "{vk42}"
return
*/

;Duplicate ASM
;vk4C::
;Send "{F9}"
;return

;~ #vk51::
;~ WinActivate("Adobe Illustrator 2019")
;~ win_text := WinGetText("Adobe Illustrator 2019")
;~ If InStr(win_text, "character")
	;~ MsgBox "Ouyeah"
;~ else
	;~ MsgBox "no"
;~ MsgBox  win_text
;~ return




; -------------------------------------------------------------------------------------------
; --------------------------------FUNCTIONS-------------------------------------------
; -------------------------------------------------------------------------------------------
/*
FC(Command)
{
    ;~ SaveUsedKeyboardLayout()
    ;~ SetEnglishKeyboadLayout()
    Send "^{vkBF}"
	isImage := isImageForce_FC(img_path, "menu_search_fragment.png")
	if not isImage
		return
	;~ loop {
	;~ } until isImageClick_FC(img_path, "menu_active.png", 10, 10)
	;~ Sleep 100
    SendInput Command
    Send "{Enter}"
    ;~ SetUsedKeyboardLayout()
}
*/
/*
; -------------------------------------------------------------------------------------------
;~ "Figma_files\img\text_active.png")
isImage_FC(img_path)
{
	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path) 
			img_is:= true
		else
			img_is := false
	;~ Mousemove FoundX, FoundY
	return {img_is : img_is, FoundX:FoundX, FoundY:FoundY}
}

isImageClick_FC(img_path, plus_x, plus_y)
{
	MouseGetPos start_xpos, start_ypos
	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path) {
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
}

;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"