;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance ignore 
SetKeyDelay -1

!Esc::Reload 





#include RB [FUNCTION] Say.ahk
Say "SCRIPTS"


; #include Yaml.ahk

; GetArrFromINI_FC(ini_file) {
;     arr := []
;     SectionNames := IniRead(ini_file)

;     Loop parse, SectionNames, "`n", "`r" {
        
;         SectionNames_lp := A_LoopField
        
;         Line_Result := IniRead(ini_file, SectionNames_lp)
        
;         Loop parse, Line_Result, "`n", "`r" {
            
;             KeyLine_Result := A_LoopField
;             KeyName_Result := StrSplit(KeyLine_Result, "=")
;                 KeyName_Result := KeyName_Result[1]
;                 Key_Result := IniRead(ini_file, SectionNames_lp, KeyName_Result)
                            
;                 arr.Push(SectionNames_lp) ; push Category
;                 arr.Push(KeyName_Result) ; push key Name

;                 Loop parse, Key_Result, "|" {
;                     KeySplit_Result := A_LoopField
;                     arr.Push(KeySplit_Result) ; push others values
;                 }
                    
;         }
        
;     }
;     return arr
;     ;~ return {arr : arr}
; }


; GetArrFromIniNEW_FC(ini_file) {
;     arr := []
;     SectionNames := IniRead(ini_file)

;     Loop parse, SectionNames, "`n", "`r" {
        
;         SectionNames_lp := A_LoopField
        
;         Line_Result := IniRead(ini_file, SectionNames_lp)
        
;         Loop parse, Line_Result, "`n", "`r" {
            
;             KeyLine_Result := A_LoopField
;             KeyName_Result := StrSplit(KeyLine_Result, "=")
;                 KeyName_Result := KeyName_Result[1]
;                 Key_Result := IniRead(ini_file, SectionNames_lp, KeyName_Result)
                            
;                 arr.Push(SectionNames_lp) ; push Category
;                 arr.Push(KeyName_Result) ; push key Name

;                 Loop parse, Key_Result, "|" {
;                     KeySplit_Result := A_LoopField
;                     arr.Push(KeySplit_Result) ; push others values
;                 }
                    
;         }
        
;     }
;     elementsInOneLine := IniRead(ini_file, "Settings", "ElementsInOneLine")
;     return [arr, elementsInOneLine]
;     ;~ return {arr : arr}
; }

menuIniPath := "MENU_files\ini\"
ini_file := menuIniPath "ProgramsDEL.ini"

; result := GetArrFromIniNEW_FC(ini_file)
; programsListArr := result[1]
; elementsInOneLine := result[2]

n := 0
; loop programsListArr.Length/elementsInOneLine{

;     Say(programsListArr[1+n],0.4)
;     Say(programsListArr[2+n],0.4)
;     Say(programsListArr[3+n],0.4)
;     Say(programsListArr[4+n],0.4)
;     Say(programsListArr[5+n],0.4)
;     Say(programsListArr[6+n],0.4)
;     n := n + elementsInOneLine
; }






SectionNames := IniRead(ini_file) ; Get selection names in separete "`n" string

Loop Parse, SectionNames, "`n", "`r" { ; Get all sections count

    iniFileMap := Map()

    SectionNames_Length_withoutSettings := A_Index - 1
    SectionNames_Length := A_Index
    SectionNames_SelectionName := A_LoopField
    
    if (SectionNames_SelectionName = "-" || SectionNames_SelectionName = "----------") {
        ; Say('Separator')

    } else if (SectionNames_SelectionName = "Settings" || SectionNames_SelectionName = "SETTINGS") {
        elementsInOneLine := IniRead(ini_file, "Settings", "ElementsInOneLine")
        ; Say(elementsInOneLine)

    } else {
        LineResult := IniRead(ini_file, SectionNames_SelectionName) ; all lines in one selection
        Loop Parse, LineResult, "`n", "`r" {
            LineResult_Line := A_LoopField ; one whole line (like 1=" ")
            LineResult_Key := StrSplit(LineResult_Line, "=")[2] ; split line and ger second part — keys ("a|b|c|d|e")
            ; Say(LineResult_Key, 0.4)
        }

        

                                                    ; 2: 3,
                                                    ; 3: 5,
                                                    ; 4: 6,
                                                    ; 5: 7,  
                                                    ; 6: 6})

        ; Say(LineResult_Key, 0.4)
        ; Say(LineResult_Line)



    ; arr.Push(SectionNames_lp) ; push Category
    ; arr.Push(KeyName_Result) ; push key Name

    ; Loop parse, Key_Result, "|" {
    ; KeySplit_Result := A_LoopField
    ; arr.Push(KeySplit_Result) ; push others values
    ; }

    }

    ; {a: 5, b: 6}

    ; iniFileMap = Map()
    ; arr = [xx, yy, zz]
    ; a := arr[1]
    ; Section := "vvv"
    ; iniFileMap.Set(SectionNames_SelectionName, {a: 5})
    


; MsgBox map.[РазделОдин][раздел]  ; -- РазделОдин
; MsgBox map.[РазделОдин][данные].цвет  ; -- желтый
; MsgBox map.[3][1]  ; -- РазделТри
; MsgBox map.[Settings][данные].count  ; -- 6




    iniFileMap.Set("Hello", 5)
    ; iniFileMap["Hello"].a = Map()
    ; iniFileMap.Set(SectionNames_SelectionName, Map())




    iniFileMap.Set(SectionNames_SelectionName, {a: 5})

    ; iniFileMap[SectionNames_SelectionName].Set(SectionNames_SelectionName, {a: 5})
    ; niFileMap.Set(SectionNames_SelectionName, {a: 5})





;     clrs := Map()
; clrs["Red"] := "ff0000"
; clrs["Green"] := "00ff00"
; clrs["Blue"] := "0000ff"
; for clr in Array("Blue", "Green")
;     MsgBox clrs[clr]


    ; offsets.Set("new" = Map(), {x: 5, y: 3})





    ; Say(SectionNames_SelectionName ": " iniFileMap[SectionNames_SelectionName].a, 0.4)




}


offsets := Map(
    "ableton"    , {x:   0, y:  100},
    "reaper"     , {x:   0, y:  -55},
    "studio one" , {x:   0, y:    0},
  )
    newd := "new"
    ; offsets["new"].Set("x", 5, "y", 3)
    offsets.Set(newd, {x: 5, y: 3})

;   Say(offsets[newd].x)

; #include JSON.ahk

; oobj := {}
; oobj := json.load(fileread("file.txt"))


; fileDelete('file.txt')
; fileWrite(Json.dump(obj), 'file.txt')

; MsgBox map.[РазделОдин][раздел]  ; -- РазделОдин
; MsgBox map.[РазделОдин][данные].цвет  ; -- желтый
; MsgBox map.[3][1]  ; -- РазделТри
; MsgBox map.[Settings][данные].count  ; -- 6

    ; q := Map("a", Map("b", {a: 2}))
    ; q := Map("a", Map("b", Map("c", 2)))
    ; Say(q["a"]["b"]["c"])

    ; q = Map(
    ;     b = (

    ;     ), {},

    ; }

#include ZZ [LIB] YAML.ahk
; #include JSON.ahk

; valueqq := Yaml("text.json")
; MsgBox valueqq["sammy"]["username"]/

z := Yaml("file.yaml") ; Load Yaml documents into objects

MsgBox Yaml(z, 5)
; MsgBox z

; MsgBox z["Graphic"][1]["program"] ; Dump objects back into Yaml

; MsgBox z[1][1].HasOwnMethod("separator")

Loop z.Length
    MsgBox z[A_Index]

MsgBox z[1][2].Has("separator")
mapLength_FC(map){
    i := 0
    For key, value in map {
        i++
        ; MsgBox key ": " i
    }
    return i
}
    kkk := mapLength_FC(z)
    ; MsgBox kkk


; ; YamlObj := Yaml("file.yaml")

; ; Say(Yaml(y, 5)) ; Dump objects back into Yaml
; ; MsgBox Yaml(z, 5) ; Dump objects back into Yaml



; MsgBox z[2]["product"][1]["price"] ; Dump objects back into Yaml

; ; Say(YamlObj.Time) ; Dump objects back into Yaml









