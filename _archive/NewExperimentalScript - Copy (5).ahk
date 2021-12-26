;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance ignore 
SetKeyDelay -1

!Esc::Reload 
#include ../../RB [FUNCTION] Say.ahk
; Say "SCRIPTS ARE LOADED"

#^p:: {

}

#^o:: {
    ; file := "../../MENU_files/Programs.txt"
    file := "../../MENU_files/ok.txt"

    if FileExist(file) {
        menuTxt := FileRead(file)
    } else {
        SoundPlay "*-1, WAIT"
        Say("Can't find file", 2, , , ,"ERR")
        return
    }

    ; newFile := ""

    ; MsgBox Script.ReadLine() 
  
    ; idxCompensation := 0
    itemNamesArr := []
    itemArr := []
    loop Parse, menuTxt, "`n", "`r" {

        line := Trim(A_LoopField) ; trim spaces from start/end of line
        firstChar := SubStr(line, 1, 1) ; get dirst char

        if line = "" or firstChar = ";" { ;remove empty lines and comments lines
            continue

        } else if firstChar = "#" { ;get item labels
            line := RegExReplace(line, " {3,}", "   ")
            itemNamesArr := StrSplit(line, "   ")

        } else {
            tempMap := Map()

            line := RegExReplace(line, " {3,}", "   ")
            splitElementsArr := StrSplit(line, "   ")

                ; tempMap[itemNamesArr[1]] := "----------"

            if splitElementsArr[1] = "----" {
                tempMap[itemNamesArr[2]] := "separator"
                ; continue
            } else if splitElementsArr[1] = "-" {
                tempMap[itemNamesArr[2]] := "item"

            } else if splitElementsArr[1] = ">" {
                tempMap[itemNamesArr[2]] := "subMenuIn"

            } else if splitElementsArr[1] = "<" {
                tempMap[itemNamesArr[2]] := "subMenuOut"
                ; continue
            }

            try if splitElementsArr[2] != "|" {
                        tempMap[itemNamesArr[3]] := splitElementsArr[2]
                    } else {
                        ; tempMap[itemNamesArr[3]] := ""
                    }
            ; catch
            ;     tempMap[itemNamesArr[3]] := ""

                        
            try if splitElementsArr[3] != "|" {
                        tempMap[itemNamesArr[4]] := splitElementsArr[3]
                    } else {
                        ; tempMap[itemNamesArr[4]] := ""
                    }
            ; catch 
            ;     tempMap[itemNamesArr[4]] := ""

                        
            try if splitElementsArr[4] != "|" {
                        tempMap[itemNamesArr[5]] := splitElementsArr[4]
                    } else {
                        ; tempMap[itemNamesArr[5]] := ""
                    }
            ; catch 
            ;     tempMap[itemNamesArr[5]] := ""


            try if splitElementsArr[5] != "|" {
                        tempMap[itemNamesArr[6]] := true

                        tempArrStart := StrSplit(splitElementsArr[5], ", ")

                        if tempArrStart.Length > 1 {
                            Loop tempArrStart.Length {
                                tempArr := StrSplit(tempArrStart[A_Index], "=")
                                tempMap[tempArr[1]] := tempArr[2]
                            }
                        } else {
                                tempArr := StrSplit(splitElementsArr[5], "=")
                                tempMap[tempArr[1]] := tempArr[2]
                        }
                        
                    } else {
                        ; tempMap[itemNamesArr[6]] := ""
                    }
            ; catch
            ;     tempMap[itemNamesArr[6]] := ""


            try if splitElementsArr[6] != "|" {
                        tempMap[itemNamesArr[7]] := true
                        
                        tempArrStart := StrSplit(splitElementsArr[6], ", ")


                        if tempArrStart.Length > 1 {
                            Loop tempArrStart.Length {
                                tempArr := StrSplit(tempArrStart[A_Index], "=")
                                tempMap[tempArr[1]] := tempArr[2]
                            }
                        } else {
                                tempArr := StrSplit(splitElementsArr[6], "=")
                                tempMap[tempArr[1]] := tempArr[2]
                        }
                    } else {
                        ; tempMap[itemNamesArr[7]] := ""
                    }
            ; catch
            ;     tempMap[itemNamesArr[7]] := ""
                        
            ; MsgBox ( itemNamesArr[1]
            ;     "`n" itemNamesArr[2] ": " tempMap[itemNamesArr[2]]
            ;     "`n" itemNamesArr[3] ": " tempMap[itemNamesArr[3]]
            ;     "`n" itemNamesArr[4] ": " tempMap[itemNamesArr[4]]
            ;     "`n" itemNamesArr[5] ": " tempMap[itemNamesArr[5]]
            ;     "`n" itemNamesArr[6] ": " tempMap[itemNamesArr[6]]
            ;     "`n" itemNamesArr[7] ": " tempMap[itemNamesArr[7]] )
            ; tempText := ""
            ; Loop itemNamesArr.Length {
            ;     tempText := tempText "`n" itemNamesArr[A_Index] ": " tempMap[itemNamesArr[A_Index]]
            ; }
            ; MsgBox tempText

            itemArr.Push tempMap

        }
    }

MsgBox "stop"
}

#^i::{
    Haystack := "The quick brown fox jumps over the lazy dog."
RegExMatch(Haystack, "i)(The) (\w+)\b(?CCallout)")
Callout(m, n, *) {
    MsgBox "m[0]=" m[0] "`nm[1]=" m[1] "`nm[2]=" m[2]
    MsgBox n
    return 1
}
}

Say("reload")



;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------