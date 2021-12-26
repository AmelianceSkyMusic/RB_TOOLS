;# Win   ! Alt   ^ Ctrl   + Shift

#HotIf

tab := "`t&"
global menuiconpath := "MENU_files\img\"

global menushortcutspath := "MENU_files\shortcut\"

configYmlPath := "MENU_files\yml\"
MenuConfigYmlFile := configYmlPath "Programs.yml"
menuSettingsYML := Yaml(MenuConfigYmlFile)[1]


; menuSettingsYML_Length := menuSettingsYML.Length

;  MsgBox !menuSettingsYML[1].Has("program")

MsgBox Yaml(menuSettingsYML, 5)

; menuSettingsYML[1]
; MsgBox menuSettingsYML[20]["submenu"]


global ProgramsMenu := Menu.New()

loop menuSettingsYML.Length{
    aIdx := menuSettingsYML[A_Index]

    if aIdx.Has("separator") {
      ProgramsMenu.Add  ; Add a separator line.
    } else {

        ; if aIdx.Has("program") {
        ;     if aIdx["program"] != "null" {
        ;         appName := aIdx["program"]
        ;     } else {
        ;         appName := ""
        ;     }
        ; } else {
        ;     appName := ""
        ; }

        ; if aIdx.Has("key") {
        ;     if aIdx["key"] != "null" {
        ;         appKey := tab aIdx["key"]
        ;     } else {
        ;         appKey := ""
        ;     }
        ; } else {
        ;     appKey := ""
        ; }

        if (!aIdx.Has("program") || (aIdx["program"] = "null")){
            appName := ""
        } else {
            appName := aIdx["program"]
        }

        if (!aIdx.Has("winName") || (aIdx["winName"] = "null")){
            winTitle := ""
        } else {
            winTitle := aIdx["winName"]
    
        }

        if (!aIdx.Has("key") || (aIdx["key"] = "null")){
            appKey := ""
        } else {
            appKey := tab aIdx["key"]
        }

        if (!aIdx.Has("exeName") || (aIdx["exeName"] = "null")){
            appExe := ""
        } else {
            appExe := aIdx["exeName"]
        }
        ; Say(appName " : " appExe " : " winTitle)
        ; if app exe name exist in YML file then use exe name for open program. As default use shortcut name for program name
        ProgramsMenu.Add appName appKey, ((ShortcutName,exeAppName,winAppTitle,*) => runApp(ShortcutName,exeAppName,winAppTitle)).Bind(appName, appExe, winTitle)   

        ;  if png image exist in YML file then use png image as icon. As defaul use icon from shortcut
        if (!aIdx.Has("icon") || (aIdx["icon"] = "null")) {
             ; Get app target from lnk file
            FileGetShortcut menushortcutspath appName ".lnk", OutTarget, OutDir, OutArgs, OutDesc, OutIcon, OutIconNum, OutRunState
            ProgramsMenu.SetIcon appName appKey, OutTarget, -1, 16
            ; Say(OutDesc)
        } else {
            Try
                ProgramsMenu.SetIcon appName appKey, menuiconpath aIdx["icon"],, 0
            catch e 
                    MsgBox("RB TOOLS:`nWrong icon name in configuration file:`n" MenuConfigYmlFile "`n`nExtras:`n" e.Extra " `n`nERROR MESSAGE (line " e.Line "):`n" e.Message,,16)
        }   
    }

}


; Create another menu destined to become a submenu of the above menu.
Submenu1 := Menu.New()
Submenu1.Add "Item A", "testRun"
Submenu1.Add "Item B", "testRun"

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
ProgramsMenu.Add "My Submenu", Submenu1


runApp(ShortcutName, exeAppName, winAppTitle, *) {
            ;  Say(winAppTitle " : " winAppTitle " : " ShortcutName)   
        If WinExist(winAppTitle) {
            WinActivate winAppTitle
            ; Say(winAppTitle)
        } else if WinExist("ahk_exe " exeAppName ".exe") {
            ; Say(exeAppName)
            WinActivate "ahk_exe " exeAppName ".exe"
        } else {
            ; Say(ShortcutName)
            Run "MENU_files\shortcut\" ShortcutName ".lnk"
        }
    ; Run "open 'Figma.exe'", "C:\Users\Radzhab\AppData\Local\Figma\"
}

testRun(Item, *) {
    Say(Item)

}



; ---------------------------------------------------------
; ---------------------------------------------------------
; ---------------------------------------------------------
~MButton::
{
    if (A_PriorHotkey != "~MButton" or A_TimeSincePriorHotkey > 400)
    {
        ; Too much time between presses, so this isn't a double-press.
        KeyWait "MButton"
        return
    }
    ProgramsMenu.Show
}

~LShift::
{
    if (A_PriorHotkey != "~LShift" or A_TimeSincePriorHotkey > 400)
    {
        ; Too much time between presses, so this isn't a double-press.
        KeyWait "LShift"
        return
    }
    ProgramsMenu.Show
}



; RButton & LButton::
CapsLock & Escape:: ProgramsMenu.Show  ; i.e. press the Win-Z hotkey to show the menu.