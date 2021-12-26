;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance ignore 
SetKeyDelay -1

!Esc::Reload 
#include ../../RB [FUNCTION] Say.ahk
; Say "SCRIPTS ARE LOADED"

#^p:: {

}

#^o:: {
    file := "../../MENU_files/Programs.txt"

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

        line := Trim(A_LoopField)
        ; idx := A_Index
        ; lineIndex := A_Index
        firstChar := SubStr(line, 1, 1)
        if line = "" or firstChar = ";" { ;remove empty lines and comments lines
            ; idxCompensation++
            continue
        } else if firstChar = "#" { ;get item labels
            line := RegExReplace(line, " {3,}", "   ")
            itemNamesArr := StrSplit(line, "   ")
            ; Loop itemNamesArr.Length {
            ;     MsgBox itemNamesArr[A_Index]
            ; }
            ; MsgBox ("index: " tempMapcc["#"] "`ntype: " tempMapcc["type"] "`ntitle: " tempMapcc["title"] "`nkey: " tempMapcc["key"] "`nrun: " tempMapcc["run"] "`noptions: " tempMapcc["options"])

            ; idxCompensation++


        } else {
            tempMap := Map()
                        MsgBox itemNamesArr[6]
            ; newFile := newFile "`n" line
            line := RegExReplace(line, " {3,}", "   ")
            splitElementsArr := StrSplit(line, "   ")

            ; tempMap[itemNamesArr[2]] := "separator"
            ; MsgBox tempMap[itemNamesArr[2]]

            ; Loop splitElementsArr.Length {
                ; itemArr.InsertAt(lineIndex, splitElementsArr)
            ; }
            if splitElementsArr[1] = "----------" {
                tempMap[itemNamesArr[2]] := "separator"
                ; tempMap["index"] := ""
                ; idxCompensation++
                ; continue
            } else if splitElementsArr[1] = "-" {
                tempMap[itemNamesArr[2]] := "item"
                ; tempMap["index"] := idx-idxCompensation
            } else if splitElementsArr[1] = ">" {
                tempMap[itemNamesArr[2]] := "subMenuIn"
                ; tempMap["index"] := idx-idxCompensation
            } else if splitElementsArr[1] = "<" {
                tempMap[itemNamesArr[2]] := "subMenuOut"
                ; tempMap["index"] := ""
                ; idxCompensation++
                ; continue
            }

            try {   if splitElementsArr[2] != "|" {
                        tempMap[itemNamesArr[3]] := splitElementsArr[2]
                    } else {
                        tempMap[itemNamesArr[3]] := ""
                    }
            } catch {
                tempMap[itemNamesArr[3]] := ""
            }

                        
            try {   if splitElementsArr[3] != "|" {
                        tempMap[itemNamesArr[4]] := splitElementsArr[3]
                    } else {
                        tempMap[itemNamesArr[4]] := ""
                    }
            } catch {
                tempMap[itemNamesArr[4]] := ""
            }

                        
            try { if splitElementsArr[4] != "|" {
                        tempMap[itemNamesArr[5]] := splitElementsArr[4]
                    } else {
                        tempMap[itemNamesArr[5]] := ""
                    }
            } catch {
                tempMap[itemNamesArr[5]] := ""
            }

            try { if splitElementsArr[5] != "|" {
                        tempMap[itemNamesArr[6]] := splitElementsArr[5]
                    } else {
                        tempMap[itemNamesArr[6]] := ""
                    }
            } catch {
                tempMap[itemNamesArr[6]] := ""
            }

            try { if splitElementsArr[6] != "|" {
                        tempMap[itemNamesArr[7]] := splitElementsArr[6]
                    } else {
                        tempMap[itemNamesArr[7]] := ""
                    }
            } catch {
                tempMap[itemNamesArr[7]] := ""
            }
                        
            MsgBox ("type: " tempMap["type"] "`ntitle: " tempMap["title"] "`nicon: " tempMap["icon"] "`nkey: " tempMap["key"] "`nrun: " tempMap["run"] "`noptions: " tempMap["options"])

            itemArr.Push tempMap

        }
    }

;     ; MsgBox RegExMatch(menuTxt, "\|")

; FileDelete "../../MENU_files/Programs++.txt"
; FileAppend newFile, "../../MENU_files/Programs++.txt"
; line := ""

; file := "../../MENU_files/Programs++.txt"
; RegExMatch(file, "\w+$", &Extension)
; MsgBox Extension[]  ; Reports "txt".
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