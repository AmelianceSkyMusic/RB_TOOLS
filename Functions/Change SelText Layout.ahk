; -------------------------------------------------------------------------------------------
; ---------- Win+F3 — перевести буквы в верхний регистр
;

; global layoutChanged := "en"

; #F5:: 
; {
;     ClipSaved := ClipboardAll()
; 	A_Clipboard := ""
; 	Send "^c"
; 	ClipWait
;     StrValue := String(A_Clipboard)

;     if layoutChanged = "en" {
;         newtext := changeTextToRu_FC(StrValue)
;         layoutChanged := "ru"

;     } else if layoutChanged = "ru" {
;         changeTextToUa_FC(StrValue)
;         layoutChanged := "ua"


;     } else if layoutChanged = "ua" {
;         changeTextToEn_FC(StrValue)
;         layoutChanged := "en"              
;     }


;     A_Clipboard := newtext
;     ; MsgBox A_Clipboard
;     Sleep 100
;     Send "^v"
;     Sleep 100
;     A_Clipboard := ClipSaved
; }

#F5::textEnToRu_FC
#F6::textRuToEn_FC
; #F7::textEnToUa_FC
; #F8::textUaToEn_FC

textEnToRu_FC() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := changeTextEnToRu_FC(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}


textRuToEn_FC() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := changeTextRuToEn_FC(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}



textEnToUa_FC() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := changeTextEnToUa_FC(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}



textUaToEn_FC() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := changeTextUaToEn_FC(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}

changeTextEnToRu_FC(text) {
    result := ""
    charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]ъaфsыdвfаgпhрjоkлlд;ж'э\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}ЪAФSЫDВFАGПHРJОKЛLД:Ж`"Э|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@`"#№$;%%^:&?**(())__++``ё~Ё  ")*)
    ; charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]ъaфsыdвfаgпhрjоkлlд;ж'э\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}ЪAФSЫDВFАGПHРJОKЛLД:Ж"Э|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@"#№$;%%^:&?**(())__++`ё~Ё  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

changeTextRuToEn_FC(text) {
    result := ""
    ; charMap := Map(StrSplit("йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж;э'\\яzчxсcмvиbтnьmб,ю../ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}ФAЫSВDАFПGРHОJЛKДLЖ:Э`"/|ЯZЧXСCМVИBТNЬMБ<Ю>?,`"@№#;$:^?&ё``Ё~  ")*)

    charMap := Map(StrSplit("йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж;э'\\яzчxсcмvиbтnьmб,ю../ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}ФAЫSВDАFПGРHОJЛKДLЖ:Э`"/|ЯZЧXСCМVИBТNЬMБ<Ю>,?!!`"@№#;$%%:^?&**(())__++ё``Ё~  ")*)
    ; charMap := Map(StrSplit("йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж;э'\\яzчxсcмvиbтnьmб,ю../ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}ФAЫSВDАFПGРHОJЛKДLЖ:Э`"/|ЯZЧXСCМVИBТNЬMБ<Ю>,?!!`"@№#;$%%:^?&**(())__++ё``Ё~  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

changeTextEnToUa_FC(text) {
    result := ""
    charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]їaфsіdвfаgпhрjоkлlд;ж'є\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}їAФSіDВFАGПHРJОKЛLД:Ж`"є|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@`"#№$;%%^:&?**(())__++``'~₴  ")*)
    ; charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]їaфsіdвfаgпhрjоkлlд;ж'є\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}їAФSіDВFАGПHРJОKЛLД:Ж`"є|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@`"#№$;%%^:&?**(())__++``'~₴  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

changeTextUaToEn_FC(text) {
    result := ""
    charMap := Map(StrSplit("йqцwуeкrеtнyгuшiщoзpх[ї]фaіsвdаfпgрhоjлkдlж;є'\\яzчxсcмvиbтnьmб,ю../ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ї}ФAІSВDАFПGРHОJЛKДLЖ:Є`"/|ЯZЧXСCМVИBТNЬMБ<Ю>,?!!`"@№#;$%%:^?&**(())__++'``₴~  ")*)
    ; charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]їaфsіdвfаgпhрjоkлlд;ж'є\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}їAФSіDВFАGПHРJОKЛLД:Ж`"є|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@`"#№$;%%^:&?**(())__++``'~₴  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------

#F8::textUaFanToRu_FC

textUaFanToRu_FC() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := changetextUaFanToRu_FC(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}

changetextUaFanToRu_FC(text) {
    result := ""
    charMap := Map(StrSplit("А А а а Б Б б б В В в в Г Г г г Ґ Г ґ г Д Д д д Е Э е э Є Йэ є йэ Ж Ж ж ж З З з з И Ы и ы І И і и Ї Йи ї йи Й Й й й К К к к Л Л л л М М м м Н Н н н О О о о П П п п Р Р р р С С с с Т Т т т У У у у Ф Ф ф ф Х Х х х Ц Ц ц ц Ч Ч ч ч Ш Ш ш ш Щ Шч щ шч Ь Ь ь ь Ю Йу ю йу Я Йа я йа", " ")*)
    ; charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]ъaфsыdвfаgпhрjоkлlд;ж'э\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}ЪAФSЫDВFАGПHРJОKЛLД:Ж"Э|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@"#№$;%%^:&?**(())__++`ё~Ё  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

; changetextUaFanToRu_FC(text) {
;     result := ""
;     ; charMap := Map(StrSplit("A А A Б B B V V H H G G D D E E Ye Ye Zh Zh Z Z Y Y I I Yi Yi Y Y K K L L M M	N N	O O	P P	R R S S	T T	U U	F F Kh Kh Ts Ts Ch Ch Sh Sh Shch Shch Yu Yu Ya Ya", " ")*)
;     ; charMap := Map(StrSplit("A a B b V v H h G g D d E e Ye ye Zh zh Z z Y y I i Yi yi Y y K k L l M m N n O o	P p	R r S s	T t	U u	F f Kh kh Ts ts Ch ch Sh sh Shch shch Yu yu Ya ya", " ")*)
;     charMap := Map(StrSplit("A А a а B Б b б V В v в H Г h г G Ґ g ґ D Д d д  E Е e е Ye Є ye є Zh Ж zh ж Z З z з Y Й y й I І i і Yi Ї yi ї Y y K k L l M m N n O o	P p	R r S s	T t	U u	F f Kh kh Ts ts Ch ch Sh sh Shch shch Yu yu Ya ya", " ")*)
;     ; charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]ъaфsыdвfаgпhрjоkлlд;ж'э\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}ЪAФSЫDВFАGПHРJОKЛLД:Ж"Э|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@"#№$;%%^:&?**(())__++`ё~Ё  ")*)
;     Loop Parse, text{
;         result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
;     }
;     return result
; }

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; Create the popup menu by adding some items to it.
global changeTextMenu := Menu()
; changeTextMenu.Add "En to RU", "textEnToRu_FC"
; changeTextMenu.Add "Ru to En", "textRuToEn_FC"
; changeTextMenu.Add "En to Ua", "textEnToUa_FC"
; changeTextMenu.Add "Ua to En", "textUaToEn_FC"
; changeTextMenu.Add  ; Add a separator line.

changeTextMenu.Add("En to RU", MenuHandler)
changeTextMenu.Add("Ru to En", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("En to Ua", MenuHandler)
changeTextMenu.Add("Ua to En", MenuHandler)
changeTextMenu.Add
; transliteration
changeTextMenu.Add("En translit RU", MenuHandler)
changeTextMenu.Add("Ru translit En", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("En translit Ua", MenuHandler)
changeTextMenu.Add("Ua translit En", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("Ua fan to Ru", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("Encrypt", MenuHandler)
changeTextMenu.Add("Decrypt", MenuHandler)


; ; Create another menu destined to become a submenu of the above menu.
; Submenu1 := Menu.New()
; Submenu1.Add "Item A", "MenuHandler"
; Submenu1.Add "Item B", "MenuHandler"

; ; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
; changeTextMenu.Add "My Submenu", Submenu1

; changeTextMenu.Add  ; Add a separator line below the submenu.
; changeTextMenu.Add "Item 3", "MenuHandler"  ; Add another menu item beneath the submenu.

MenuHandler(Item, *) {
    Switch Item
    {
        Case "En to RU": textEnToRu_FC
        Case "Ru to En": textRuToEn_FC
        Case "En to Ua": textEnToUa_FC
        Case "Ua to En": textUaToEn_FC
        Case "Ua fan to Ru": textUaFanToRu_FC
    }
}

#F7::changeTextMenu.Show  ; i.e. press the Win-Z hotkey to show the menu.

; changeTextToRu_FC(text) {
;     newtext := ""
;     Loop parse, text, ""
;     {
;         Switch A_LoopField
;         {
;             Case "q": l := "й"
;             Case "w": l := "ц"
;             Case "e": l := "у"
;             Case "r": l := "к"
;             Case "t": l := "е"
;             Case "y": l := "н"
;             Case "u": l := "г"
;             Case "i": l := "ш"
;             Case "o": l := "щ"
;             Case "p": l := "з"
;             Case "[": l := "х"
;             Case "]": l := "ъ"
;             Case "a": l := "ф"
;             Case "s": l := "ы"
;             Case "d": l := "в"
;             Case "f": l := "а"
;             Case "g": l := "п"
;             Case "h": l := "р"
;             Case "j": l := "о"
;             Case "k": l := "л"
;             Case "l": l := "д"
;             Case ";": l := "ж"
;             Case "'": l := "э"
;             Case "\": l := "\"
;             Case "z": l := "я"
;             Case "x": l := "ч"
;             Case "c": l := "с"
;             Case "v": l := "м"
;             Case "b": l := "и"
;             Case "n": l := "т"
;             Case "m": l := "ь"
;             Case ",": l := "б"
;             Case ".": l := "ю"
;             Case "/": l := "."
;             Case "Q": l := "Й"
;             Case "W": l := "Ц"
;             Case "E": l := "У"
;             Case "R": l := "К"
;             Case "T": l := "Е"
;             Case "Y": l := "Н"
;             Case "U": l := "Г"
;             Case "I": l := "Ш"
;             Case "O": l := "Щ"
;             Case "P": l := "З"
;             Case "{": l := "Х"
;             Case "}": l := "Ъ"
;             Case "A": l := "Ф"
;             Case "S": l := "Ы"
;             Case "D": l := "В"
;             Case "F": l := "А"
;             Case "G": l := "П"
;             Case "H": l := "Р"
;             Case "J": l := "О"
;             Case "K": l := "Л"
;             Case "L": l := "Д"
;             Case ":": l := "Ж"
;             Case '"': l := "Э"
;             Case "|": l := "/"
;             Case "Z": l := "Я"
;             Case "X": l := "Ч"
;             Case "C": l := "С"
;             Case "V": l := "М"
;             Case "B": l := "И"
;             Case "N": l := "Т"
;             Case "M": l := "Ь"
;             Case "<": l := "Б"
;             Case ">": l := "Ю"
;             Case "?": l := ","
;             Case "@": l := '"'
;             Case "#": l := "№"
;             Case "$": l := ";"
;             Case "^": l := ":"
;             Case "&": l := "?"
;             Case "``": l := "ё"
;             Case "~": l := "Ё"
;             Case " ": l := " "

;             Default:  l := ""
;         }
;         newtext := newtext l
;     }

;     return newtext
; }

; changeTextToEn_FC(text) {
;     newtext := ""
;     Loop parse, text, ""
;     {
;         Switch A_LoopField
;         {
;             Case "й": l :="q" 
;             Case "ц": l :="w" 
;             Case "у": l :="e" 
;             Case "к": l :="r" 
;             Case "е": l :="t" 
;             Case "н": l :="y" 
;             Case "г": l :="u" 
;             Case "ш": l :="i" 
;             Case "щ": l :="o" 
;             Case "з": l :="p" 
;             Case "х": l :="[" 
;             Case "ъ": l :="]" 
;             Case "ф": l :="a" 
;             Case "ы": l :="s" 
;             Case "в": l :="d" 
;             Case "а": l :="f" 
;             Case "п": l :="g" 
;             Case "р": l :="h" 
;             Case "о": l :="j" 
;             Case "л": l :="k" 
;             Case "д": l :="l" 
;             Case "ж": l :=";" 
;             Case "э": l :="'" 
;             Case "\": l :="\" 
;             Case "я": l :="z" 
;             Case "ч": l :="x" 
;             Case "с": l :="c" 
;             Case "м": l :="v" 
;             Case "и": l :="b" 
;             Case "т": l :="n" 
;             Case "ь": l :="m" 
;             Case "б": l :="," 
;             Case "ю": l :="." 
;             Case ".": l :="/" 
;             Case "Й": l :="Q" 
;             Case "Ц": l :="W" 
;             Case "У": l :="E" 
;             Case "К": l :="R" 
;             Case "Е": l :="T" 
;             Case "Н": l :="Y" 
;             Case "Г": l :="U" 
;             Case "Ш": l :="I" 
;             Case "Щ": l :="O" 
;             Case "З": l :="P" 
;             Case "Х": l :="{" 
;             Case "Ъ": l :="}" 
;             Case "Ф": l :="A" 
;             Case "Ы": l :="S" 
;             Case "В": l :="D" 
;             Case "А": l :="F" 
;             Case "П": l :="G" 
;             Case "Р": l :="H" 
;             Case "О": l :="J" 
;             Case "Л": l :="K" 
;             Case "Д": l :="L" 
;             Case "Ж": l :=":" 
;             Case "Э": l :='"' 
;             Case "/": l :="|" 
;             Case "Я": l :="Z" 
;             Case "Ч": l :="X" 
;             Case "С": l :="C" 
;             Case "М": l :="V" 
;             Case "И": l :="B" 
;             Case "Т": l :="N" 
;             Case "Ь": l :="M" 
;             Case "Б": l :="<" 
;             Case "Ю": l :=">" 
;             Case ",": l :="?" 
;             Case '"': l :="@" 
;             Case "№": l :="#" 
;             Case ";": l :="$" 
;             Case ":": l :="^" 
;             Case "?": l :="&" 
;             Case "ё": l :="``" 
;             Case "Ё": l :="~" 
;             Case " ": l :=" " 

;             Default:  l := ""
;         }
;         newtext := newtext l
;     }

;     return newtext
; }

; changeTextToUa_FC(text) {
;     newtext := ""
;     Loop parse, text, ""
;     {
;         Switch A_LoopField
;         {
;             Case "q": l := "й"
;             Case "w": l := "ц"
;             Case "e": l := "у"
;             Case "r": l := "к"
;             Case "t": l := "е"
;             Case "y": l := "н"
;             Case "u": l := "г"
;             Case "i": l := "ш"
;             Case "o": l := "щ"
;             Case "p": l := "з"
;             Case "[": l := "х"
;             Case "]": l := "ї"
;             Case "a": l := "ф"
;             Case "s": l := "і"
;             Case "d": l := "в"
;             Case "f": l := "а"
;             Case "g": l := "п"
;             Case "h": l := "р"
;             Case "j": l := "о"
;             Case "k": l := "л"
;             Case "l": l := "д"
;             Case ";": l := "ж"
;             Case "'": l := "є"
;             Case "\": l := "\"
;             Case "z": l := "я"
;             Case "x": l := "ч"
;             Case "c": l := "с"
;             Case "v": l := "м"
;             Case "b": l := "и"
;             Case "n": l := "т"
;             Case "m": l := "ь"
;             Case ",": l := "б"
;             Case ".": l := "ю"
;             Case "/": l := "."
;             Case "Q": l := "Й"
;             Case "W": l := "Ц"
;             Case "E": l := "У"
;             Case "R": l := "К"
;             Case "T": l := "Е"
;             Case "Y": l := "Н"
;             Case "U": l := "Г"
;             Case "I": l := "Ш"
;             Case "O": l := "Щ"
;             Case "P": l := "З"
;             Case "{": l := "Х"
;             Case "}": l := "Ї"
;             Case "A": l := "Ф"
;             Case "S": l := "І"
;             Case "D": l := "В"
;             Case "F": l := "А"
;             Case "G": l := "П"
;             Case "H": l := "Р"
;             Case "J": l := "О"
;             Case "K": l := "Л"
;             Case "L": l := "Д"
;             Case ":": l := "Ж"
;             Case '"': l := "Є"
;             Case "|": l := "/"
;             Case "Z": l := "Я"
;             Case "X": l := "Ч"
;             Case "C": l := "С"
;             Case "V": l := "М"
;             Case "B": l := "И"
;             Case "N": l := "Т"
;             Case "M": l := "Ь"
;             Case "<": l := "Б"
;             Case ">": l := "Ю"
;             Case "?": l := ","
;             Case "@": l := '"'
;             Case "#": l := "№"
;             Case "$": l := ";"
;             Case "^": l := ":"
;             Case "&": l := "?"
;             Case "``": l := "'"
;             Case "~": l := "₴"
;             Case " ": l := " "

;             Default:  l := ""
;         }
;         newtext := newtext l
;     }

;     return newtext
; }
