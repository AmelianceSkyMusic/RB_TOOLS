; ; --- return a first char from a string
; getFirstChar(str)
; ; --- return a last char from a string
; getLastChar(str)

; ; --- save function fun and arguments to temp file
; savedReload(fun, arg*)
; ; --- read and run temp file with settings to run after reload
; readReload(path)

; ; --- get N symbols from left or right edge
; ; --- return string or "" and &leftStr
; getStrL(&leftStr, str, leng := 1)
; ; --- return string or "" and &leftStr
; getStrR(&leftStr, str, leng := 1)

; ; --- get any one or more symbols from left or right edge
; ; --- return string or "" and &leftStr
; getStrFromL(&leftStr, str, start position, leng := 1)
; ; --- return string or "" and &leftStr
; getStrFromR(&leftStr, str, start position, leng := 1)

; ; --- get symbols from both edge
; ; --- return string or "" and &leftStr
; getStrLR(&leftStr, str, lengL := 1, lengR := 1)

getFirstChar(str) {
    str := SubStr(str, 1, 1)
    return str
}

getLastChar(str) {
    str := SubStr(str, StrLen(str), 1)
    return str
}


savedReload(path, fun, arg *){
    args := ""
    Loop arg.Length
        args := args arg[A_Index] ","

    args := RTrim(args, ",")
    fun := fun "`n" args
    if FileExist(index_ahk.data "reload") {
        FileDelete index_ahk.data "reload"
    }
    FileAppend(fun, index_ahk.data "reload")
    reload
}

readReload(path){
    if FileExist(index_ahk.data "reload") {
        reloadStr := FileRead(index_ahk.data "reload")
        reloadStrArr := StrSplit(reloadStr, "`n", "`r")
        reloadFun := reloadStrArr[1]
        reloadArg := reloadStrArr[2]
        If reloadFun != "" && reloadArg != "" {
            ; Msg "run function: " reloadFun '("' reloadArg '")'
            if Type(%reloadFun%) = "Func"
                %reloadFun%(reloadArg)
            else
                Say(reloadFun " is not a function", , , , , "ERR")
        }
        FileDelete index_ahk.data "reload"
    }
}

getStrL(&leftStr, str, leng := 1){
    leftStr := ""
    if leng <= StrLen(str) && leng > 0 {
        grabStr := SubStr(str, 1, leng)
        leftStr := SubStr(str, leng + 1, StrLen(str) - StrLen(leftStr))
        return grabStr
    } else {
        MsgBox('Varibles in "getStrL()" function is too long`nString length is: ' StrLen(str), , "Ok icon!")
    }
}

getStrR(&leftStr, str, leng := 1){
    leftStr := ""
    if leng <= StrLen(str) && leng > 0 {
        grabStr := SubStr(str, StrLen(str) - leng + 1, leng)
        leftStr := SubStr(str, 1, StrLen(str) - leng)
        return grabStr
    } else {
        MsgBox('Varibles in "getStrR()" function is too long`nString length is: ' StrLen(str), , "Ok icon!")
        return
    }
}

getStrFromR(&leftStr, str, start, leng := 1) {
        leftStr := ""
    if start <= StrLen(str)-leng+1 && leng > 0 && start > 0{
        grabStr := SubStr(str, StrLen(str)-((start-1)+(leng-1)), leng)
        strOne := SubStr(str, 1, StrLen(str)-((start-1)+(leng-1))-1)
        strTwo := SubStr(str, StrLen(grabStr)+StrLen(strOne)+1, StrLen(str)-StrLen(grabStr)-StrLen(strOne))
        leftStr := strOne strTwo
        return grabStr
    } else {
        MsgBox('Wrong varibles in "getStrFromL()" function`nString length is: ' StrLen(str), , "Ok icon!")
    }
}

getStrFromL(&leftStr, str, start, leng := 1) {
        leftStr := ""
    if start <= StrLen(str)-leng+1 && leng > 0 && start > 0{
        grabStr := SubStr(str, start, leng)
        strOne := SubStr(str, 1, start-1)
        strTwo := SubStr(str, start+leng, StrLen(str)-StrLen(grabStr)-StrLen(strOne))
        leftStr := strOne strTwo
        return grabStr
    } else {
        MsgBox('Wrong varibles in "getStrFromR()" function`nString length is: ' StrLen(str), , "Ok icon!")
    }
}

getStrLR(&leftStr, str, lengL := 1, lengR := 1) {
    leftStr := ""
    if lengL+lengR <= StrLen(str) && lengL > 0 && lengR > 0 {
        grabStrOne := SubStr(str, 1, lengL)
        grabStrTwo := SubStr(str, StrLen(str) - lengR + 1, lengR)
        grabStr := grabStrOne grabStrTwo
        leftStr := SubStr(str, lengL+1, StrLen(str) - StrLen(grabStrOne) - StrLen(grabStrTwo))

        return grabStr
    } else {
        MsgBox('Wrong varibles in "getStrLR()" function`nString length is: ' StrLen(str), , "Ok icon!")
    }
}

; ddd := "123456789"
; MsgBox getStrFromR(&leftStr, ddd, 8, 3)
; MsgBox leftStr