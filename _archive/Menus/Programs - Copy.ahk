;# Win   ! Alt   ^ Ctrl   + Shift

#HotIf
tab := "`t&"
; menuIconPath := menus.dir "Programs\img\"
; menuShortcutsPath := menus.dir "Programs\shortcut\"
; configMenuPath := A_ScriptDir "\Menus\Programs\Settings\"
; menuConfigFile := menus.dir "Programs.txt"
menus.programs := {}

menus.programs.icons := menus.dir "Programs\img\"
menus.programs.shortcuts := menus.dir "Programs\shortcut\"
menus.programs.settings := menus.dir "Programs\Settings\"

menus.programs.config := menus.programs.settings "Programs.txt"


curr := []
prev := []
count := 1
PMenu := []	; initial menus arres

level := 1
curr.push(1)
num := curr[curr.length]
PMenu.InsertAt(num, Menu())	; create first level main menu

getArray := getMenuArrFromTxt(menus.programs.config)
itemArr := getArray.items


; menuCreate(itemArr, itemNamesArr, curr, prev, count) {
menuCreate(itemArr, level, curr, prev, count) {

    loop itemArr.Length {

        item := itemArr[A_Index]
        currentItem := curr[curr.Length]

        If item.Has("type") {

            if item["type"] = "subIn" {

                if (!item.Has("option") || (item["option"] = "null")) {
                    option := ""
                } else {
                    option := item["option"]
                }

                if (!item.Has("title") || (item["title"] = "null")) {
                    title := ""
                } else {
                    title := item["title"]
                }

                if (!item.Has("key") || (item["key"] = "null")) {
                    key := ""
                } else {
                    key := tab item["key"]
                }

                if (!item.Has("icon") || (item["icon"] = "null")) {
                    icon := ""
                } else {
                    icon := item["icon"]
                }
                
                count++

                prev.push(curr[curr.Length])
                curr.push(count)

                currentItem := curr[curr.Length]
                parrentItem := prev[prev.Length]


                PMenu.InsertAt(currentItem, Menu())
                PMenu[parrentItem].Add(title key, PMenu[currentItem], option)

                level++ ; for debug

            if (item.Has("icon") && (item["icon"] != "null")) {
                    PMenu[parrentItem].SetIcon(title key, menus.programs.icons item["icon"] , , 0)
            }


            if (item.Has("disable") && (item["disable"] != "null")) {
                if item["disable"] = "true" || item["disable"] = "+" || item["disable"] = "1" || item["disable"] = "yes" {
                    PMenu[parrentItem].Disable(title key)
                } else if item["disable"] = "false" || item["disable"] = "-" || item["disable"] = "0" || item["disable"] = "no" {
                    PMenu[parrentItem].Enable(title key)
                }
            }


            } else if item["type"] = "subOut" { ; -------------------------------------------------------
                level-- ; for debug

                curr.Pop()
                prev.Pop()

            } else if item["type"] = "separator" { ; -------------------------------------------------------

                PMenu[currentItem].Add()

            } else if item["type"] = "item" { ; -------------------------------------------------------

                createMenuItem(item, currentItem)

            }
        }
    }

}



; createMenuItem(item, itemNamesArr, num) {
createMenuItem(item, num) {
    ; name := itemNamesArr

    afterItem := ""
    if !item.Has("title") || item["title"] = "null" {
        title := " "
    } else {
        title := item["title"]
    }

    if !item.Has("win") || item["win"] = "null" {
        win := ""
    } else {
        win := item["win"]

    }

    if !item.Has("key") || item["key"] = "null" {
        key := ""
    } else {
        key := tab item["key"]
    }
    if !item.Has("exe") || item["exe"] = "null" {
        exe := ""
    } else {
        exe := item["exe"]
    }

    if !item.Has("pth") || item["pth"] = "null" {
        pth := ""
    } else {
        pth := item["pth"]
    }

    if !item.Has("run") || item["run"] = "null" {
        runs := ""
    } else  {
        runs := item["run"]
    }

    if !item.Has("code") || item["code"] = "null" {
        code := ""
    } else {
        code := item["code"]
    }
    
    if !item.Has("option") || item["option"] = "null" {
        option := ""
    } else {
        option := item["option"]
    }

    ; Say(appName " : " appExe " : " winTitle)
    ; if app exe name exist in YML file then use exe name for open program. As default use shortcut name for program name



    ; PMenu[num].Insert(afterItem, appName appKey, ((ShortcutName, exeAppName, winAppTitle, runString, runCode, *) => runApp(ShortcutName, exeAppName, winAppTitle, runString, runCode)).Bind(appName, appExe, winTitle, runString, runCode), option)
    PMenu[num].Insert(afterItem, title Key, ((title, exe, win, pth, runs, code, *) => runApp(title, exe, win, pth, runs, code)).Bind(title, exe, win, pth, runs, code), option)


    ; PMenu[menuNum].Add appName appKey, ((ShortcutName, exeAppName, winAppTitle, *) => runApp(ShortcutName, exeAppName, winAppTitle)).Bind(appName, appExe, winTitle)


    if item.Has("check") && item["check"] != "null" {
        if item["check"] = "true" || item["check"] = "+" || item["check"] = "1" || item["check"] = "yes" {
            PMenu[num].Check(title key)
        } else if item["check"] = "false" || item["check"] = "-" || item["check"] = "0" || item["check"] = "no" {
            PMenu[num].Uncheck(title key)
        }
    } else {


        ;  if png image exist in YML file then use png image as icon. As defaul use icon from shortcut
        if !item.Has("icon") || item["icon"] = "null" || item["icon"] = "lnk" {
            ; Get app target from lnk file
            Try{
                FileGetShortcut menus.programs.shortcuts title ".lnk", &OutTarget, &OutDir, &OutArgs, &OutDesc, &OutIcon, &OutIconNum, &OutRunState
                PMenu[num].SetIcon(title key, OutTarget, -1, 16)
            } catch Error {
                ; MsgBox('Item "' appName '" ' "don't have icon file or shortcut", , 16)
            }
        } else {
            Try
                PMenu[num].SetIcon(title key, menus.programs.icons item["icon"], , 0)
            catch as e
                MsgBox("RB TOOLS:`nWrong icon name in configuration file:`n" menus.programs.config "`n`nExtras:`n" e.extra " `n`nERROR MESSAGE (line " e.line "):`n" e.message, , 16)
                ; MsgBox "Error"
        }
    }

    ; if (item["type"]) && (item["type"] = "separator") && (item["type"] != "null") {
    ;     PMenu[1].Add()
    ; }

    if item.Has("disable") && item["disable"] != "null" {
        if item["disable"] = "true" || item["disable"] = "+" || item["disable"] = "1" || item["disable"] = "yes" {
            PMenu[num].Disable(title key)
        } else if item["disable"] = "false" || item["disable"] = "-" || item["disable"] = "0" || item["disable"] = "no" {
            PMenu[num].Enable(title key)
        }
    }
}

; ---------------------------------------------------------
; ---------------------------------------------------------
; menuCreate(itemArr, itemNamesArr, curr, prev, count)
menuCreate(itemArr, level, curr, prev, count)

; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------- MENU CLICK FUNCTIONS -------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------------------------------------------------

; runApp(title, exeAppName, winAppTitle, runString, runLink, runCode, *) {,
runApp(title, exe, win, pth, runs, code, *) {
    ; runString := MsgBox("Hello")

        ; If runCode != "" {
        ;   ExecScript(runCode)
        ; ;   MsgBox runString
        ; }

        ; If runString != "" {
        ;     Run runString
        ;                     MsgBox exeAppName
        ; }
        ;                 MsgBox exeAppName
        ;                 WinActivate "ahk_exe " exeAppName ".exe"

        ;     If WinExist(winAppTitle) || WinExist(title) {  ; activate window by title
        ;         WinActivate  ; Use the window found by WinExist.
        ;         MsgBox "1"
        ;     } else If runLink = "lnk" { ; run app with using shortcut
        ;             Run "MENU_files\shortcut\" title ".lnk"
        ;                             MsgBox "2"
        ;     } else if WinExist("ahk_exe " exeAppName ".exe") { ; activate window by exe
        ;                     MsgBox "3"
        ;         WinActivate "ahk_exe " exeAppName ".exe"
        ;     }

        ; MsgBox (
        ;     title Ltitle, exeAppName, winAppTitle, runString, runLink, runCode,
        ; )

        If code != "" {
            ; ExecScript(code)
        ;   MsgBox pth
        }
        
        If pth != "" {
            Run pth
        }
        
        If WinExist(win) || WinExist(title) {  ; activate window by title

            WinActivate

        } else if exe!= "" && WinExist("ahk_exe " exe ".exe") { ; activate window by exe
            
            WinActivate "ahk_exe " exe ".exe"

        } else if runs = "lnk" { ; run app with using shortcut












        ; if WinExist(app_title)
        ;     WinActivate
        ; else
        ;     Run app_path









        

            Try
                Run menus.programs.shortcuts title ".lnk"
            catch as e
                Say("Can't find: " '"' title '.lnk"' ,2 ,,,,"ERR")

        }

    ; Run "open 'Figma.exe'", "C:\Users\Radzhab\AppData\Local\Figma\"
}


; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
; ----------------- HOTKEY TO RUN MENU --------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------------------------------------------------

; ~MButton::
; {
;     if (A_PriorHotkey != "~MButton" or A_TimeSincePriorHotkey > 400)
;     {
;         ; Too much time between presses, so this isn't a double-press.
;         KeyWait "MButton"
;         return
;     }
;     PMenu[1].Show()
; }

; ~LShift::
; {
;     if (A_PriorHotkey != "~LShift" or A_TimeSincePriorHotkey > 400) {
;         ; Too much time between presses, so this isn't a double-press.
;         KeyWait "LShift"
;         return
;     }
    
;     PostMessage 0x0050, 0, 0x4090409,, "A"  ; US 0x0050 is WM_INPUTLANGCHANGEREQUEST
;     PMenu[1].Show()
;     sleep 1000
;     if WinExist("ahk_class #32768") {
;         WinActivate ; Use the window found by WinExist.
;     }

; }

~LShift::
{
    ; switch l := mt("LShift") {
    ;     case 1: Send "{LShift}"
    ;     case 2: {

    ;     }
    ;     default: Send "{LShift}"
    ; }
    if mt("LShift") = 2 {
        PostMessage 0x0050, 0, 0x4090409, , "A"	; US 0x0050 is WM_INPUTLANGCHANGEREQUEST
        PMenu[1].Show()
        ; sleep 1000
    }
}

; ~RButton::
; {
;     ; switch l := mt("LShift") {
;     ;     case 1: Send "{LShift}"
;     ;     case 2: {

;     ;     }
;     ;     default: Send "{LShift}"
;     ; }
;     if mt("RButton") = -1 {
;         PostMessage 0x0050, 0, 0x4090409, , "A"	; US 0x0050 is WM_INPUTLANGCHANGEREQUEST
;         PMenu[1].Show()
;         ; sleep 1000
;     }
; }


; ; RButton & LButton::
; CapsLock & Escape::
; {
;     PostMessage 0x0050, 0, 0x4090409,, "A"  ; US 0x0050 is WM_INPcUTLANGCHANGEREQUEST
;     PMenu[1].Show()  ; i.e. press the Win-Z hotkey to show the menu.

; }



;             RunWaitOne(command) {
;                 ; ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99
;                 ; shell := ComObjCreate("WScript.Shell")
;                 ; ; Execute a single command via cmd.exe
;                 ; exec := shell.Exec(A_ComSpec " /C " command)
;                 ; ; Read and return the command's output
;                 ; return exec.StdOut.ReadAll()
;             }

;             ExecScript(Script, Wait := true)
;             {
;             ;     shell := ComObjCreate("WScript.Shell")
;             ;     exec := shell.Exec("C:\Program Files\AutoHotkey\v2-alpha\x64\AutoHotkeyU64.exe /ErrorStdOut *")
;             ;     exec.StdIn.Write(script)
;             ;     exec.StdIn.Close()
;             ;     if Wait
;             ;         return exec.StdOut.ReadAll()
;             }