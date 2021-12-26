;# Win   ! Alt   ^ Ctrl   + Shift
getMenuArrFromTxt(path){
    ; file := "../../MENU_files/Programs.txt"

    if FileExist(path) {
        menuTxt := FileRead(path)
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
            line := Trim(line)
            line := RegExReplace(line, "#(.*)", "$1")
            line := Trim(line)
            line := RegExReplace(line, " {3,}", "   ")
            itemNamesArr := StrSplit(line, "   ")

        } else {
            tempMap := Map()

            line := RegExReplace(line, " {3,}", "   ")
            splitElementsArr := StrSplit(line, "   ")

                ; tempMap[itemNamesArr[1]] := "----------"

            if splitElementsArr[1] = "----" {
                tempMap[itemNamesArr[1]] := "separator"
                ; continue
            } else if splitElementsArr[1] = "-" {
                tempMap[itemNamesArr[1]] := "item"

            } else if splitElementsArr[1] = ">" {
                tempMap[itemNamesArr[1]] := "subIn"

            } else if splitElementsArr[1] = "<" {
                tempMap[itemNamesArr[1]] := "subOut"
                ; continue
            }

            try if splitElementsArr[2] != "|" {
                        tempMap[itemNamesArr[2]] := splitElementsArr[2]
                    } else {
                        ; tempMap[itemNamesArr[3]] := ""
                    }
            ; catch
            ;     tempMap[itemNamesArr[3]] := ""

                        
            try if splitElementsArr[3] != "|" {
                        tempMap[itemNamesArr[3]] := splitElementsArr[3]
                    } else {
                        ; tempMap[itemNamesArr[4]] := ""
                    }
            ; catch 
            ;     tempMap[itemNamesArr[4]] := ""

                        
            try if splitElementsArr[4] != "|" {
                        ; tempMap[itemNamesArr[4]] := "multi"

                        tempArrStart := StrSplit(splitElementsArr[4], "; ")

                        if tempArrStart.Length > 1 {
                            Loop tempArrStart.Length {
                                tempArr := StrSplit(tempArrStart[A_Index], "=")
                                tempMap[tempArr[1]] := tempArr[2]
                            }
                        } else {
                                tempArr := StrSplit(splitElementsArr[4], "=")
                                if tempArr.Length > 1 {
                                    tempMap[tempArr[1]] := tempArr[2]
                                } else {
                                    tempMap[itemNamesArr[4]] := splitElementsArr[4]
                                }
                        }
                    } else {
                        ; tempMap[itemNamesArr[5]] := ""
                    }
            ; catch 
            ;     tempMap[itemNamesArr[5]] := ""


            try if splitElementsArr[5] != "|" {
                        ; tempMap[itemNamesArr[5]] := "multi"

                        tempArrStart := StrSplit(splitElementsArr[5], "; ")

                        if tempArrStart.Length > 1 {
                            Loop tempArrStart.Length {
                                tempArr := StrSplit(tempArrStart[A_Index], "=")
                                tempMap[tempArr[1]] := tempArr[2]
                            }
                        } else {
                                tempArr := StrSplit(splitElementsArr[5], "=")
                                if tempArr.Length > 1 {
                                    tempMap[tempArr[1]] := tempArr[2]
                                } else {
                                    tempMap[itemNamesArr[5]] := splitElementsArr[5]
                                }
                        }
                        
                    } else {
                        ; tempMap[itemNamesArr[6]] := ""
                    }
            ; catch
            ;     tempMap[itemNamesArr[6]] := ""


            try if splitElementsArr[6] != "|" {
                        ; tempMap[itemNamesArr[6]] := "multi"
                        
                        tempArrStart := StrSplit(splitElementsArr[6], "; ")


                        if tempArrStart.Length > 1 {
                            Loop tempArrStart.Length {
                                tempArr := StrSplit(tempArrStart[A_Index], "=")
                                tempMap[tempArr[1]] := tempArr[2]
                            }
                        } else {
                                tempArr := StrSplit(splitElementsArr[6], "=")
                                if tempArr.Length > 1 {
                                    tempMap[tempArr[1]] := tempArr[2]
                                } else {
                                    tempMap[itemNamesArr[6]] := splitElementsArr[6]
                                }
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
return {items:itemArr, names:itemNamesArr}
}



;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------