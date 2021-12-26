;# Win   ! Alt   ^ Ctrl   + Shift

#HotIf

global tab := "`t&"
global menuiconpath := "MENU_files\img\"

global menushortcutspath := "MENU_files\shortcut\"

configYmlPath := "MENU_files\yml\"
global MenuConfigYmlFile := configYmlPath "Programs.yml"
menuSettingsYML := Yaml(MenuConfigYmlFile)[1]
; menuIndex := 1


; menuSettingsYML_Length := menuSettingsYML.Length

;  MsgBox !menuSettingsYML[1].Has("program")



; MsgBox Yaml(menuSettingsYML, 5) ; ------------- !!!!!!!!!!!!!!!!!!!!!!!!!!


curr := [1]
prev := [1]
global PMenu := []	; initial menus arres
level := 1
count := 1
PMenu.InsertAt(curr[level], Menu.New())	; create first level main menu
global prevItemArr
global lastItemNumber := 0
global subMenusLevel := []
global parMenusLevel := []

itemArr := [menuSettingsYML]


menuCreate(itemArr, curr, prev, count) {

    loop itemArr[itemArr.Length].Length {

        item := itemArr[itemArr.Length][A_Index]

       If item.Has("subLevel") {

            if item["subLevel"] = ">" {
            ; Say "In " item["subLevel"] " : " item["subOption"], 0.4
            prevItemArr := itemArr



            count++
            curr.push(count)
            prev.push(curr[curr.Length-1])
            itemArr.push(item["submenu"])

            subMenusLevel.push(item["subTitle"])
            createSubMenuItem(item)



                if (!item.Has("subOption") || (item["subOption"] = "null")) {
                    subOption := ""
                } else {
                    subOption := item["subOption"]
                }

                if (!item.Has("subTitle") || (item["subTitle"] = "null")) {
                    subTitle := ""
                } else {
                    subTitle := item["subTitle"]
                }

                if (!item.Has("subKey") || (item["subKey"] = "null")) {
                    subKey := ""
                } else {
                    subKey := tab item["subKey"]
                }

                if (!item.Has("subIcon") || (item["subIcon"] = "null")) {
                    subIcon := ""
                } else {
                    subIcon := item["subIcon"]
                }

                


            ; Say(" Create submenu # " curr[curr.Length], 0.2)

            PMenu.InsertAt(curr[curr.Length], Menu.New())
            ; PMenu[prev[prev.Length]].SetIcon(item["title"], menuiconpath "CreateDir.png", , 0)

            PMenu[prev[prev.Length]].Add(subTitle subKey, PMenu[curr[curr.Length]], subOption)







if (item.Has("subIcon") && (item["subIcon"] != "null")) {
    Try
        PMenu[prev[prev.Length]].SetIcon(subTitle subKey, menuiconpath item["subIcon"], , 0)
    catch e
        MsgBox("RB TOOLS:`nWrong icon name in configuration file:`n" MenuConfigYmlFile "`n`nExtras:`n" e.Extra " `n`nERROR MESSAGE (line " e.Line "):`n" e.Message, , 16)
}







            
            ; PMenu[prev[prev.Length]].SetIcon(subTitle subKey, menuiconpath subIcon, , 0)


                        if (item.Has("subDisable") && (item["subDisable"] != "null")) {
                            if item["subDisable"] = "true" || item["subDisable"] = "+" || item["subDisable"] = "1" || item["subDisable"] = "yes" {
                                PMenu[prev[prev.Length]].Disable(item["subTitle"])
                            } else if item["subDisable"] = "false" || item["subDisable"] = "-" || item["subDisable"] = "0" || item["subDisable"] = "no" {
                                PMenu[prev[prev.Length]].Enable(item["subTitle"])
                            }
                        }


            menuCreate(itemArr, curr, prev, count)

            } else if item["subLevel"] = "<" {
                ; Say "Out " item["subLevel"], 0.4

                itemArr.Pop()
                submenuName := subMenusLevel.Pop()  
                ; Say("MENU: " submenuName " #:" curr[curr.Length] " add to menu #:" prev[prev.Length], 0.2)
                ; PMenu[prev[prev.Length]].Add(submenuName, PMenu[curr[curr.Length]])
                ; createMenuItem(item, curr[itemArr.Length])
                curr.Pop()
                prev.Pop()

            } else {

            }

        } else if item.Has("separator") && (!item.Has("title") || (item["title"] = "null")) {
            PMenu[curr[itemArr.Length]].Add()	; Add a separator line.
        } else {
            ; Say(item["title"] " add to menu#: " curr[itemArr.Length], 0.2)
            createMenuItem(item, curr[itemArr.Length])
        }
    }

}



createMenuItem(item, menuNum) {

    afterItem := ""
    if (!item.Has("title") || (item["title"] = "null")) {
        appName := ""
    } else {
        appName := item["title"]
    }

    if (!item.Has("winName") || (item["winName"] = "null")) {
        winTitle := ""
    } else {
        winTitle := item["winName"]

    }

    if (!item.Has("key") || (item["key"] = "null")) {
        appKey := ""
    } else {
        appKey := tab item["key"]
    }

    if (!item.Has("exeName") || (item["exeName"] = "null")) {
        appExe := ""
    } else {
        appExe := item["exeName"]
    }

    if (!item.Has("runString") || (item["runString"] = "null")) {
        runString := ""
    } else {
        runString := item["runString"]
    }

    if (!item.Has("runCode") || (item["runCode"] = "null")) {
        runCode := ""
    } else {
        runCode := item["runCode"]
    }
    
    if (!item.Has("option") || (item["option"] = "null")) {
        option := ""
    } else {
        option := item["option"]
    }

    ; Say(appName " : " appExe " : " winTitle)
    ; if app exe name exist in YML file then use exe name for open program. As default use shortcut name for program name
    PMenu[menuNum].Insert(afterItem, appName appKey, ((ShortcutName, exeAppName, winAppTitle, runString, runCode, *) => runApp(ShortcutName, exeAppName, winAppTitle, runString, runCode)).Bind(appName, appExe, winTitle, runString, runCode), option)
    ; PMenu[menuNum].Add appName appKey, ((ShortcutName, exeAppName, winAppTitle, *) => runApp(ShortcutName, exeAppName, winAppTitle)).Bind(appName, appExe, winTitle)


        if (item.Has("check") && (item["check"] != "null")) {
            if item["check"] = "true" || item["check"] = "+" || item["check"] = "1" || item["check"] = "yes" {
                PMenu[menuNum].Check(appName appKey)
            } else if item["check"] = "false" || item["check"] = "-" || item["check"] = "0" || item["check"] = "no" {
                PMenu[menuNum].Uncheck(appName appKey)
            }
        } else {


            ;  if png image exist in YML file then use png image as icon. As defaul use icon from shortcut
            if (!item.Has("icon") || (item["icon"] = "null")) {
                ; Get app target from lnk file
                Try{
                    FileGetShortcut menushortcutspath appName ".lnk", OutTarget, OutDir, OutArgs, OutDesc, OutIcon, OutIconNum, OutRunState
                    PMenu[menuNum].SetIcon(appName appKey, OutTarget, -1, 16)
                } catch e {
                    ; MsgBox('Item "' appName '" ' "don't have icon file or shortcut", , 16)
                }
            } else {
                Try
                    PMenu[menuNum].SetIcon(appName appKey, menuiconpath item["icon"], , 0)
                catch e
                    MsgBox("RB TOOLS:`nWrong icon name in configuration file:`n" MenuConfigYmlFile "`n`nExtras:`n" e.Extra " `n`nERROR MESSAGE (line " e.Line "):`n" e.Message, , 16)
            }
        }

    if (item.Has("separator") && (item["separator"] != "null")) {
        PMenu[menuNum].Add()
    }

    if (item.Has("disable") && (item["disable"] != "null")) {
        if item["disable"] = "true" || item["disable"] = "+" || item["disable"] = "1" || item["disable"] = "yes" {
            PMenu[menuNum].Disable(appName appKey)
        } else if item["disable"] = "false" || item["disable"] = "-" || item["disable"] = "0" || item["disable"] = "no" {
            PMenu[menuNum].Enable(appName appKey)
        }
    }
}

; ---------------------------------------------------------
; ---------------------------------------------------------
createSubMenuItem(item) {
    ; afterItem := ""
    if (!item.Has("subTitle") || (item["subTitle"] = "null")) {
        appName := ""
    } else {
        appName := item["subTitle"]
    }

    if (!item.Has("key") || (item["key"] = "null")) {
        appKey := ""
    } else {
        appKey := tab item["key"]
    }
    ; Say(Item["subTitle"],0.4)
}

; ---------------------------------------------------------
; ---------------------------------------------------------
menuCreate(itemArr, curr, prev, count)

    ; Say("Menu is builded", 0.4)
; Run "D:\Others\Programs\AHK\RB TOOLS\"

; PMenu[1].SetColor("white", false)
; PMenu[1].Disable("Others")





; ; ; Create another menu destined to become a submenu of the above menu.
; PMenu.InsertAt(4, Menu.New())	; create sub menu
; ; PMenu[menuNum].Insert(afterItem, appName appKey, ((Sh
; ; PMenu[1].Add("Item A", "testRun")
; ; PMenu[1].Add("Item B", "testRun")

; ; ; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.


; ; ; Submenu2 := Menu.New()
; ; ; Submenu2 := "Hello"

; PMenu[4].Insert("", "xcv `t&z", "runApp")
; PMenu[4].Insert("", "xcvcc `t&z", "runApp", "+BarBreak")
; PMenu[4].SetIcon('xcv `t&z', menuiconpath "CreateDir.png", , 0)

; PMenu[1].Add("My Submenu `t&y", PMenu[4], "+BarBreak")
; PMenu[1].SetIcon("My Submenu `t&y", menuiconpath "CreateDir.png", ,0)

; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------- MENU CLICK FUNCTIONS -------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------------------------------------------------

runApp(ShortcutName, exeAppName, winAppTitle, runString, runCode, *) {
    ; runString := MsgBox("Hello")

        If runCode != "" {
          ExecScript(runCode)
        ;   MsgBox runString
        } else If runString != "" {
            Run runString
        } else If WinExist(winAppTitle) {  ; activate window by title

            WinActivate winAppTitle

        } else if WinExist("ahk_exe " exeAppName ".exe") { ; activate window by exe
            
            WinActivate "ahk_exe " exeAppName ".exe"

        } else { ; run app with using shortcut

            Try
                Run "MENU_files\shortcut\" ShortcutName ".lnk"
            catch e
                Say('"' ShortcutName '"' " can't running")

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

~LShift::
{
    if (A_PriorHotkey != "~LShift" or A_TimeSincePriorHotkey > 400) {
        ; Too much time between presses, so this isn't a double-press.
        KeyWait "LShift"
        return
    }
    
    PostMessage 0x0050, 0, 0x4090409,, "A"  ; US 0x0050 is WM_INPUTLANGCHANGEREQUEST
    PMenu[1].Show()
    sleep 1000
    if WinExist("ahk_class #32768") {
        WinActivate ; Use the window found by WinExist.
    }

}



; RButton & LButton::
CapsLock & Escape::
{
    PostMessage 0x0050, 0, 0x4090409,, "A"  ; US 0x0050 is WM_INPcUTLANGCHANGEREQUEST
    PMenu[1].Show()  ; i.e. press the Win-Z hotkey to show the menu.

}



            RunWaitOne(command) {
                ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99
                shell := ComObjCreate("WScript.Shell")
                ; Execute a single command via cmd.exe
                exec := shell.Exec(A_ComSpec " /C " command)
                ; Read and return the command's output
                return exec.StdOut.ReadAll()
            }

            ExecScript(Script, Wait := true)
            {
                shell := ComObjCreate("WScript.Shell")
                exec := shell.Exec("C:\Program Files\AutoHotkey\v2-alpha\x64\AutoHotkeyU64.exe /ErrorStdOut *")
                exec.StdIn.Write(script)
                exec.StdIn.Close()
                if Wait
                    return exec.StdOut.ReadAll()
            }