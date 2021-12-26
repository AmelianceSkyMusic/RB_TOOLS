;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance ignore 
SetKeyDelay -1

!Esc::Reload 

#include ../../RB [FUNCTION] Say.ahk
; Say "SCRIPTS ARE LOADED"
Say("SCRIPTS ARE LOADED", 0.4)
global String := 0

Capslock::
{
    ; itoggle := !itoggle				; toggles between true and false (boolean values)
    ; if itoggle						; if itoggle is true
    ;     PostMessage 0x0050, 0, 0x4190419,, "A"  ; RU 0x0050 is WM_INPUTLANGCHANGEREQUEST
    ; else							; if itoggle is false
    ;     PostMessage 0x0050, 0, 0x4090409,, "A"  ; US 0x0050 is WM_INPUTLANGCHANGEREQUEST
    ;     PostMessage 0x0050, 0, 0x4220422,, "A"  ; UA 0x0050 is WM_INPUTLANGCHANGEREQUEST
    ; cc := getKeyboardLayout()
    ; InputLocaleID := DllCall("GetKeyboardLayout", "UInt", 0, "UInt")
    ; String := Format("{:#x}" , InputLocaleID)
    ;     Say(String)
}

^Capslock::
{


        PostMessage 0x0050, 0, 0x4220422,, "A"  ; UA 0x0050 is WM_INPUTLANGCHANGEREQUEST
                Msg(String)
}

;;getKeyboardLayout get current keyboard layout
  getKeyboardLayout() {
    ;https://www.autohotkey.com/boards/viewtopic.php?f=6&t=28258

    ;no more need:
    ;rundll32 Shell32,Control_RunDLL input.dll,,{C07337D3-DB2C-4D0B-9A93-B722A6C106E2}
    ;advanced key settings, en: alt-shift-9, ru: alt-shift-0

    try {
      DetectHiddenWindows 1
      if WinGetClass("A") = "ConsoleWindowClass" {
        ;detect layout in console windows:
        ;https://github.com/Elfy/getconkbl
        ;https://www.autohotkey.com/boards/viewtopic.php?f=76&t=69414&hilit=0x4090409

        ctrlID := WinGetID("A")
        static conkblPath := A_InitialWorkingDir "..\..\bin_files\getconkbl.dll"
        static GetConsoleKbLayoutModule := DllCall("LoadLibrary", "Str", conkblPath)
        static GetConsoleKbLayoutInit := DllCall("getconkbl\Initialize", "Int",0)
        langID := DllCall("getconkbl\GetConsoleAppKbLayout", "UInt",WinGetPID("A")) & 0xFFFF
      } else {
        try
          ctrlID := ControlGetHwnd(ControlGetFocus("A"), "A")
        catch
          ctrlID := WinGetID("A")
        langID := DllCall("GetKeyboardLayout", "UInt",DllCall("GetWindowThreadProcessId", "Ptr",ctrlID, "Ptr",0), "Ptr") & 0xFFFF
      }
      DetectHiddenWindows 0

      size := DllCall("GetLocaleInfo", "UInt",LangID, "UInt",0x1001, "UInt",0, "UInt",0 * 2) ;LOCALE_SENGLANGUAGE := 0x1001
      VarSetStrCapacity(lang, size)
      DllCall("GetLocaleInfo", "UInt",LangID, "UInt",0x1001, "Str",lang, "UInt",Size)

      return [lang, ctrlID]
    } catch
      return ['Unknown', 0]
  }


; SetInputLang(Lang)
; {
;     WinExist("A")
;     CtrlInFocus := ControlGetFocus("A")
;     PostMessage(0x50, 0, Lang, CtrlInFocus)
; }

;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------