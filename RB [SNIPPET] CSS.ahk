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

; ==================================================================
; ------------------------------ FLEX ------------------------------
; ==================================================================
::df::display: flex;
; ::d f::display: grid;
; ::d f::display: float;
; ::d f::display: inline;
; ::d f::display: block;
; ::d f::display: inline-block; ;<button>, <input>, <textarea>, <select>.

; ::d f::box-sizing: border-box; ;Алгоритм расчёта ширины включая все кроме margin

; justify-content - выравнивает элементы горизонтально
::jcs::justify-content: start;             ; - (flex-start) Элементы выравниваются по левой стороне контейнера.
::jcfs::justify-content: flex-start;             ; - (flex-start) Элементы выравниваются по левой стороне контейнера.
::jce::justify-content: end;               ; - (flex-end) Элементы выравниваются по правой стороне контейнера.
::jcfe::justify-content: flex-end;               ; - (flex-end) Элементы выравниваются по правой стороне контейнера.
::jcc::justify-content: center;            ; - Элементы выравниваются по центру контейнера.
::jcsb::justify-content: space-between;    ; - Элементы отображаются с одинаковыми отступами между ними.
::jcsa::justify-content: space-around;     ; - Элементы отображаются с одинаковыми отступами вокруг них.
::jcse::justify-content: space-evenly;     ; - Элементы отображаются с одинаковыми отступами между и за ними.


;align-items -  выравнивает элементы вертикально
::ais::align-items: start;     ; - (flex-start) Элементы выравниваются по верхнему краю контейнера.
::aifs::align-items: flex-start;     ; - (flex-start) Элементы выравниваются по верхнему краю контейнера.
::aie::align-items: end;       ; - (flex-end) Элементы выравниваются по нижнему краю контейнера.
::aife::align-items: flex-end;       ; - (flex-end) Элементы выравниваются по нижнему краю контейнера.
::aic::align-items: center;    ; - Элементы выравниваются вертикально по центру контейнера.
::aib::align-items: baseline;  ; - Элементы отображаются на базовой линии контейнера.
::aist::align-items: stretch;  ; - Элементы растягиваются, чтоб заполнить контейнер.

;flex-direction - задает направление, в котором будут расположены элементы в контейнере
::fdr::flex-direction: row;                ; - элементы размещаются по направлению текста.
::fdrr::flex-direction: row-reverse;       ; - элементы отображаются в обратном порядке к направлению текста.
::fdc::flex-direction: column;             ; - элементы располагаются сверху вниз.
::fdcr::flex-direction: column-reverse;    ; - элементы располагаются снизу вверх.

;order
::o::order:{SPACE}0;{LEFT}+{LEFT} ; - установка порядка, может быть как плюс так и минус

;align-self - выравнивает конкретный один элемент вертикально
::ass::align-self: start;     ; - (flex-start) Элемент выравниваются по верхнему краю контейнера.
::asfs::align-self: flex-start;     ; - (flex-start) Элемент выравниваются по верхнему краю контейнера.
::ase::align-self: end;       ; - (flex-end) Элемент выравниваются по нижнему краю контейнера.
::asfe::align-self: flex-end;       ; - (flex-end) Элемент выравниваются по нижнему краю контейнера.
::asc::align-self: center;    ; - Элемент выравниваются вертикально по центру контейнера.
::asb::align-self: baseline;  ; - Элемент отображаются на базовой линии контейнера.
::asst::align-self: stretch;  ; - Элемент растягиваются, чтоб заполнить контейнер.

;flex-wrap - размещение элементов
::fwn::flex-wrap: nowrap;          ; - Размеры элементов устанавливаются автоматически, чтоб они поместились в один ряд.
::fww::flex-wrap: wrap;            ; - Элементы автоматически переносятся на новую строку.
::fwwr::flex-wrap: wrap-reverse;   ; - Элементы автоматически переносятся на новую строку, но строки расположены в обратном порядке.

;flex-flow - flex-direction + flex-wrap
::ff r n::flex-flow: row nowrap;                        ; -  
::ff r w::flex-flow: row wrap;                          ; -  
::ff r wr::flex-flow: row wrap-reverse;                 ; -  
::ff rr n::flex-flow: row-reverse nowrap;               ; - 
::ff rr w::flex-flow: row-reverse wrap;                 ; - 
::ff rr wr::flex-flow: row-reverse wrap-reverse;        ; - 
::ff c n::flex-flow: column nowrap;                     ; - 
::ff c w::flex-flow: column wrap;                       ; - 
::ff c wr::flex-flow: column wrap-reverse;              ; - 
::ff cr n::flex-flow: column-reverse nowrap;            ; - 
::ff cr w::flex-flow: column-reverse wrap;              ; - 
::ff cr wr::flex-flow: column-reverse wrap-reverse;     ; - 

::ff n r::flex-flow: nowrap row;                        ; -  
::ff w r::flex-flow: wrap row;                          ; -  
::ff wr r::flex-flow: wrap-reverse row;                 ; -  
::ff n rr::flex-flow: nowrap row-reverse;               ; - 
::ff rw r::flex-flow: wrap row-reverse;                 ; - 
::ff wr rr::flex-flow: wrap-reverse row-reverse;        ; - 
::ff n c::flex-flow: nowrap column;                     ; - 
::ff w c::flex-flow: wrap column;                       ; - 
::ff wr c::flex-flow: wrap-reverse column;              ; - 
::ff n cr::flex-flow: nowrap column-reverse;            ; - 
::ff cw r::flex-flow: wrap column-reverse;              ; - 
::ff wr cr::flex-flow: wrap-reverse column-reverse;     ; - 

;align-content - как несколько рядов должны отделяться друг от друга
::ac s::align-content: start;           ; - (flex-start) Ряды группируются в верхней части контейнера.
::ac fs::align-content: flex-start;           ; - (flex-start) Ряды группируются в верхней части контейнера.
::ac e::align-content: end;             ; - (flex-end) Ряды группируются в нижней части контейнера.
::ac fe::align-content: flex-end;             ; - (flex-end) Ряды группируются в нижней части контейнера.
::ac c::align-content: center;          ; - Ряды группируются вертикально по центру контейнера.
::ac sb::align-content: space-between;  ; - Ряды отображаются с одинаковыми расстояниями между ними.
::ac sa::align-content: space-around;   ; - Ряды отображаются с одинаковыми расстояниями вокруг них.
::ac s::align-content: stretch;         ; - Ряды растягиваются, чтоб заполнить контейнер равномерно.

::fb::flex-basis:{SPACE};{LEFT} ; - задает ширину контейнера (в пикселях или процентах)

::fg::flex-grow:{SPACE};{LEFT} ; - запрещяет растягивать контейнер внутренними элементами (1 - можно, 0 - нельзя)
::fg::flex-shrink:{SPACE};{LEFT} ; - запрещяет сужать контейнер (1 - можно, 0 - нельзя)
::fx::flex:{SPACE};{LEFT} ; - 


; ==================================================================
; ---------------------------- POSITION ----------------------------
; ==================================================================

::gcs::grid-column-start:{SPACE};{LEFT} ; - начало
::gcs s::grid-column-start: span{SPACE};{LEFT} ; - начало
::gce::grid-column-end:{SPACE};{LEFT} ; - конец (не включая последнюю)
::gce s::grid-column-end: span{SPACE};{LEFT} ; - конец (указывает количество ячеек)
::gc::grid-column: /{SPACE};{LEFT 3} ; - указать начало и конец 2/4 (не включая последнюю)
::gc s::grid-column: span / span{SPACE};{LEFT 2} ; - указать начало и конец 2/4 (не включая последнюю)
::grs::grid-row-start:{SPACE};{LEFT} ; - 

::gr::grid-row: /{SPACE};{LEFT 3} ; - 
::gr s::grid-row: span / span{SPACE};{LEFT} ; - 
::ga::grid-area: / / /{SPACE};{LEFT}
::gtc::grid-template-columns: {SPACE};{LEFT}
::gtc r::grid-template-columns: repeat( , );{LEFT 3}
::gtr::grid-template-rows: {SPACE};{LEFT}
::gtr r::grid-template-rows: repeat( , );{LEFT 3}
::gt::grid-template: /;{LEFT 3}
::gcg::grid-column-gap:{SPACE};{LEFT}
::grg::grid-row-gap:{SPACE};{LEFT}
::grg::grid-gap:{SPACE};{LEFT}


; ==================================================================
; ---------------------------- POSITION ----------------------------
; ==================================================================

;position

::z::z-index:{SPACE}0;{LEFT}+{LEFT}

::p st::position: static;    ; - DEFAULT элемент позиционируется относительно родителя и соседних элементов в общем потоке
::p r::position: relative;   ; - относительно изначального положения в коде, оставив за собой пустое место (с left top right bottom)
::p a::position: absolute;`ntop: 0px;`nleft: 0px;   ; - выываеться из потока и зависает на полотне сайта (НЕ экрана).
                                                    ;   Начинает вести себя как строчный элемент.
                                                    ;   Родителю нужно указать position: relative; и width: 100;
::p f::position: fixed;      ; - Прилипает к экрану
::p s::position: sticky;     ; - Прилипает к экрану при прокрутке
::p i::position: inherit;    ; - Наследует значение от родителя



