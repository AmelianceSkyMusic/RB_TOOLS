﻿;# Win   ! Alt   ^ Ctrl   + Shift
#HotIf
#hotstring EndChars `t ;tab - expand snippet
#hotstring o ?
; *  - ending char is not required
; ?  - trigger inside word (?0 - turn off)
; b0 - turn off auto backspacing (b - turn on)
; c  - case sensitive (c0 - turn off)
; c1 - case conform (abc, Abc, ABC expands hotstring approrpiate)
; kN - key delay (in ms, -1 is no delay)
; o  - omit ending char
; pN - priority ???
; r  - send raw (r0 - turn off)
; si/sp/se - method to send: sendinput/sendplay/sendevent (si - default)
; t  - send raw without translating character to keystroke (t0/r0 - turn off)
; x  - execute (run code instead sending text)
; z  - reset hotstring processing (for preventing recursion on b0) (z0 - turn off)

; AHK1 RU help https://ahk-wiki.ru/hotstrings

; :c0:шо:: Send "{U+1F928}" ; 🤨
::шо::{U+1F928}