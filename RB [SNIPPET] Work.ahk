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




; -----------------------------------------------------------------
; -----------------------------------------------------------------
; -----------------------------------------------------------------
;date
:cx:ddddddd::Sleep(50), SendText(FormatTime(, "yyyy MM dd "))
:cx:ввввввв::Sleep(50), SendText(FormatTime(, "yyyy MM dd "))

:cx:dddddd::Sleep(50), SendText(FormatTime(, " _ yyyy MM dd _ HH-mm"))
:cx:вввввв::Sleep(50), SendText(FormatTime(, " _ yyyy MM dd _ HH-mm"))

:cx:ddddd::Sleep(50), SendText(FormatTime(, "yyyy MM dd _ HH-mm _ "))
:cx:ввввв::Sleep(50), SendText(FormatTime(, "yyyy MM dd _ HH-mm _ "))
; :cx:dddd::Sleep(50), SendText(FormatTime(, "yyyy MM dd _ HH-mm _ "))
; :cx:вввв::Sleep(50), SendText(FormatTime(, "yyyy MM dd _ HH-mm _ "))


:cx:dddd::Sleep(50), SendText(FormatTime(, "_yyyy-MM-dd_HH-mm"))
:cx:вввв::Sleep(50), SendText(FormatTime(, "_yyyy-MM-dd_HH-mm"))

;   ;YYYY MM DD
; :cx:DDD::Sleep(50), SendText(FormatTime(, "yyyy MM dd "))
; :cx:ВВВ::Sleep(50), SendText(FormatTime(, "yyyy MM dd "))

:cx:ddd::Sleep(50), SendText(FormatTime(, "yyyy_MM_dd_"))
:cx:ввв::Sleep(50), SendText(FormatTime(, "yyyy_MM_dd_"))

:cx:cccc::Sleep(50), SendText('(' FormatTime(, "yyyy-MM-dd HH:mm:ss ddd") ')') ;

; :*:_СБ::_СБОРКА
; :*:_ПР::_ПРИНТБИСТРО
; :*:_Пе::_Печать
; :*:_АИ::_АИСТ
; :*:_БЕ::_БЕЛКА




; -----------------------------------------------------------------
; -----------------------------------------------------------------
; -----------------------------------------------------------------

; >+Space::Send "{U+00A0}" ;nbsp

; ;symbols
; ::*::{Sleep 50}{U+00B7} ;· middle dot
; ::@::{Sleep 50}{U+2022} ;• middle dot

; ;arrows
; ::<-->::{Sleep 50}{U+2194} ;↔ left right arrow
; ::Б--Ю::{Sleep 50}{U+2194}
; ::^--v::{Sleep 50}{U+2195} ;↕ left right arrow
; ::`:--м::{Sleep 50}{U+2195}
; ::<--::{Sleep 50}{U+2190} ;← left arrow
; ::Б--::{Sleep 50}{U+2190}
; ::-->::{Sleep 50}{U+2192} ;→ right arrow
; ::--Ю::{Sleep 50}{U+2192}
; ::^--::{Sleep 50}{U+2191} ;↑ up arrow
; ::`:--::{Sleep 50}{U+2191}
; ::v--::{Sleep 50}{U+2193} ;↓ down arrow
; ::м--::{Sleep 50}{U+2193}

; ;dashes
; ::---::{Sleep 50}{U+2014} ;— emdash
; ::--::{Sleep 50}{U+2013} ;– endash
; ::_::{Sleep 50}{U+2212} ;− minus

; ;marks
; ::(c)::{Sleep 50}{U+00A9} ;© copyright
; ::(с)::{Sleep 50}{U+00A9}
; ::(r)::{Sleep 50}{U+00AE} ;® registered
; ::(к)::{Sleep 50}{U+00AE}
; ::tm::{Sleep 50}{U+2122} ;™ trademark
; ::еь::{Sleep 50}{U+2122}

; ;math
; ::``8::{Sleep 50}{U+221E} ;∞ infinity
; ::ё8::{Sleep 50}{U+221E} ;∞ infinity
; ::+-::{Sleep 50}{U+00B1} ;± plus-minus
; ::/=::{Sleep 50}{U+2260} ;≠ not equal to
; ::~~::{Sleep 50}{U+2248} ;≈ almost equal to
; ::ЁЁ::{Sleep 50}{U+2248} ;
; ::.=::{Sleep 50}{U+2260}
; ::<=::{Sleep 50}{U+2A7D} ;⩽ less or equal
; ::Б=::{Sleep 50}{U+2A7D}
; ::>=::{Sleep 50}{U+2A7E} ;⩾ greater or equal
; ::Ю=::{Sleep 50}{U+2A7E}
; ::==::{Sleep 50}{U+2261} ;≡ identical to
; ::xx::{Sleep 50}{U+00D7} ;× multiplication
; ::чч::{Sleep 50}{U+00D7}
; ::(/)::{Sleep 50}{U+2300} ;⌀ diameter
; ::)::{Sleep 50}{U+00B0} ;° degree
; ::...::{Sleep 50}{U+2026} ;… ellipsis
; ::ююю::{Sleep 50}{U+2026}
; ::\::{Sleep 50}{U+0301} ;´ combining acute accent

; ;quotes
; :*?:<<::{Sleep 50}{U+00AB} ;« double angle quutation left
; :*?c:ББ::{Sleep 50}{U+00AB}
; :*?:>>::{Sleep 50}{U+00BB} ;» double angle quutation right
; :*?c:ЮЮ::{Sleep 50}{U+00BB}
; ::,,::{Sleep 50}{U+201C} ;“ double comma quutation left
; :c:бб::{Sleep 50}{U+201C}
; ::..::{Sleep 50}{U+201D} ;” double comma quutation right
; :c:юю::{Sleep 50}{U+201D}
; ::;;::{Sleep 50}{U+201E} ;„ low double comma quotation mark
; :c:жж::{Sleep 50}{U+201E}
; ::''::{Sleep 50}{U+201F} ;“ double reversed comma quotation mark
; :c:ээ::{Sleep 50}{U+201F}

; ;currency
; ::``b::{Sleep 50}{U+20BF} ;₿ bitcoin
; ::ёи::{Sleep 50}{U+20BF}
; ::``r::{Sleep 50}{U+20BD} ;₽ ruble
; ::ёк::{Sleep 50}{U+20BD}
; ::``e::{Sleep 50}{U+20AC} ;€ euro
; ::ёу::{Sleep 50}{U+20AC}
; ::``s::{Sleep 50}{U+0024} ;$ dollar
; ::ёы::{Sleep 50}{U+0024}
; ::``f::{Sleep 50}{U+00A3} ;£ pound
; ::ёа::{Sleep 50}{U+00A3}
; ::``y::{Sleep 50}{U+00A5} ;¥ yen
; ::ён::{Sleep 50}{U+00A5}
; ::``g::{Sleep 50}{U+20B4} ;₴ hryvnia
; ::ёп::{Sleep 50}{U+20B4}

; ;local glyphs
;  :c:ae::{Sleep 50}{U+00E6} ;æ
;  :c:ае::{Sleep 50}{U+00E6}
;  :c:фу::{Sleep 50}{U+00E6}
;  :c:AE::{Sleep 50}{U+00C6} ;Æ
;  :c:АЕ::{Sleep 50}{U+00C6}
;  :c:ФУ::{Sleep 50}{U+00C6}
;  :c:oo::{Sleep 50}{U+00F6} ;ö
;  :c:оо::{Sleep 50}{U+00F6}
;  :c:OO::{Sleep 50}{U+00D6} ;Ö
;  :c:ОО::{Sleep 50}{U+00D6}
;  :c:еЖ::{Sleep 50}{U+0451} ;ё
;  :c:ЕЖ::{Sleep 50}{U+0401} ;Ё
;  :c:ее::{Sleep 50}{U+0454} ;є
;  :c:ЕЕ::{Sleep 50}{U+0404} ;Є
;  :c:шш::{Sleep 50}{U+0456} ;і
;  :c:ШШ::{Sleep 50}{U+0406} ;І
;  :c:йй::{Sleep 50}{U+0457} ;ї
;  :c:ЙЙ::{Sleep 50}{U+0407} ;Ї

; ;punctuation
; ;             :c:ё::{Sleep 50}``
; ;             :c:Ё::{Sleep 50}~
; :c:"::{Sleep 50}@
; :c:№::{Sleep 50}{#}
; ;             :c:;::{Sleep 50}{$}
; ;            :c:`:::{Sleep 50}{^}
; ;             :c:?::{Sleep 50}{&}
; :c:х::{Sleep 50}[
; :c:Х::{Sleep 50}{{}
; :c:ъ::{Sleep 50}]
; :c:Ъ::{Sleep 50}{}}
; :c:ж::{Sleep 50};
; :c:Ж::{Sleep 50}:
; :c:э::{Sleep 50}'
; :c:Э::{Sleep 50}"
; :c:б::{Sleep 50},
; :c:ю::{Sleep 50}.
; :c:<>::{Sleep 50}<></>{Left 4}
; :c:БЮ::{Sleep 50}<></>{Left 4}
; :c:Б::{Sleep 50}<
; :c:Ю::{Sleep 50}>
; ::,::{Sleep 50}?
; ::.::{Sleep 50}/

; ;diacritic
; ::``6::{Sleep 50}{U+0302} ;ˆ circumflex
; ::ё6::{Sleep 50}{U+0302}
; ::````::{Sleep 50}{U+0300} ;` grave
; ::ёё::{Sleep 50}{U+0300}
; ::``q::{Sleep 50}{U+0306} ;˘ breve
; ::ёй::{Sleep 50}{U+0306}
; ::```;::{Sleep 50}{U+0308} ;¨ diaresis
; ::ёж::{Sleep 50}{U+0308}
; ::``r::{Sleep 50}{U+030A} ;˚ ring
; ::ёк::{Sleep 50}{U+030A}
; ::``z::{Sleep 50}{U+0327} ;¸ cedilla
; ::ёя::{Sleep 50}{U+0327}
; ::``v::{Sleep 50}{U+030C} ;ˇ caron
; ::ём::{Sleep 50}{U+030C}
; ::``n::{Sleep 50}{U+0303} ;˜ tilde
; ::ёт::{Sleep 50}{U+0303}
; ::``/::{Sleep 50}{U+0301} ;´ acute accent
; ::ё.::{Sleep 50}{U+0301}

; *>!6::Send "{U+0302}" ;ˆ circumflex
; *>!`::Send "{U+0300}" ;` grave
; *>!q::Send "{U+0306}" ;˘ breve
; *>!`;::Send "{U+0308}" ;¨ diaresis
; *>!r::Send "{U+030A}" ;˚ ring
; *>!z::Send "{U+0327}" ;¸ cedilla
; *>!v::Send "{U+030C}" ;ˇ caron
; *>!n::Send "{U+0303}" ;˜ tilde
; *>!\::Send "{U+0301}" ;´ acute accent
