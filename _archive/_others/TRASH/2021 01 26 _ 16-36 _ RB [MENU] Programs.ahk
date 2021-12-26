;# Win   ! Alt   ^ Ctrl   + Shift

#HotIf

tab := "`t&"
global menuiconpath := "MENU_files\img\"
menuIniPath := "MENU_files\ini\"
global menushortcutspath := "MENU_files\shortcut\"

; Say(menuIniPath "Programs.ini")
programsListFile := menuIniPath "Programs.ini"

programsListArr := GetArrFromINI_FC(programsListFile)









; file := FileSelect(32,, "Pick a shortcut to analyze.", "Shortcuts (*.lnk)")
; if file = ""
;     return
; Create the popup menu by adding some items to it.
global ProgramsMenu := Menu.New()




n := 0
previewGroup := programsListArr[1]
countVar := 6 ; Count of varibles (Section + number + last varibles)
; FileGetShortcut menushortcutspath "Studio One" ".lnk", OutTarget, OutDir, OutArgs, OutDesc, OutIcon, OutIconNum, OutRunState
; Say(OutTarget)
; ProgramsMenu.SetIcon appName tab appKey, OutTarget, -1, 16
loop programsListArr.Length/countVar{

  ; Say(programsListArr[1+n],0.4)
  ; Say(programsListArr[2+n],0.4)
  ; Say(programsListArr[3+n],0.4)
  ; Say(programsListArr[4+n],0.4)
  ; Say(programsListArr[2+n])
  Say(programsListArr[3+n], 0.4)
  if (programsListArr[3+n] = "") {
    ProgramsMenu.Add  ; Add a separator line.
  } else {
    
    if (programsListArr[1+n] != previewGroup) {
      ProgramsMenu.Add  ; Add a separator line.
    }
    appName :=  programsListArr[3+n]
    appKey := programsListArr[4+n]

    ; if app exe name exist in ini file then use exe name for open program. As default use shortcut name for program name
    if programsListArr[6+n] = ""{
      ProgramsMenu.Add appName tab appKey, ((ShortcutName,exeAppName,*) => RunApp(ShortcutName,exeAppName)).Bind(appName)
    } else {
      ProgramsMenu.Add appName tab appKey, ((ShortcutName,exeAppName,*) => RunApp(ShortcutName,exeAppName)).Bind(appName, programsListArr[6+n])
    }

    ; Get app target from lnk file
    FileGetShortcut menushortcutspath appName ".lnk", OutTarget, OutDir, OutArgs, OutDesc, OutIcon, OutIconNum, OutRunState

    ;  if png image exist in ini file then use png image as icon. As defaul use icon from shortcut
    if programsListArr[5+n] = ""{
      ProgramsMenu.SetIcon appName tab appKey, OutTarget, -1, 16
    } else {
      ProgramsMenu.SetIcon appName tab appKey, menuiconpath programsListArr[5+n],, 0
    }

  }

    previewGroup := programsListArr[1+n] 
    n := n + countVar
}






; Create another menu destined to become a submenu of the above menu.
Submenu1 := Menu.New()
Submenu1.Add "Item A", "RunApp"
Submenu1.Add "Item B", "RunApp"

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
ProgramsMenu.Add "My Submenu", Submenu1





; ProgramsMenu.Add  ; Add a separator line.
; ProgramsMenu.Add "Calculator"       tab "c", "RunCalculator"
; ProgramsMenu.Add "Notepad"          tab "n", "RunNotepad"


; ProgramsMenu.SetIcon "Calculator"       tab "c",     menuiconpath "Calc.png",, 0
; ProgramsMenu.SetIcon "Notepad"          tab "n",     menuiconpath "Notepad.png",, 0

; ProgramsMenu.SetColor("2B2B2B", Submenus := true)

; RunCalculator(Item, *) {
;   if WinExist("Калькулятор")
;     WinActivate
;   else
;     Run "calc.exe"
;   }

; RunNotepad(Item, *) {
;   if WinExist("Notepad")
;     WinActivate
;   else
;     Run "notepad.exe"
;   }


RunApp(ShortcutName, exeAppName, *) {
  if WinExist("ahk_exe " exeAppName ".exe") {
    WinActivate "ahk_exe " exeAppName ".exe"
  } else {
    runpath := "MENU_files\shortcut\" ShortcutName ".lnk"
    Run runpath
  }
    ; Run "open 'Figma.exe'", "C:\Users\Radzhab\AppData\Local\Figma\"
}


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