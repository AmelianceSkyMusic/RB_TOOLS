﻿; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift

; #InstallKeybdHook
; #Persistent
; #SingleInstance force
; ;~ #MenuMaskKey vk07
; SendMode "Input"
; SetDefaultMouseSpeed 0
; SetKeyDelay 0
; SetMouseDelay -1

;~ #SingleInstance ignore 
#HotIf WinActive("ahk_exe illustrator.exe")


#include Illustrator/z_AiScriptsPanel.ahk
global aiscripts := AiScriptsPanel("C:\Program Files\Adobe\Adobe Illustrator 2020\Presets\en_US\Scripts")

;hotkey to open/close the panel
F1::aiscripts.Toggle()







; ; -------------------------------------------------------------------------------------------
; ; -------------------------------------------------------------------------------------------
; ; -------------------------------------------------------------------------------------------
; is_suspended := false
; this_program := "Illustrator"

; ; -------------------------------------------------------------------------------------------
; #SuspendExempt  ; Exempt the following hotkey from Suspend.
; #Esc::
; {
;     SoundPlay "*-1, WAIT"
;     if (is_suspended){
;       ;~ if MsgBox("Script is suspended! `nUnsuspend it?",  this_program, "OC") = "OK" {
;         Suspend ;"Toggle"
;         SoundPlay "*-1, WAIT"
;         is_suspended := false
;       ;~ } else {
;         ;~ SoundPlay "*16, WAIT"
;         ;~ is_suspended := true
;       ;~ }
;     } else {
;       ;~ if MsgBox("Script is working! `nWill script suspend?", this_program, "OC") = "OK" {
;         Suspend ;"Toggle"
;         SoundPlay "*-1, WAIT"
;         is_suspended := true
;       ;~ } else {
;         ;~ SoundPlay "*16, WAIT"
        ; ~ is_suspended := false
;       ;~ }
;     }

; }



; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------------

{ 

; ; -------------------------------------------------------------------------------------------
; ;Switches Alt+Wheelup with Wheelup 
; Wheelup::
; {
;     Send "{Alt down}"
;     Send "{Wheelup}"
;     Send "{Alt up}"
; }


; ;Switches Alt+Wheeldown with Wheeldown 
; Wheeldown::
; {
;     Send "{Alt down}"
;     Send "{Wheeldown}"
;     Send "{Alt up}"
; }

; ; -------------------------------------------------------------------------------------------
; ;Middle Mouse Button activates hand tool dragging. 
; MButton::
; {
;     Send "{Space down}{LButton down}"
;     KeyWait "MButton"
;     Send "{LButton up}{Space up}" 
; }


;Duplicate ASM
;~LButton & RButton:: 
;send, ^c
;send, ^+v
;Return 

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

+^DOWN::  ;--Shift+Ctrl+DOWN
{
    Loop 10
    Send "+{DOWN}"
}

+^LEFT::   ;--Shift+Ctrl+LEFT
{
    Loop 10
    Send "+{LEFT}"
}

; -------------------------------------------------------------------------------------------
;Colour inactive element of shape ASM
; RButton::
; {
;     Send "x"
;     Send "{LButton down}{LButton up}"
;     Send "x"
; }

!LButton::
{
    Send "x"
    Send "{LButton down}{LButton up}"
    Send "x"
}
; Duplicate
~LButton & RButton::
{ 
    Send "{Alt down}"
    KeyWait "LButton"
    Send "{Alt up}"
}

; ~LButton:: GetKeyState("Alt") and not GetKeyState("Alt", "P") and Send("{Alt up}")
; RButton up:: GetKeyState("LButton", "P") and Send("{Alt down}{LButton up}{LButton down}")

;Del ASM
~RButton & LButton::
{ 
    Send "{Delete}"
}

;Align Horizontal ASM
;~ !c::
!c::
{ 
    Send "{F3}"
}

;Align Vertical ASM
;~ !e::
!e::
{ 
    Send "{F4}"
}

;Align Left ASM
;~ !a:: 
!a::
{ 
    Send "{F5}"
    ;~ aiAction("LEFT")
}

;Align Right ASM
;~ !r::
!d::
{ 
    Send "{F6}"
}

;Align Top ASM
;~ !w::
!w::
{ 
    Send "{F7}"
}
;Align Button ASM
;~ !s::
!s::
{ 
    Send "{F8}"
}
;Duplicate ASM
;vk4C::
;Send "{F9}"
;return

#vk51::
{ 
    ;~ WinActivate("Adobe Illustrator 2019")
    win_text := WinGetText("Adobe Illustrator 2019")
    If InStr(win_text, "character")
      MsgBox "Ouyeah"
    else
      MsgBox "no"
    MsgBox  win_text
}


;~ ---------------------------------------------------------------------------------------------------
;~ ---------------------------------------------------------------------------------------------------
;~ ---------------------------------------------------------------------------------------------------
;~ ---------------------------------------------------------------------------------------------------
;~ ---------------------------------------------------------------------------------------------------
;tooltip
  ; Say(text, time := 1.5, x := 0, y := 0, window := 1) {
  ;   ToolTip text, x ? x : "", y ? y : "", window
  ;   SetTimer (_*) => ToolTip(,,,window), -1000 * time
  ; }

;~ ---------------------------------------------------------------------------------------------------
/* global aiCom := ''

;run com method
  aiComRun(name, method, script, args) {
    ComObjError(true)
    try {
      if type(aiCom) != "Application" {
        aiCom := ComObjActive("Illustrator.Application")
      }
      if type(aiCom) != "Application" {
        aiCom := ComObjCreate("Illustrator.Application")
      }

      if method = "DoJavaScript" {
        result := aiCom.DoJavaScript(script, args)
      } else if method = "DoJavaScriptFile" {
        result := aiCom.DoJavaScriptFile(script, args)
      }

    } catch e {
      MsgBox("Exception thrown!`n`nwhat: " e.what "`nfile: " e.file
      . "`nline: " e.line "`nmessage: " e.message "`nextra: " e.extra,, 16)
    }
    return (result = "undefined" or result = "" ? StrLower(name) : result)
  }
;~ ---------------------------------------------------------------------------------------------------

;run action
  aiAction(name, set := "Rsay", mustBeSelected := true) {
    args := ComObjArray(VT_VARIANT := 12, 3)
    args[0] := name
    args[1] := set
    args[2] := mustBeSelected

    script := "
    (
      function main(name, set, mustBeSelected) {
        if (mustBeSelected == true) {
          if (app.activeDocument.selection.length > 0) {
            app.doScript(name, set);
            return "";
          } else {
            return name + "\nerror: some object must be selected";
          }
        } else {
          app.doScript(name, set);
          return "";
        }
      };
      main(arguments[0], arguments[1], arguments[2])
    )"
    return aiComRun(name, "DoJavaScript", script, args)
  } */
;~ ---------------------------------------------------------------------------------------------------
;~ ---------------------------------------------------------------------------------------------------
;~ ---------------------------------------------------------------------------------------------------
;~ ---------------------------------------------------------------------------------------------------
;~ ---------------------------------------------------------------------------------------------------

;^!z::
;Run, Illustrator.exe A_Desktop\test.jsx
;return
}

;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"