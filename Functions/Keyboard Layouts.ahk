;# Win   ! Alt   ^ Ctrl   + Shift


#1::
{
  PostMessage 0x0050, 0, 0x4190419,, "A"  ; RU 0x0050 is WM_INPUTLANGCHANGEREQUEST
  Msg("Russian")
}

#2::
{
  PostMessage 0x0050, 0, 0x4090409,, "A"  ; US 0x0050 is WM_INPUTLANGCHANGEREQUEST
  Msg("English")
}

#3::
{
  PostMessage 0x0050, 0, 0x4220422,, "A"  ; UA 0x0050 is WM_INPUTLANGCHANGEREQUEST
  Msg("Ukrainian")
}



; ~1::
; {
;     if (A_PriorHotkey != "~1" or A_TimeSincePriorHotkey > 400) {
;         ; Too much time between presses, so this isn't a double-press.
;         KeyWait "1"
;         return
;     }

;     PostMessage 0x0050, 0, 0x4190419,, "A"  ; RU 0x0050 is WM_INPUTLANGCHANGEREQUEST

; }

; ~2::
; {
;     if (A_PriorHotkey != "~2" or A_TimeSincePriorHotkey > 400) {
;         ; Too much time between presses, so this isn't a double-press.
;         KeyWait "2"
;         return
;     }

;     PostMessage 0x0050, 0, 0x4090409,, "A"  ; RU 0x0050 is WM_INPUTLANGCHANGEREQUEST

; }

; ~3::
; {
;     if (A_PriorHotkey != "~3" or A_TimeSincePriorHotkey > 400) {
;         ; Too much time between presses, so this isn't a double-press.
;         KeyWait "3"
;         return
;     }

;     PostMessage 0x0050, 0, 0x4220422,, "A"  ; RU 0x0050 is WM_INPUTLANGCHANGEREQUEST

; }