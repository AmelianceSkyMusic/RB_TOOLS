; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
; #SingleInstance ignore 
; #If WinActive("ahk_exe Studio One.exe")

global pp := {}
pp.name := "Adobe Premiere Pro"


; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
#HotIf WinActive("ahk_exe Adobe Premiere Pro.exe")

F1::{
	MsgBox("
	(
		Guitar Pro 5


		РЕДАГУВАННЯ:

		Ctrl+LMB `t— копіювати
		Shift+LMB `t— вставити (на нові такти перед виділеним)

		Ctrl+Alt+LMB `t— копіювати (з усіх треків одразу)
		Shift+Alt+LMB `t— вирізати (з усіх треків одразу)
		Ctrl+Shift+LMB `t— вставити (замінити)

		MMB `t`t— вставити такт
		Ctrl+MMB `t— вставити трек

		Alt+LMB `t`t— видалити ноти


		НАВІГАЦІЯ:

		A `t`t— вліво
		D `t`t— вправо
		W `t`t— вверх
		S `t`t— вниз
		Q `t`t— на попередній такт
		E `t`t— на наступний такт

		Alt+S `t`t— скоротити довжину ноти
		Alt+W `t`t— подовжити довжину ноти

		Shift+A `t`t— на початок такту
		Shift+D `t`t— в кінець такту
		Shift+W `t`t— на попереднью дорожку
		Shift+S `t`t— на наступну дорожку


		СКРИПТ (глобальні команди):

		Alt+Esc `t`t— перезапустити скрипт
		Win+Esc `t— призупинити/відновити роботу скрипта
		Win+F `t`t— режим fullscreen (може працювати з багаться
		            `t`t     вікнами в Guitar Pro і не тільки)
	)", "GP Tool | 2021 © AmelianceSkyMusic@gmail.com", "")

}

#HotIf GetKeyState("Capslock", "T") and WinActive("ahk_exe Adobe Premiere Pro.exe")
{


	; Space::{
	; 	Msg("Hello")
	; }

	; >!::RShift


	vkBC::Send("+i") ; ,
	vkBE::Send("+o") ; .
	!vkBC::Send("{Top}") ; ,
	!vkBE::Send("+o") ; .


	Space::Send("+k") ; .!!!Play Around
	~^Space::Send("{Space}") ; ,

	; !LButton::Send("^+!p^k") ; -- cut
	^LButton::Send("^+!pc{LButton}{Sleep 200}v") ; -- cut
	^+LButton::Send("^+!pc+{LButton}{Sleep 200}v") ; -- cut
	^RButton::Send("^+!p") ; -- !!!Move Playhead to Cursor
	^#LButton::Send("^+!pq") ; -- 
	!#LButton::Send("^+!pw") ; -- 

	; #MButton::Send("{Delete}") ; -- 
	#LButton::Send("{LButton}{Sleep 100}{Delete}") ; -- 

	;Duplicate
	~LButton & RButton::
	{
		Send "{LButton Up}"
		Send "{Alt down}"
		Send "{LButton Down}"
		KeyWait "LButton"
		Send "{Alt up}"
	}

	;Del ASM
	~RButton & LButton::
	{
		Send "{Delete}"
	}

	MButton::
	{
		Send "h{LButton down}"
		KeyWait "MButton"
		Send "{LButton up}v"
	}

	;Switches Alt+Wheelup with Wheelup 
	Wheelup::
	{
		Send "{Alt down}"
		Send "{Wheelup}"
		Send "{Wheelup}"
		Send "{Alt up}"
	}


	;Switches Alt+Wheeldown with Wheeldown 
	Wheeldown::
	{
		Send "{Alt down}"
		Send "{Wheeldown}"
		Send "{Wheeldown}"
		Send "{Alt up}"
	}

; ; --------------------------------------------
; 	; --- Copy
; 	XButton1::
; 	^LButton::{ 
; 		Send "^c"
; 		Send "{Enter}"
; 		Msg("Copy")
; 	}

; 	; --- Paste befor
; 	XButton2::
; 	+LButton::{
; 		Send "^v"
; 		if WinWait("ahk_class TFMesureColler", ,0.5) {
; 			SetControlDelay -1
; 			ControlFocus "TRadioButton2", "A"
; 			ControlClick "TBitBtn2", "A"
; 			Msg("Paste befor")
; 		} else {
; 			Msg("Paste here")
; 		}

; 		; Send "{Enter}"
; 	}

; 	; --- Copy from all tracks
; 	+XButton1::
; 	^!LButton::{ 
; 		Send "^c"
; 		if WinWait("ahk_class TFMesureCopier", ,0.5) {
; 			SetControlDelay -1
; 			ControlFocus "TRadioButton2", "A"
; 			ControlClick "TBitBtn2", "A"
; 		} else {
; 			Msg("??????????")
; 		}
; 		Msg("Copy from all tracks")
; 		; Send "{Enter}"
; 	}

; 	; Cut from all tracks
;     +!Lbutton::{
; 		Send "^x"
; 		if WinWait("ahk_class TFMesureCouper",,0.5) {
; 			SetControlDelay -1
; 			ControlClick "TBitBtn2", "A"
; 			Msg("Cut")
; 		} else {
; 			Msg("Del")
; 		}

; 	}

; 	; --- Paste replace
; 	+XButton2::
; 	^+LButton::{ 
; 		Send "^v"
; 		Send "{Enter}"
; 		Msg("Paste replace")
; 	}


; ; --------------------------------------------
; 	Mbutton::{
; 		Send "^{Insert}"
; 		Msg("Add new measure")
; 	}

; 	^Mbutton::{
; 		Send "^+{Insert}"
; 		Msg("Add new track")
; 	}


; ; --------------------------------------------
;     !Lbutton::{
; 		Send "{Del}"
; 		Msg("Delete notes")
; 	}

; ; --------------------------------------------
; 	a::Send("{Blind}{Left}")
; 	d::Send("{Blind}{Right}")
; 	w::Send("{Blind}{Up}")
; 	s::Send("{Blind}{Down}")
; 	q::Send("^{Left}"), Msg("Previous measure")
; 	e::Send("^{Right}"), Msg("Next measure")


; 	!d::Send("+!{Up}"), Msg("Up semitone")
; 	!a::Send("+!{Down}"), Msg("Down semitone")
; 	!W::Send("{NumpadAdd}"), Msg("+")
; 	!S::Send("{NumpadSub}"), Msg("-")


; 	+a::Send("{Home}"), Msg("Start measure")
; 	+d::Send("{End}"), Msg("End measure")
; 	+w::Send("^{Up}"), Msg("Previous track")
; 	+s::Send("^{Down}"), Msg("Next track")


; 	!+d::Send("+!{PgUp}"), Msg("Up octave")
; 	!+a::Send("+!{PgDn}"), Msg("Down octave")
; 	!+w::Send("!{Up}"), Msg("Up")
; 	!+s::Send("!{Down}"), Msg("Down")

; ; --------------------------------------------
;     +Mbutton::Send("{Enter}"), Msg("Enter")
	
}
