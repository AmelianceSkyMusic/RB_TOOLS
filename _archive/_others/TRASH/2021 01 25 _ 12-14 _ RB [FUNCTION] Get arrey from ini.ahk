GetArrFromINI_FC(ini_file) {
    arr := []
    SectionNames := IniRead(ini_file)

    Loop parse, SectionNames, "`n", "`r" {
        
        SectionNames_lp := A_LoopField
        
        Line_Result := IniRead(ini_file, SectionNames_lp)
        
        Loop parse, Line_Result, "`n", "`r" {
            
            KeyLine_Result := A_LoopField
            KeyName_Result := StrSplit(KeyLine_Result, "=")
                KeyName_Result := KeyName_Result[1]
                Key_Result := IniRead(ini_file, SectionNames_lp, KeyName_Result)
                            
                arr.Push(SectionNames_lp) ; push Category
                arr.Push(KeyName_Result) ; push key Name

                Loop parse, Key_Result, "|" {
                    KeySplit_Result := A_LoopField
                    arr.Push(KeySplit_Result) ; push others values
                }
                    
        }
        
    }
    return arr
    ;~ return {arr : arr}
}