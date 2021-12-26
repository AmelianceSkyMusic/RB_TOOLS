;# Win   ! Alt   ^ Ctrl   + Shift

#HotIf WinActive("ahk_exe Lunacy.exe") and not WinActive("ahk_class #32770")

;~ 0xF0C00419 ; -- RU
;~ 0xF0C10409 ; -- EN
;~ 0xF0A80422 ; --UA
EnLanguageCode := 0xF0C10409
UsedLanguage := ""
global lnc := {}
lnc.name := "Lunacy"
lnc.interfaceScale := "100"
lnc.img_path := "Figma_files\img" "_" lnc.interfaceScale "\"

; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
;~ #include Figma_files\ahk\Plugins_List.ahk
;~ #include Figma_files\ahk\Plugins_Tree.ahk

; -------------------------------------------------------------------------------------------
; ---------------------------------- CHECK MOUSE AREA ---------------------------------------
; -------------------------------------------------------------------------------------------
; lnc.MouseOnWorkArea_FC( )
; {
; 	MouseGetPos(&MouseX, &MouseY)
; 	lnc.MouseOnWorkArea := (MouseX > 240 and MouseX < 1127) and (MouseY > 77 and MouseY < 767)
; 	return lnc.MouseOnWorkArea
; }

; lnc.MouseOnLeftArea_FC( )
; {
; 	MouseGetPos(&MouseX, &MouseY)
; 	global MouseOnWorkArea := (MouseX < 240) and (MouseY > 77 and MouseY < 767)
; 	return lnc.MouseOnWorkArea
; }

; lnc.MouseOnRightArea_FC( )
; {
; 	MouseGetPos(&MouseX, &MouseY)
; 	lnc.MouseOnWorkArea := (MouseX > 1127) and (MouseY > 77 and MouseY < 767)
; 	return lnc.MouseOnWorkArea
; }

; -------------------------------------------------------------------------------------------
; -----------------------------------INCLUDES-------------------------------------------
; -------------------------------------------------------------------------------------------
; #Include MODULES_files\image_functions.ahk
#include %A_InitialWorkingDir%\MODULES_files\windows_actions.ahk

;~ global lnc.img_path := "Figma_files\img\"
;~ global lnc.ahk_path := "Figma_files\ahk\"


; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------


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
;~ isImage_FC(lnc.img_path)
;~ isImage := isImage_FC()
;~ isImage.img_is
;~ isImage.FoundX
;~ isImage.FoundY
; ---------- Go To main Component ----------
#x::isImageClick_FC(lnc.img_path, "go_to_main_component.png", 5, 5)

; ---------- Return To Instance ----------
#z::isImageClick_FC(lnc.img_path, "return_to_instance.png", 0, 0)

; ---------- Run Present (Run Prototype) ----------
F9::isImageClick_FC(lnc.img_path, "run_present.png", 20, 20)


; -------------------------------------------------------------------------------------------

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
;Zoom in - Switches Ctrl+Wheelup with Wheelup 
Wheelup:: 
{
	; if lnc.MouseOnWorkArea_FC() ; if mouse in on a work area then zoom in with switched  zoon
	; {
		Send "{Ctrl down}"
		Send "{Wheelup}"
		Send "{Ctrl up}"
	; 	return
	; }
	; Send "{Wheelup}"					; else just scroll
}

;Zoom out - Switches Ctrl+Wheeldown with Wheeldown 
Wheeldown:: 
{
	; if MouseOnWorkArea_FC()
	; {
		Send "{Ctrl down}"
		Send "{Wheeldown}"
		Send "{Ctrl up}"
	; 	return
	; }
	; Send "{Wheeldown}"
}

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


; ----- TEST -----!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


/*
; -------------------------------------------------------------------------------------------
;~ "Figma_files\img\text_active.png")
isImage_FC(lnc.img_path)
{
	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, lnc.img_path) 
			img_is:= true
		else
			img_is := false
	;~ Mousemove FoundX, FoundY
	return {img_is : img_is, FoundX:FoundX, FoundY:FoundY}
}

isImageClick_FC(lnc.img_path, plus_x, plus_y)
{
	MouseGetPos(&start_xpos, &start_ypos)
	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, lnc.img_path) {
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
