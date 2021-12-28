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

; ================================================================
; ================================================================
; ================================================================
#HotIf not WinActive("ahk_exe code.exe") and not WinActive("ahk_exe photoshop.exe") and not WinActive("ahk_exe illustrator.exe") and not WinActive("ahk_exe figma.exe")

; ------------------------------------
; --------------- FLEX ---------------
; ------------------------------------

; justify-content
::jc s::justify-content: start;             ; - (flex-start) Элементы выравниваются по левой стороне контейнера.
::jc e::justify-content: end;               ; - (flex-end) Элементы выравниваются по правой стороне контейнера.
::jc c::justify-content: center;            ; - Элементы выравниваются по центру контейнера.
::jc sb::justify-content: space-between;    ; - Элементы отображаются с одинаковыми отступами между ними.
::jc sa::justify-content: space-around;     ; - Элементы отображаются с одинаковыми отступами вокруг них.
::jc se::justify-content: space-evenly;     ; - 


;align-items
::ai s::align-items: start;     ; - (flex-start) Элементы выравниваются по верхнему краю контейнера.
::ai e::align-items: end;       ; - (flex-end) Элементы выравниваются по нижнему краю контейнера.
::ai c::align-items: center;    ; - Элементы выравниваются вертикально по центру контейнера.
::ai b::align-items: baseline;  ; - Элементы отображаются на базовой линии контейнера.
::ai st::align-items: stretch;  ; - Элементы растягиваются, чтоб заполнить контейнер.

;flex-direction
::fd r::flex-direction: row;                ; - элементы размещаются по направлению текста.
::fd rr::flex-direction: row-reverse;       ; - элементы отображаются в обратном порядке к направлению текста.
::fd c::flex-direction: column;             ; - элементы располагаются сверху вниз.
::fd cr::flex-direction: column-reverse;    ; - элементы располагаются снизу вверх.

;order
::o::order:{SPACE};{LEFT} ; - установка порядка, может быть как плюс так и минус

;align-self
::as s::align-self: start;     ; - (flex-start) Элементы выравниваются по верхнему краю контейнера.
::as e::align-self: end;       ; - (flex-end) Элементы выравниваются по нижнему краю контейнера.
::as c::align-self: center;    ; - Элементы выравниваются вертикально по центру контейнера.
::as b::align-self: baseline;  ; - Элементы отображаются на базовой линии контейнера.
::as st::align-self: stretch;  ; - Элементы растягиваются, чтоб заполнить контейнер.

;flex-wrap
::fw n::flex-wrap: nowrap;          ; - Размеры элементов устанавливаются автоматически, чтоб они поместились в один ряд.
::fw w::flex-wrap: wrap;            ; - Элементы автоматически переносятся на новую строку.
::fw wr::flex-wrap: wrap-reverse;   ; - Элементы автоматически переносятся на новую строку, но строки расположены в обратном порядке.

;flex-flow
::ff r n::flex-flow: row nowrap;                ; -  
::ff r w::flex-flow: row wrap;                ; -  
::ff r wr::flex-flow: row wrap-reverse;                ; -  
::ff rr n::flex-flow: row-reverse nowrap;       ; - 
::ff rr w::flex-flow: row-reverse wrap;       ; - 
::ff rr wr::flex-flow: row-reverse wrap-reverse;       ; - 
::ff c n::flex-flow: column nowrap;             ; - 
::ff c w::flex-flow: column wrap;             ; - 
::ff c wr::flex-flow: column wrap-reverse;             ; - 
::ff cr n::flex-flow: column-reverse nowrap;    ; - 
::ff cr w::flex-flow: column-reverse wrap;    ; - 
::ff cr wr::flex-flow: column-reverse wrap-reverse;    ; - 

::ff n r::flex-flow: nowrap row;                ; -  
::ff w r::flex-flow: wrap row;                ; -  
::ff wr r::flex-flow: wrap-reverse row;                ; -  
::ff n rr::flex-flow: nowrap row-reverse;       ; - 
::ff rw r::flex-flow: wrap row-reverse;       ; - 
::ff wr rr::flex-flow: wrap-reverse row-reverse;       ; - 
::ff n c::flex-flow: nowrap column;             ; - 
::ff w c::flex-flow: wrap column;             ; - 
::ff wr c::flex-flow: wrap-reverse column;             ; - 
::ff n cr::flex-flow: nowrap column-reverse;    ; - 
::ff cw r::flex-flow: wrap column-reverse;    ; - 
::ff wr cr::flex-flow: wrap-reverse column-reverse;    ; - 