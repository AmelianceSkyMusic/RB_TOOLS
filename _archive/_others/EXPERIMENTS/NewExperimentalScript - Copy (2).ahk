;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance ignore 
SetKeyDelay -1

!Esc::Reload 

#include ../../RB [FUNCTION] Say.ahk
; Say "SCRIPTS ARE LOADED"
Say("SCRIPTS ARE LOADED", 0.4)

;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------

SendAsClipboard(text) {
    ClipSaved := ClipboardAll()
    A_Clipboard := text
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}