domethingAHK(blankargument) {
    something_ahk := {}
    something_ahk.keyPath := A_WorkingDir "\Tools\Something\Keys\"

    if FileExist(something_ahk.keyPath "key.txt") {
        keyLoad := FileRead(something_ahk.keyPath "key.txt")
    } else {
        SoundPlay "*-1, WAIT"
        ; Say("Something.AHK.can't find key.txt! Generate a new key. Don't foget to save the key!", 2, , , , "WRNNG")
        MsgBox('"Something.ahk"' "can't find key.txt file!`nIt will be generating a new key.`nDon't forget to save the key!", , "Ok icon!")
        keyLoad := ""
        loop 12
        keyLoad := keyLoad Random(11111111, 99999999)
    }
    textbintext := Gui()

    textbintext.MarginX := 16
    textbintext.MarginY := 16

    ; textbintext.Add("Text", "cCCCCCC section", Text1 Text2 Text3)	; Save this control's position and start a new section.
    ; textbintext.Add("GroupBox", "cCCCCCC w116 h96", "Complete")


    ; textbintext.Add("Text", "cCCCCCC section xm", "Short hotstring:")
    hotStringText := textbintext.Add("Edit", "vtext section w700 h200").value := 'Put your text here and click the "Convert 10 to 2" button!'
    toBin := textbintext.Add("Button", "section w342", "↓↓↓↓↓     Convert 10 to 2     ↓↓↓↓↓")
    toText := textbintext.Add("Button", "w342", "↑↑↑↑↑     Convert 2 to 10     ↑↑↑↑↑")
    eToBin := textbintext.Add("Button", "ys w342", "↓↓↓↓↓     Encrypt and Convert 10 to 2     ↓↓↓↓↓")
    dToText := textbintext.Add("Button", "w342", "↑↑↑↑↑     Decrypt and Convert 2 to 10     ↑↑↑↑↑")
    textbintext.Add("Edit", "vbin section w700 h200 xm")
    textbintext.Add("Text", "cCCCCCC section xm", "Key:")
    generateKey := textbintext.Add("Button", "vgenKey section w40 ys+20 xs h20", "new")

    textbintext.Add("Edit", "vkey section w620 h40 xs+40 ys-20").value := keyLoad
    openKeyFile := textbintext.Add("Button", "vopenKey section w40 xs+620 h20 ys", "open")
    saveKeyFile := textbintext.Add("Button", "vsaveKey section w40 ys+20 xs h20", "save")
  


    ; selectDir.OnEvent("Click", (*) => dirSel(textbintext))
    toBin.OnEvent("Click", (*) => convertToBin(textbintext))
    toText.OnEvent("Click", (*) => convertToText(textbintext))
    eToBin.OnEvent("Click", (*) => encryptToBin(textbintext))
    dToText.OnEvent("Click", (*) => decryptToText(textbintext))
    generateKey.OnEvent("Click", (*) => genRandomKey(textbintext))
    openKeyFile.OnEvent("Click", (*) => openFile(textbintext))
    saveKeyFile.OnEvent("Click", (*) => saveFile(textbintext))
    ; bthTwo.OnEvent("Click", (*) => dirSel(textbintext))
    ; btnThree.OnEvent("Click", (*) => dirSel(textbintext))
    ; SB := textbintext.Add("StatusBar", "", "Waiting for action!")

    textbintext.OnEvent("Close", ProcessUserExit)
    textbintext.OnEvent("Escape", ProcessUserExit)

    textbintext.BackColor := "333333"
    ; btnOk.Opt("0x8000")
    textbintext.Title := "Text To Bin To Text"
    ; textbintext.Opt("DPIScale")
    textbintext.Opt("ToolWindow")
    textbintext.Opt("+E0x40000")
    ; textbintext.Opt("0x400000")
    ; textbintext.Opt("-Theme")

    ; textbintext.Opt("-SysMenu")
    ; btnOk.SetColor "White"
    textbintext.Show()

    genRandomKey(thisGui, *){
        key := thisGui["key"]
        randomKey := ""
        ; countEight := Random(8, 256)
        loop 12
            randomKey := randomKey Random(11111111, 99999999)
        key.value := randomKey
    }

    openFile(thisGui, *) {
        key := thisGui["key"]
        getPath := FileSelect("F", "key.txt" , "Select a folder", "Key Files (*.txt; *.key)")
        if getPath
            key.value := FileRead(getPath)
    }

    saveFile(thisGui, *) {
        key := thisGui["key"]
        getPath := FileSelect("S", "key.txt", "Select a folder", "Key Files (*.txt)")
        if getPath{
            If FileExist(getPath){
                Result := MsgBox("File exist. Would you like to overide?", , "OC icon!")
                if Result = "OK"{
                    FileDelete getPath
                    FileAppend(key.value, getPath)
                }

            }
        }
    }

    ProcessUserExit(thisGui, *) {
        textbintext.Destroy()
    }

    convertToBin(thisGui, *) {
        text := thisGui["text"]
        bin := thisGui["bin"]
        bin.value := ""
        bin.value := txt2bin(text.text)

    }

    convertToText(thisGui, *) {
        text := thisGui["text"]
        bin := thisGui["bin"]
        text.value := ""
        text.value := bin2txt(bin.text)
    }

    encryptToBin(thisGui, *) {
        text := thisGui["text"]
        bin := thisGui["bin"]
        key := thisGui["key"]
        ; stringKey := StrReplace(key.value, "0", "1")
        ; if Trim(stringKey) != "" && StrLen(Trim(stringKey)) >= 32{
            decryptStr := txt2bin2enc(text.text, key.text)
            if !decryptStr {

            } else{
                bin.value := ""
                sleep 100
                bin.value := decryptStr
            }
        ; } else {
        ;     Say("key missing", , , , , "ERR")
        ; }

; keyOne := [2, 3, 4, 2, 5, 1, 9, 3, 7, 9, 9, 9, 2, 6, 2, 2]
; keyTwo := [2, 3, 4, 2, 5, 1, 9, 3, 7, 9, 9, 9, 2, 6, 2, 2]
;     bin.value := txt2bin(text.text, keyOne, keyTwo)
    }

    decryptToText(thisGui, *) {
        text := thisGui["text"]
        bin := thisGui["bin"]
        key := thisGui["key"]
        ; stringKey := StrReplace(key.value, "0", "1")
        ; if Trim(stringKey) != "" && StrLen(Trim(stringKey)) >= 32{


            decryptStr := bin2txt2dec(bin.text, key.value)
            if !decryptStr {
                
            } else {
                text.value := ""
                sleep 100
                text.value := decryptStr
            }

        ; } else {
        ;     Say("key is wrong or too short", , , , , "ERR")
        ; }

        ; keyOne := [2, 3, 4, 2, 5, 1, 9, 3, 7, 9, 9, 9, 2, 6, 2, 2]
        ; keyTwo := [2, 3, 4, 2, 5, 1, 9, 3, 7, 9, 9, 9, 2, 6, 2, 2]
        ; text.value := bin2txt(bin.text, keyOne, keyTwo)


    }

    
}


















; getCode(key, index) {
;     key := StrReplace(key, "0", "1")
;     if Trim(key) != "" && StrLen(Trim(key)) >= 32 {
;         f := getFirstChar(key)
;         l := getLastChar(key)
;         keyOne := StrSplit(SubStr(key, 1, 16))
;         keyTwo := StrSplit(SubStr(key, 17, 16))
;         number := keyOne[keyTwo[index]]
;         return number
;     } else {
;         return false
;     }
; }



; txt2bin2enc(str, key) {
;     if key != "" {
;         str := encode(str, key)
;     }
;     str := bin2txt(str)
;     return str
; }

; bin2txt2dec(str, key) {
;     if key != "" {
;         str := decode(str, key)
;         if !str {
;             Say("KEY IS WRONG!", , , , , "ERR")
;             return false
;         }
;     }
;     str := txt2bin(str)
;     return str
; }



; txt2bin(str, key := "")
; {
;     values := ""
;     Loop parse, str
;     {
;         ; code := getCode(key, A_index)
;         tobin := Ord(A_LoopField)
;         bin := numchar2bin(tobin)
;         values := values bin " "
;     }

;     return Trim(values)
; }


; bin2txt(str)
; {

;     alltext := ""
;     oldStr := ""
;     str := Trim(str)
;     Loop parse, str, " "
;     {

;         text := ""
;         ; code := getCode(key, A_index)
;                 ; MsgBox "bin2txt: " A_LoopField
;         ; MsgBox "A_LoopField: " A_LoopField
;         charNum := bin2numchar(A_LoopField)
;         ; MsgBox "charNum: " charNum " = " Chr(charNum)
;         ; If !charNum {
;         ;     return false
;         ; } else
;         if charNum > 127 {
;             oldStr := oldStr A_LoopField " "

;             If StrLen(oldStr) <= 9 {
;                 continue
;             }

;             charNum := bin2numchar(Trim(oldStr))
;             ; If !charNum {
;             ;     return false
;             ; }
;         }
        
;         oldStr := ""
                            
;         text := Chr(charNum)

;         alltext := alltext text
;     }
;     return alltext
; }


; bin2numchar(toNum) {
;     bin := ""
;     newNum := 0

;     ; if keyOne != "" && keyTwo != "" {
;     ;     toNum := decode(toNum, keyOne, keyTwo)
;     ; }
;     ; MsgBox "bin2numchar: " toNum
;     if StrLen(toNum) <= 9 {
;         cycle := 8
        
;     } else {
;         cycle := 11
;         ; Try {
;         toNumArr := StrSplit(toNum, A_Space)
;         toNum_1 := SubStr(toNumArr[1], 4, 5)
;         toNum_2 := SubStr(toNumArr[2], 3, 6)
;         toNum := toNum_1 toNum_2
;         ; } catch {
;         ;     return false
;         ; }


;     }
;         ; MsgBox "bin2numchar.string: " toNum

;     loop cycle
;     {

;         bin := SubStr(toNum, cycle, 1)
;         num := bin * (2 ** (A_Index - 1))

;         newNum := newNum + num
;         cycle := cycle - 1

;     }
;     return newNum
; }



; numchar2bin(tobin) {
;     bin := ""

;     if tobin > 255 {
;         cycle := 11
;     } else {
;         cycle := 8
;     }

;     ; if f = 16 {
;     ;     cycle := 11
;     ; } else {
;     ;     cycle := 8
;     ; }
;     code := 1
;     loop cycle
;     {
;         if tobin > 0 {
;             binCode := Mod(tobin, 2)
;             tobin := Floor(tobin / 2)
;         } else {
;             binCode := 0
;         }
;         bin := binCode bin
;     }

;     if cycle = 11 {
;         bin_1 := "110" SubStr(bin, 1, 5)
;         bin_2 := "10" SubStr(bin, 6, 6)
;         bin := bin_1 " " bin_2
;     }

;     return bin
; }

; ; ; tess := Ord("H")
; ; MsgBox Ord("H")
; ; ; A_Clipboard := num2bin(tess, 8)
; ; ; MSgBox A_Clipboard

; num2bin(tobin) {
;     bin := ""

;     loop 8
;     {
;         if tobin > 0 {
;             binCode := Mod(tobin, 2)
;             tobin := Floor(tobin / 2)
;         } else {
;             binCode := 0
;         }
;         bin := binCode bin
;     }

;     return bin
; }

; ; bin2num(toNum) {
; ;     bin := ""
; ;     newNum := 0
; ;     cycle := 8

; ;     loop cycle
; ;     {

; ;         bin := SubStr(toNum, cycle, 1)
; ;         num := bin * (2 ** (A_Index - 1))

; ;         newNum := newNum + num
; ;         cycle := cycle - 1

; ;     }
; ;     return newNum
; ; }


; encode(bin, key){
;     tempBin := ""
;     index := 1
;     Loop Parse, bin {
;         if A_LoopField != " " {
;             i := getCode(key, index)
;             if !i {
;                 return false
;             } else {
;                 ; MsgBox i
;                 temp := A_LoopField + getLastChar(num2bin(i))
;                 index++
;                 if index >= 16 {
;                     index := 1
;                 }
;             }
;         } else {
;             temp := A_LoopField
;         }
;         tempBin := tempBin temp
;     }
;     ; tempBin := txt2bin(tempBin)
;     return tempBin
; }

; decode(num, key) {
;     ; num := bin2txt(num)
;     tempNum := ""
;     index := 1
;     Loop Parse, num {
;         if A_LoopField != " " {
;             i := getCode(key, index)
;             if !i {
;                 return false
;             } else {
;                 temp := A_LoopField - getLastChar(num2bin(i))
;                     index++
;                 if index >= 16 {
;                     index := 1
;                 }
;             }

;         } else {
;             temp := A_LoopField
;         }
;             If temp != 0 or temp != 1 {
;                 return false
;             } else {
;                 tempNum := tempNum temp
;             }
;     }
;     return tempNum
; }


; setSomething(text) {
;     loop parse, text
;         str .= Chr(Ord(A_LoopField) ^ 0x5016)
;     return str
; }

; getSomething(text) {
;     loop parse, text
;         str .= Chr(A_LoopField) ^ 0x5016
;     return str
; }getCode(key, index) {
;     key := StrReplace(key, "0", "1")
;     if Trim(key) != "" && StrLen(Trim(key)) >= 32 {
;         f := getFirstChar(key)
;         l := getLastChar(key)
;         keyOne := StrSplit(SubStr(key, 1, 16))
;         keyTwo := StrSplit(SubStr(key, 17, 16))
;         number := keyOne[keyTwo[index]]
;         return number
;     } else {
;         return false
;     }
; }



; txt2bin2enc(str, key) {
;     if key != "" {
;         str := encode(str, key)
;     }
;     str := bin2txt(str)
;     return str
; }

; bin2txt2dec(str, key) {
;     if key != "" {
;         str := decode(str, key)
;         if !str {
;             Say("KEY IS WRONG!", , , , , "ERR")
;             return false
;         }
;     }
;     str := txt2bin(str)
;     return str
; }



; txt2bin(str, key := "")
; {
;     values := ""
;     Loop parse, str
;     {
;         ; code := getCode(key, A_index)
;         tobin := Ord(A_LoopField)
;         bin := numchar2bin(tobin)
;         values := values bin " "
;     }

;     return Trim(values)
; }


; bin2txt(str)
; {

;     alltext := ""
;     oldStr := ""
;     str := Trim(str)
;     Loop parse, str, " "
;     {

;         text := ""
;         ; code := getCode(key, A_index)
;                 ; MsgBox "bin2txt: " A_LoopField
;         ; MsgBox "A_LoopField: " A_LoopField
;         charNum := bin2numchar(A_LoopField)
;         ; MsgBox "charNum: " charNum " = " Chr(charNum)
;         ; If !charNum {
;         ;     return false
;         ; } else
;         if charNum > 127 {
;             oldStr := oldStr A_LoopField " "

;             If StrLen(oldStr) <= 9 {
;                 continue
;             }

;             charNum := bin2numchar(Trim(oldStr))
;             ; If !charNum {
;             ;     return false
;             ; }
;         }
        
;         oldStr := ""
                            
;         text := Chr(charNum)

;         alltext := alltext text
;     }
;     return alltext
; }


; bin2numchar(toNum) {
;     bin := ""
;     newNum := 0

;     ; if keyOne != "" && keyTwo != "" {
;     ;     toNum := decode(toNum, keyOne, keyTwo)
;     ; }
;     ; MsgBox "bin2numchar: " toNum
;     if StrLen(toNum) <= 9 {
;         cycle := 8
        
;     } else {
;         cycle := 11
;         ; Try {
;         toNumArr := StrSplit(toNum, A_Space)
;         toNum_1 := SubStr(toNumArr[1], 4, 5)
;         toNum_2 := SubStr(toNumArr[2], 3, 6)
;         toNum := toNum_1 toNum_2
;         ; } catch {
;         ;     return false
;         ; }


;     }
;         ; MsgBox "bin2numchar.string: " toNum

;     loop cycle
;     {

;         bin := SubStr(toNum, cycle, 1)
;         num := bin * (2 ** (A_Index - 1))

;         newNum := newNum + num
;         cycle := cycle - 1

;     }
;     return newNum
; }



; numchar2bin(tobin) {
;     bin := ""

;     if tobin > 255 {
;         cycle := 11
;     } else {
;         cycle := 8
;     }

;     ; if f = 16 {
;     ;     cycle := 11
;     ; } else {
;     ;     cycle := 8
;     ; }
;     code := 1
;     loop cycle
;     {
;         if tobin > 0 {
;             binCode := Mod(tobin, 2)
;             tobin := Floor(tobin / 2)
;         } else {
;             binCode := 0
;         }
;         bin := binCode bin
;     }

;     if cycle = 11 {
;         bin_1 := "110" SubStr(bin, 1, 5)
;         bin_2 := "10" SubStr(bin, 6, 6)
;         bin := bin_1 " " bin_2
;     }

;     return bin
; }

; ; ; tess := Ord("H")
; ; MsgBox Ord("H")
; ; ; A_Clipboard := num2bin(tess, 8)
; ; ; MSgBox A_Clipboard

; num2bin(tobin) {
;     bin := ""

;     loop 8
;     {
;         if tobin > 0 {
;             binCode := Mod(tobin, 2)
;             tobin := Floor(tobin / 2)
;         } else {
;             binCode := 0
;         }
;         bin := binCode bin
;     }

;     return bin
; }

; ; bin2num(toNum) {
; ;     bin := ""
; ;     newNum := 0
; ;     cycle := 8

; ;     loop cycle
; ;     {

; ;         bin := SubStr(toNum, cycle, 1)
; ;         num := bin * (2 ** (A_Index - 1))

; ;         newNum := newNum + num
; ;         cycle := cycle - 1

; ;     }
; ;     return newNum
; ; }


; encode(bin, key){
;     tempBin := ""
;     index := 1
;     Loop Parse, bin {
;         if A_LoopField != " " {
;             i := getCode(key, index)
;             if !i {
;                 return false
;             } else {
;                 ; MsgBox i
;                 temp := A_LoopField + getLastChar(num2bin(i))
;                 index++
;                 if index >= 16 {
;                     index := 1
;                 }
;             }
;         } else {
;             temp := A_LoopField
;         }
;         tempBin := tempBin temp
;     }
;     ; tempBin := txt2bin(tempBin)
;     return tempBin
; }

; decode(num, key) {
;     ; num := bin2txt(num)
;     tempNum := ""
;     index := 1
;     Loop Parse, num {
;         if A_LoopField != " " {
;             i := getCode(key, index)
;             if !i {
;                 return false
;             } else {
;                 temp := A_LoopField - getLastChar(num2bin(i))
;                     index++
;                 if index >= 16 {
;                     index := 1
;                 }
;             }

;         } else {
;             temp := A_LoopField
;         }
;             If temp != 0 or temp != 1 {
;                 return false
;             } else {
;                 tempNum := tempNum temp
;             }
;     }
;     return tempNum
; }


; setSomething(text) {
;     loop parse, text
;         str .= Chr(Ord(A_LoopField) ^ 0x5016)
;     return str
; }

; getSomething(text) {
;     loop parse, text
;         str .= Chr(A_LoopField) ^ 0x5016
;     return str
; }