﻿#h::{ ; горячая клавиша Win+H
; Получаем текущий выделенный текст. Вместо "ControlGet Selected" используется
; буфер обмена, так как он есть в большинстве редакторов
; (т.е. текстовых процессоров).  Сохраняем текущее содержимое буфера обмена,
; чтобы восстановить его позднее. Хотя обрабатывается только простой текст,
; это все же лучше, чем ничего:
; Trim "Off" ; Сохраняет любой межстрочный интервал и пробел в конце текстовой строки в буфере обмена.
ClipboardTemp := ClipboardAll()
A_Clipboard := "" ; Чтобы обнаружение заработало, нужно начать с пустого значения.
Send "^{c}"
ClipWait(1)
; Заменяем CRLF и/или LF на `n, чтобы использовать в строке автозамены опцию "send-raw" (R):
; Тоже самое делаем с любыми другими символами, иначе
; могут возникнуть проблемы в "сыром" режиме:
; Делаем эту замену вначале, чтобы избежать помех со стороны тех, которые идут далее.
; HotStr := StrReplace("Clipboard" , ``, `` ``, All)
; HotStr := StrReplace(Clipboard, Needle[, ReplaceText, CaseSense, OutputVarCount, Limit])

If Type(A_Clipboard) = "String"{
    HotStr := StrReplace(A_Clipboard, "``", "````")
    HotStr := StrReplace(HotStr, "`r`n", "``r")
    HotStr := StrReplace(HotStr, "`n", "``r")
    HotStr := StrReplace(HotStr, A_Tab, "``t")
    HotStr := StrReplace(HotStr, "`;", "```;")
    HotStr := Trim(HotStr)
} else {
    HotStr := ""
}




; StringReplace, ReplacedStr, InputVar, SearchText, ReplaceText, ReplaceAll
; StringReplace, HotStr, Clipboard, ``, ````, All
; StringReplace, HotStr, HotStr, `r`n, ``r, All ; В MS Word...`r работает лучше, чем `n.
; StringReplace, HotStr, HotStr, `n, ``r, All
; StringReplace, HotStr, HotStr, A_Tab, ``t, All
; StringReplace, HotStr, HotStr, `;, ```;, All
A_Clipboard := ClipboardTemp ; Восстанавливаем предыдущее содержимое буфера обмена.
; Каретка поля ввода (InputBox) устанавливается в более удобную позицию:
SetTimer MoveCaret, 10
; Показываем поле ввода (InputBox), обеспечивая строку автозамены по умолчанию:
Text1 := "Напечатайте вашу аббревиатуру в указанном месте."
Text2 := "При желании вы можете отредактировать текст замены.`n"
Text3 := "Пример аббревиатуры: btw, пример текста: by the way"
; InputBox, OutputVar , Title, Prompt, HIDE, Width, Height, X, Y, Locale, Timeout, Default
; IB := InputBox(Text1 Text2 Text3, "Новая автозамена", , ":r`:::" HotStr)
; HotStr := IB.value
; ; InputBox, Hotstring, Новая автозамена, %Text1%%Text2%%Text3%,,,,,,,, :R:`::%Hotstring%
; ; HotStr := InputBox([Prompt, Title, Options, Default])
; ; if ErrorLevel <> 0 ; Пользователь нажал Cancel.
; ; 	return

; If IB.result != "Cancel" {
;     If !InStr(HotStr, ":r`:::") && !InStr(HotStr, ":r`:::" HotStr)
;     {
;         MsgBox("GOOD")
;     } else {
;         MsgBox("Вы не напечатали аббревиатуру. Строка автозамены не добавлена.")
;         return
;     }
; }
; Иначе, добавляем строку автозамены и перезагружаем скрипт.
; Помещаем `n в начало, в случае, если в конце файла нет пустой строки.
; FileAppend("`n" HotStr, "D:\Others\Programs\AHK\RB TOOLS\Hotstrings\Data.ahk")
; Reload
; ; В случае успешного завершения перезагрузка закроет этот экземпляр скрипта в режиме ожидания,
; ; поэтому строка ниже никогда не будет исполнена.
; Sleep 200
; Text1 := "Только что добавленная строка неверно отформатирована. "
; Text2 := "Открыть файл для форматирования? "
; Text3 := "Обратите внимание, что неисправные строки автозамены находятся внизу скрипта."
; MsgBox, 4,, %Text1%%Text2%%Text3%
; IfMsgBox, Yes, Edit
; return

MoveCaret(){
    ; IfWinNotActive , Новая автозамена
    ; return
    ; ; Иначе, передвигаем курсор в поле ввода туда, где пользователь напечатает аббревиатуру.
    ; Send {
    ;     Home
    ; } {
    ;     Right 3
    ; }
    ; SetTimer , MoveCaret, Off
    ; return
}






    addHotstringGUI := Gui()

    addHotstringGUI.MarginX := 16
    addHotstringGUI.MarginY := 16 

    ; addHotstringGUI.Add("Text", "cCCCCCC section", Text1 Text2 Text3)	; Save this control's position and start a new section.
    ; addHotstringGUI.Add("GroupBox", "cCCCCCC w116 h96", "Complete")

    addHotstringGUI.Add("Radio", "cCCCCCC group checked vautoComplete section xm", "Autocomplete")
    addHotstringGUI.Add("Radio", "cCCCCCC vtabComplete ys", "Complete With Tab")
    addHotstringGUI.Add("Text", "cCCCCCC ys", "|")

    addHotstringGUI.Add("Radio", "cCCCCCC group checked vcaseToCase ys", "Case-To-Case Sensitive")
    addHotstringGUI.Add("Radio", "cCCCCCC vcaseSensitiveOn ys", "Case-Sensitive")
    addHotstringGUI.Add("Radio", "cCCCCCC vcaseSensitiveOff ys", "No Case-Sensitive")

    addHotstringGUI.Add("Checkbox", "cCCCCCC vexecute section xm", "Execute")
    addHotstringGUI.Add("Text", "cCCCCCC ys", "|")
    addHotstringGUI.Add("Checkbox", "cCCCCCC vtriggerInside ys", "Disable Trigger Inside Word")
    addHotstringGUI.Add("Text", "cCCCCCC ys", "|")
    addHotstringGUI.Add("Checkbox", "cCCCCCC vautoErasing ys", "Disable Autoerasing")
    addHotstringGUI.Add("Text", "cCCCCCC ys", "|")
    addHotstringGUI.Add("Checkbox", "cCCCCCC vasText ys", "Paste As Text")
    addHotstringGUI.Add("Text", "cCCCCCC ys", "|")
    addHotstringGUI.Add("Checkbox", "cCCCCCC vencrypt ys", "Encrypt")

    

    addHotstringGUI.Add("Text", "cCCCCCC section xm", "Short hotstring:")
    addHotstringGUI.Add("Text", "cCCCCCC", "String:")
    addHotstringGUI.Add("Text", "cCCCCCC", "Comment:")

    hotStringText := addHotstringGUI.Add("Edit", "vhotStringE w500 section ys") ; Start a new column within this section.
    addHotstringGUI.Add("Edit", "vstringE w500").value := HotStr
    addHotstringGUI.Add("Edit", "vcommentE w500")


    ; selectDir := addHotstringGUI.Add("Button", "vgetBtnOne section w20 hp xs+480 ys", "...")	; xm puts it at the bottom left corner.
    bthClear_1 := addHotstringGUI.Add("Button", "hp section xs+500 w75 ys", "clear")	; xm puts it at the bottom left corner.
    bthClear_2 := addHotstringGUI.Add("Button", "hp w75", "clear")	; xm puts it at the bottom left corner.
    bthClear_3 := addHotstringGUI.Add("Button", "hp w75", "clear")	; xm puts it at the bottom left corner.
    ; bthTwo := addHotstringGUI.Add("Button", , "...")  ; xm puts it at the bottom left corner.
    ; btnThree := addHotstringGUI.Add("Button", , "...")  ; xm puts it at the bottom left corner.

    ; selectDir.OnEvent("Click", (*) => dirSel(addHotstringGUI))
    bthClear_1.OnEvent("Click", (*) => clearInput_1(addHotstringGUI))
    bthClear_2.OnEvent("Click", (*) => clearInput_2(addHotstringGUI))
    bthClear_3.OnEvent("Click", (*) => clearInput_3(addHotstringGUI))
    ; bthTwo.OnEvent("Click", (*) => dirSel(addHotstringGUI))
    ; btnThree.OnEvent("Click", (*) => dirSel(addHotstringGUI))

    btnOk := addHotstringGUI.Add("Button", "default section xm w587 hp+20", "CREATE")	; xm puts it at the bottom left corner.
    btnOk.OnEvent("Click", (*) => ProcessUserInput(addHotstringGUI))

    btnCancel := addHotstringGUI.Add("Button", "section xs+587 ys w75 hp", "CANCEL")	; xm puts it at the bottom left corner.
    btnCancel.OnEvent("Click", ProcessUserExit)

    ; SB := addHotstringGUI.Add("StatusBar", "", "Waiting for action!")


    addHotstringGUI.OnEvent("Close", ProcessUserExit)
    addHotstringGUI.OnEvent("Escape", ProcessUserExit)

    addHotstringGUI.BackColor := "333333"
    ; btnOk.Opt("0x8000")
    addHotstringGUI.Title := "Add Hotstring To Data File"
    ; addHotstringGUI.Opt("DPIScale")
    addHotstringGUI.Opt("ToolWindow")
    addHotstringGUI.Opt("+E0x40000")
    ; addHotstringGUI.Opt("0x400000")
    ; addHotstringGUI.Opt("-Theme")

    ; addHotstringGUI.Opt("-SysMenu")
    ; btnOk.SetColor "White"
    addHotstringGUI.Show()

    ; WinSetAlwaysOnTop true, "Folder creator from path"

    ; WinSetTransColor("EEAA99", addHotstringGUI)

    ProcessUserInput(thisGui, *)
    {
        savedElm := thisGui.Submit(false)	; Save the contents of named controls into an object.
        If savedElm.hotStringE = "" or savedElm.stringE = "" {
            Say("Something were wrong!",,,,,"ERR")
            return
        } else {
            param := ""
            If savedElm.encrypt {
                param := param "x"
                savedElm.stringE := txt2bin(savedElm.stringE)
                savedElm.stringE := 'bin2txt("' savedElm.stringE '")'
            } else if savedElm.execute {
                param := param "x"
                savedElm.stringE := 'SendInput("' savedElm.stringE '")'
            }

            If savedElm.caseSensitiveOn {
                param := param "c"
            } else if savedElm.caseSensitiveOff {
                param := param "c1"
            }

            If savedElm.autoErasing {
                param := param "b0"
            }

            If savedElm.asText {
                param := param "r"
            }

            If savedElm.autoComplete {
                param := param "*"
            }

            If savedElm.triggerInside {
                param := param "?0"
            }

            HotStr := ":" param ":" savedElm.hotStringE "::" savedElm.stringE

            
            If savedElm.commentE != "" {
                HotStr := HotStr " `;" savedElm.commentE
            }
        }


        FileAppend("`n" HotStr, "D:\Others\Programs\AHK\RB TOOLS\Hotstrings\Data.ahk")
        ; Reload
        Say 'DONE'
        ; SB.SetText("Done!")
        ; Sleep 1000
        ; SB.SetText(HotStr)
    }

    ProcessUserExit(thisGui, *) {
        addHotstringGUI.Destroy()
    }

    clearInput_1(thisGui, *) {
        gPartOne := thisGui["hotString"]
        gPartOne.value := ""
    }

    clearInput_2(thisGui, *) {
        gPartTwo := thisGui["string"]
        gPartTwo.value := ""
    }

    clearInput_3(thisGui, *) {
        gPartTwo := thisGui["comment"]
        gPartTwo.value := ""
    }

    ; closeGui(thisGui, *){
    ;     ExitApp
    ; }

}

; encrypt(text){
;     Loop parse, text, ""
;     {   
;         NewChar := Ord(A_LoopField)
;         MsgBox A_Index ". The Code Of Char: " A_LoopField " = " Ord(A_LoopField)
;         MsgBox Chr(NewChar)
;     }
;     MsgBox text
;     return text
; }
; s :=  "Як справи?"
; hex := dec2bin(s)
; MsgBox hex

; dd := str2("Привет Олег!")
; MsgBox hex2(dd)


; str2(str)
; {
;     loop parse, str
;         new .= Format("{:x}", Ord(A_LoopField))
;     return new
; }

; hex2(str)
; {
;     loop parse, str
;         new .= Format("{:x}", Ord(A_LoopField))
;     return new
; }





; hexToStr(Hex)
; {
;     ; VarSetCapacity(Buf, StrLen(Hex) // 2, 0)
;     GrantedCapacity := VarSetStrCapacity(&Buf, StrLen(Hex))
;     ; Buf := ""
;     ; Addr := &Buf
;     ; MsgBox Addr
;     Loop parse, Hex
;     {
;         If (A_Index & 1)
;             C := A_LoopField
;         Else
;             Addr := NumPut("0x" . C . A_LoopField, Buf + 0, "UChar")
;     }
;     Str := StrGet(&Buf,, "UTF-16")
;     return Str
; }

; g2b(str)
; {
;     loop parse, str
;         new .= Chr(Ord(A_LoopField) ^ 0x5134)
;     return new
; }

; b2g(str)
; {
;     loop parse, str
;         new .= Chr(Ord(A_LoopField) ^ 0x5134)
;     return new
; }


; test := "hello"
; test1 := test * 1000
; Msgbox test1



; (string)
; {
;     autotrim , off
;     loop
;     {
;         var = 128
;         ascii = 0
;         StringRight , byte, string, 8
;         if byte =
;             break
;         StringTrimRight , string, string, 8
;         Loop , parse, byte
;         {
;             if a_loopfield = 1
;                 ascii += %var%
;             var /= 2
;         }
;         transform , text, Chr, %ascii%
;         alltext = %text%%alltext%
;     }
;     autotrim , on
;     return alltext
; }

key := [2,3,4,2,5,1,9,3,7,9,9,9,2,6,2,2,3,2,2]
getCode(key, i){
    number := key[i]/8
    return number
}


bin2txt(str, code:=1)
{
    oldStr := ""
    alltext := ""
    Loop parse, str, " "
    {   
        text := ""
        code := getCode(key, A_index)
        charNum := bin2numchar(A_LoopField)
        ; MsgBox "charNum: " charNum
        pp := A_LoopField
        if charNum > 127 {
            oldStr := oldStr A_LoopField " "

            If StrLen(oldStr) <= 9
                continue
            ; pp := Trim(oldStr)
            charNum := bin2numchar(Trim(oldStr))
            ; continue
        } else {
            
        }
        oldStr := ""
            ; MsgBox "pp: " pp
        text := Chr(charNum)
            
        ; ascii := 0

        ; Loop parse, A_LoopField
        ; {
        ;     if A_LoopField = 1
        ;         ascii += var
        ;     var /= 2
        ; }


        alltext := alltext text
    }
    ; Send alltext
    return alltext
}

txt2bin(str, code:=1)
{
    values := ""
    Loop parse, str
    {
        tobin := Ord(A_LoopField)
        bin := numchar2bin(tobin)
        values := values bin " "
    }
    return Trim(values)
}

; A_Clipboard := txt2bin("Привіт!")
; MsgBox A_Clipboard

MsgBox bin2txt("11010000 10011111 11010001 10000000 11010000 10111000 11010000 10110010 11010001 10010110 11010001 10000010 00100001")
; MsgBox bin2txt("01001000 01100101 01101100 01101100 01101111 00100001")

; bin2txt(str, code:=1)
; {
;     alltext := ""
;     Loop parse, str, " "
;     {
;         var := 65535
;         ascii := 0
;         ; byte := SubStr(string, 1, 8)
;         ; ; StringRight, byte, string, 8
;         ; byte := SubStr(string, 8)
;         ; MsgBox byte
;         ; if byte = ""
;         ;     break
;         ; ; StringTrimRight , string, string, 8
;         ; byte := SubStr(string, 8)
;         Loop parse, A_LoopField
;         {
;             if A_LoopField = 1
;                 ascii += var
;             var /= 2
;         }
;         code := getCode(key, A_index)
;         text := Chr(ascii/code)
;         alltext := alltext text
;     }
;     ; Send alltext
;     return alltext
; }

; txt2bin(str, code:=1)
; {
;     allvalues := ""
;     Loop parse, str
;     {
;         var := 65535
;         ; Transform , tobin, Asc, %A_LoopField%ÿÿØÿ ÿÿÿÿÿÿ
;         code := getCode(key, A_index)
;         tobin := Ord(A_LoopField)*code
        
;         tobin := 15
;         loop 16
;         {
;             oldtobin := tobin
;             tobin := tobin - var
;             ; transform , isnegative, Log, %tobin%
;             ; isnegative := Log(tobin)
;             value := 1
;             if tobin < 0
;             {
;                 tobin := oldtobin
;                 value := 0
;             }
;             var := var / 2
;             allvalues := allvalues value
;         }
;         allvalues := allvalues " "
;     }
;     return Trim(allvalues)
; }
; A_Clipboard := txt2bin("Ж")
; MsgBox A_Clipboard

; MsgBox bin2txt(A_Clipboard)
; 65535
numchar2bin(tobin){
    bin := ""

    if tobin > 255 {
        cycle := 11
    } else {
        cycle := 8
    }

    ; if f = 16 {
    ;     cycle := 11
    ; } else {
    ;     cycle := 8
    ; }

    loop cycle
    {   
        if tobin > 0 {
            binCode := Mod(tobin, 2)
            tobin := Floor(tobin/2)
        } else{
            binCode := 0
        }
        bin := binCode bin
    }

    if cycle = 11 {
        bin_1 := "110" SubStr(bin, 1, 5)
        bin_2 := "10" SubStr(bin, 6, 6)
        bin := bin_1 " " bin_2
    }

    return bin
}

; ; tess := Ord("H")
; MsgBox Ord("H")
; ; A_Clipboard := num2bin(tess, 8)
; ; MSgBox A_Clipboard

; MsgBox "Num " bin2num("01001000")
bin2numchar(toNum) {
    bin := ""
    newNum := 0
        MsgBox StrLen(toNum)
    if StrLen(toNum) <= 8 {
        cycle := 8
    } else {
        cycle := 11
        Loop parse, toNum, " "{
            toNum_1 := SubStr(A_LoopField, 4, 5)
            toNum_2 := SubStr(A_LoopField, 3, 6)
            toNum := toNum_1 toNum_2
        }
    }


    loop cycle
    {

        bin := SubStr(toNum, cycle, 1)
        num := bin*(2**(A_Index-1))

        newNum := newNum + num
        cycle := cycle - 1

    }
    return newNum
}

bin2num(toNum) {
    bin := ""
    newNum := 0
    cycle := 8

    loop cycle
    {

        bin := SubStr(toNum, cycle, 1)
        num := bin*(2**(A_Index-1))

        newNum := newNum + num
        cycle := cycle - 1

    }
    return newNum
}


; utf8ToBin(str) {
; 	; s = unescape( encodeURIComponent( s ) );
;     char := ""
;     out := ""

;     Loop parse, str {
; 		char := Ord(A_LoopField)
;         char := num2bin(char)
;         MsgBox char
;         loop 8 {

;             char := '0'  char
;     }
;                 out := out char
; }
; 	return out
; }

; MsgBox utf8ToBin("П")
; binToUtf8(s){
; 	var i = 0, l = s.length, chr, out = '';
; 	for( ; i < l; i += 8 ){
; 		chr = parseInt( s.substr( i, 8 ), 2 ).toString( 16 );
; 		out += '%' + ( ( chr.length % 2 == 0 ) ? chr : '0' + chr );
; 	}
; 	return decodeURIComponent( out );
; };