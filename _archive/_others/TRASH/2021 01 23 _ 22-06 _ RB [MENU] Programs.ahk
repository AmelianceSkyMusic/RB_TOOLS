;# Win   ! Alt   ^ Ctrl   + Shift

#HotIf

tab := "`t&"
menuiconpath := "MENU_files\img\"
menuIniPath := "MENU_files\ini\"
global menushortcutspath := "MENU_files\shortcut\"

; Say(menuIniPath "Programs.ini")
programsListFile := menuIniPath "Programs.ini"

programsListArr := GetArrFromINI_FC(programsListFile)









; file := FileSelect(32,, "Pick a shortcut to analyze.", "Shortcuts (*.lnk)")
; if file = ""
;     return
FileGetShortcut menushortcutspath "Figma.lnk", OutTarget, OutDir, OutArgs, OutDesc, OutIcon, OutIconNum, OutRunState


; Create the popup menu by adding some items to it.
global ProgramsMenu := Menu.New()

n := 0
previewGroup := programsListArr[1]
loop programsListArr.Length/4{
  ; Say(programsListArr[1+n],0.4)
  ; Say(programsListArr[2+n],0.4)
  ; Say(programsListArr[3+n],0.4)
  ; Say(programsListArr[4+n],0.4)
    if (programsListArr[1+n] = previewGroup) {
      appName :=  programsListArr[3+n]
      appKey := programsListArr[4+n]
      ProgramsMenu.Add appName tab appKey, ((n,*) => RunApp(n)).Bind(appName)
      FileGetShortcut menushortcutspath appName ".lnk", OutTarget, OutDir, OutArgs, OutDesc, OutIcon, OutIconNum, OutRunState
      ProgramsMenu.SetIcon appName tab appKey, OutTarget, -1, 16
    } else {
      ProgramsMenu.Add  ; Add a separator line.
    }
    previewGroup := programsListArr[1+n] 
    n := n + 4
}

; ProgramsMenu.Add "Figma"               tab "f", ((n,*) => RunApp(n)).Bind("Figma")
; ProgramsMenu.Add "Illustrator 2020"    tab "i", ((n,*) => RunApp(n)).Bind("Illustrator 2020")
; ProgramsMenu.Add "Illustrator 2021"    tab "", ((n,*) => RunApp(n)).Bind("Illustrator 2021")
; ProgramsMenu.Add "Photoshop 2021"      tab "", ((n,*) => RunApp(n)).Bind("Photoshop 2021")
; ProgramsMenu.Add "CorelDRAW"           tab "", ((n,*) => RunApp(n)).Bind("CorelDRAW")
; ProgramsMenu.Add "Affinity Photo"      tab "", ((n,*) => RunApp(n)).Bind("Affinity Photo")
; ProgramsMenu.Add "Affinity Designer"   tab "", ((n,*) => RunApp(n)).Bind("Affinity Designer")
; ProgramsMenu.Add "After Effects 2020"  tab "", ((n,*) => RunApp(n)).Bind("After Effects 2020")
; ProgramsMenu.Add  ; Add a separator line.
; ProgramsMenu.Add "Studio One"      tab "s", ((n,*) => RunApp(n)).Bind("Studio One")
; ProgramsMenu.Add "Reaper"          tab "r", ((n,*) => RunApp(n)).Bind("Reaper")
; ProgramsMenu.Add  ; Add a separator line.
; ProgramsMenu.Add "Cent Browser"     tab "b", ((n,*) => RunApp(n)).Bind("Cent Browser")
; ProgramsMenu.Add "Telegram"         tab "t", ((n,*) => RunApp(n)).Bind("Telegram")
; ProgramsMenu.Add "Viber"            tab "v", ((n,*) => RunApp(n)).Bind("Viber")
; ProgramsMenu.Add "AIMP"             tab "a", ((n,*) => RunApp(n)).Bind("AIMP")
; ProgramsMenu.Add "Code"             tab "c", ((n,*) => RunApp(n)).Bind("Code")
; ProgramsMenu.Add  ; Add a separator line.
; ProgramsMenu.Add "Total Commander"  tab "", ((n,*) => RunApp(n)).Bind("Total Commander")
ProgramsMenu.Add  ; Add a separator line.
ProgramsMenu.Add "Calculator"       tab "c", "RunCalculator"
ProgramsMenu.Add "Notepad"          tab "n", "RunNotepad"
; ; ---------------------------------------------------------------------------------------------------
; ProgramsMenu.SetIcon "Figma"              tab "f",     OutIcon,-1, 16
; ProgramsMenu.SetIcon "Illustrator 2020"   tab "i",     menuiconpath "Illustrator 2020.png",, 0
; ProgramsMenu.SetIcon "Illustrator 2021"   tab "",     menuiconpath "Illustrator 2021.png",, 0
; ProgramsMenu.SetIcon "Photoshop 2021"     tab "",     menuiconpath "Photoshop 2021.png",, 0
; ProgramsMenu.SetIcon "CorelDRAW"          tab "",     menuiconpath "CorelDRAW.png",, 0
; ProgramsMenu.SetIcon "Affinity Photo"     tab "",     menuiconpath "Affinity Photo.png",, 0
; ProgramsMenu.SetIcon "Affinity Designer"  tab "",     menuiconpath "Affinity Designer.png",, 0
; ProgramsMenu.SetIcon "After Effects 2020" tab "",     menuiconpath "After Effects 2020.png",, 0

; ProgramsMenu.SetIcon "Studio One"         tab "s",     menuiconpath "Studio One.png",, 0
; ProgramsMenu.SetIcon "Reaper"             tab "r",     menuiconpath "Reaper.png",, 0

; ProgramsMenu.SetIcon "Cent Browser"    tab "b",     menuiconpath "Cent Browser.png",, 0
; ProgramsMenu.SetIcon "Telegram"        tab "t",     menuiconpath "Telegram.png",, 0
; ProgramsMenu.SetIcon "Viber"           tab "v",     menuiconpath "Viber.png",, 0
; ProgramsMenu.SetIcon "AIMP"            tab "a",     menuiconpath "AIMP.png",, 0
; ProgramsMenu.SetIcon "Code"            tab "c",     menuiconpath "Code.png",, 0

; ProgramsMenu.SetIcon "Total Commander"  tab "",     menuiconpath "Total Commander.png",, 0
ProgramsMenu.SetIcon "Calculator"       tab "c",     menuiconpath "Calc.png",, 0
ProgramsMenu.SetIcon "Notepad"          tab "n",     menuiconpath "Notepad.png",, 0

; ProgramsMenu.SetColor("2B2B2B", Submenus := true)

RunCalculator(Item, *) {
  if WinExist("Калькулятор")
    WinActivate
  else
    Run "calc.exe"
  }

RunNotepad(Item, *) {
  if WinExist("Notepad")
    WinActivate
  else
    Run "notepad.exe"
  }


RunApp(Item, *) {
  if WinExist("ahk_exe " Item ".exe") {
    WinActivate "ahk_exe " Item ".exe"
  } else {
    runpath := "MENU_files\shortcut\" Item ".lnk"
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