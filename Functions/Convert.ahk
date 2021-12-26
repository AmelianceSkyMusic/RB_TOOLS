getCode(key, index) {
    key := StrReplace(key, "0", "1")
    if Trim(key) != "" && StrLen(Trim(key)) >= 32 {
        f := getFirstChar(key)
        l := getLastChar(key)
        keyOne := StrSplit(SubStr(key, 1, 16))
        keyTwo := StrSplit(SubStr(key, 17, 16))
        number := keyOne[keyTwo[index]]
        return number
    } else {
        return false
    }
}

txt2bin2enc(str, key) {
    if key != "" {
        str := encode(str, key)
    }
    str := bin2txt(str)
    return str
}

bin2txt2dec(str, key) {
    if key != "" {
        str := decode(str, key)
        if !str {
            Say("KEY IS WRONG!", , , , , "ERR")
            return false
        }
    }
    str := txt2bin(str)
    return str
}

txt2bin(str, key := "")
{
    values := ""
    Loop parse, str
    {
        ; code := getCode(key, A_index)
        tobin := Ord(A_LoopField)
        bin := numchar2bin(tobin)
        values := values bin " "
    }

    return Trim(values)
}

bin2txt(str)
{

    alltext := ""
    oldStr := ""
    str := Trim(str)
    Loop parse, str, " "
    {

        text := ""
        ; code := getCode(key, A_index)
        ; MsgBox "bin2txt: " A_LoopField
        ; MsgBox "A_LoopField: " A_LoopField
        charNum := bin2numchar(A_LoopField)
        ; MsgBox "charNum: " charNum " = " Chr(charNum)
        ; If !charNum {
        ;     return false
        ; } else
        if charNum > 127 {
            oldStr := oldStr A_LoopField " "

            If StrLen(oldStr) <= 9 {
                continue
            }

            charNum := bin2numchar(Trim(oldStr))
            ; If !charNum {
            ;     return false
            ; }
        }

        oldStr := ""

        text := Chr(charNum)

        alltext := alltext text
    }
    return alltext
}

bin2numchar(toNum) {
    bin := ""
    newNum := 0

    ; if keyOne != "" && keyTwo != "" {
    ;     toNum := decode(toNum, keyOne, keyTwo)
    ; }
    ; MsgBox "bin2numchar: " toNum
    if StrLen(toNum) <= 9 {
        cycle := 8

    } else {
        cycle := 11
        ; Try {
        toNumArr := StrSplit(toNum, A_Space)
        toNum_1 := SubStr(toNumArr[1], 4, 5)
        toNum_2 := SubStr(toNumArr[2], 3, 6)
        toNum := toNum_1 toNum_2
        ; } catch {
        ;     return false
        ; }

    }
    ; MsgBox "bin2numchar.string: " toNum

    loop cycle
    {

        bin := SubStr(toNum, cycle, 1)
        num := bin * (2 ** (A_Index - 1))

        newNum := newNum + num
        cycle := cycle - 1

    }
    return newNum
}

numchar2bin(tobin) {
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
    code := 1
    loop cycle
    {
        if tobin > 0 {
            binCode := Mod(tobin, 2)
            tobin := Floor(tobin / 2)
        } else {
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

num2bin(tobin) {
    bin := ""

    loop 8
    {
        if tobin > 0 {
            binCode := Mod(tobin, 2)
            tobin := Floor(tobin / 2)
        } else {
            binCode := 0
        }
        bin := binCode bin
    }

    return bin
}

; bin2num(toNum) {
;     bin := ""
;     newNum := 0
;     cycle := 8

;     loop cycle
;     {

;         bin := SubStr(toNum, cycle, 1)
;         num := bin * (2 ** (A_Index - 1))

;         newNum := newNum + num
;         cycle := cycle - 1

;     }
;     return newNum
; }

encode(bin, key) {
    tempBin := ""
    index := 1
    Loop Parse, bin {
        if A_LoopField != " " {
            i := getCode(key, index)
            if !i {
                return false
            } else {
                ; MsgBox i
                temp := A_LoopField + getLastChar(num2bin(i))
                index++
                if index >= 16 {
                    index := 1
                }
            }
        } else {
            temp := A_LoopField
        }
        tempBin := tempBin temp
    }
    ; tempBin := txt2bin(tempBin)
    return tempBin
}

decode(num, key) {
    ; num := bin2txt(num)
    tempNum := ""
    index := 1
    Loop Parse, num {
        if A_LoopField != " " {
            i := getCode(key, index)
            if !i {
                return false
            } else {
                temp := A_LoopField - getLastChar(num2bin(i))
                index++
                if index >= 16 {
                    index := 1
                }
            }

        } else {
            temp := A_LoopField
        }
        If temp != 0 or temp != 1 {
            return false
        } else {
            tempNum := tempNum temp
        }
    }
    return tempNum
}

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




bin2num(toNum) {
    bin := ""
    newNum := 0
    cycle := 8

    loop cycle
    {

        bin := SubStr(toNum, cycle, 1)
        num := bin * (2 ** (A_Index - 1))

        newNum := newNum + num
        cycle := cycle - 1

    }
    return newNum
}