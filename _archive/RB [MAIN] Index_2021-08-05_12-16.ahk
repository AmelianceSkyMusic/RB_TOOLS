;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance Force
Persistent
; SetKeyDelay -1
; SendMode "Play"
SetKeyDelay 0
; SetMouseDelay 0
SetStoreCapsLockMode 0
SetDefaultMouseSpeed 0
SetWorkingDir A_ScriptDir

index := {}
index.scriptDir := A_ScriptDir


!#Esc::
{
    Try
        Run "INDEX_RUN.bat"
    catch Error
        MsgBox("Cant find file")
    ExitApp
}

!Esc::reload


; -----------------------------------------------------------------
; --------------------------- TRAY MENU ---------------------------
; -----------------------------------------------------------------

;   trayMenu() {
;     TraySetIcon a.img "\TapKeyW.ico"
;     try if RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "SystemUsesLightTheme")
;       TraySetIcon a.img "\TapKeyB.ico"

;     A_IconTip := a.name "`nv." a.ver "`n`nMouse click:`nleft        - reload`nmiddle - suspend`nright     - menu"
;     A_TrayMenu.Default := ""

;     A_TrayMenu.Rename "&Help", "AutoHotkey &Help"
;     A_TrayMenu.Rename "&Open", "&Open AutoHotkey"

;     a.trayOptions := myMenu("")
;     A_TrayMenu.Insert "1&"
;     A_TrayMenu.Insert "1&", "Options", a.trayOptions

;     A_TrayMenu.Insert "1&", "Toggle TapKey Modules", (*) => tapkeyModules(a.work "\app\TapKey.ahk")
;     A_TrayMenu.Default :=   "Toggle TapKey Modules"

;     A_TrayMenu.Insert "1&", "Launch at Login", Func("toggleStartup").Bind("")
;     A_TrayMenu.Insert "1&", "&About " a.name, (*) => Run(a.url)
;   }

TraySetIcon "RB.ico", ,1

; A_TrayMenu.delete() ; Delete all menu
; A_TrayMenu.Add("Suspend", "SuspendScript")  ; Creates a new menu item.
; ; A_TrayMenu.SetIcon("Suspend", "figma.ico")
; SuspendScript(ItemName, ItemPos, Menu) {
;     Suspend
; }

; A_TrayMenu.Add()  ; Creates a separator line.
; A_TrayMenu.Add("Restart", "RestartScript")  ; Creates a new menu item.
; ; A_TrayMenu.SetIcon("Restart", "figma.ico")
; RestartScript(ItemName, ItemPos, Menu) {
;     Reload
; }

; A_TrayMenu.Add()  ; Creates a separator line.
; A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
; ; A_TrayMenu.SetIcon("Exit", "figma.ico")
; ExitScript(ItemName, ItemPos, Menu) {
;     ExitApp
; }

; -----------------------------------------------------------------
; ----------------------- #INCLUDE MODULES ------------------------
; -----------------------------------------------------------------
#Include Functions\Keyboard Layouts.ahk

; #Include ZZ [LIB] YAML.ahk

menus := {}
menus.dir := A_ScriptDir "\Menus\"
; #Include Menus\Programs.ahk
#Include Menus\Tray.ahk

functions := {}
functions.dir := A_ScriptDir "\Functions\"
#Include Functions\z_Show Hide Mouse Cursor.ahk
#Include Functions\z_Multitap.ahk
#Include Functions\z_Convert Formats.ahk
#include Functions\Say.ahk
#include Functions\Paste Text.ahk
#include Functions\Images.ahk
#include Functions\Change Case.ahk
#include Functions\Change SelText Layout.ahk
#include Functions\Show Hide Taskbar.ahk
#include Functions\Get Arr From Txt Config.ahk
#include Functions\Create Menu.ahk
#include Functions\Add Hotstrings.ahk
#include Functions\Something.ahk





; #Include 2021 01 25 _ 12-14 _ Functions\ Get arrey from ini.ahk
hotkeys := {}
hotkeys.dir := A_ScriptDir "\Hotkeys\"
#Include RB [HOTKEY] Suspend.ahk
#Include RB [HOTKEY] Fullscreen.ahk
#Include RB [HOTKEY] Navigation.ahk
#Include RB [HOTKEY] Typography.ahk
#Include RB [HOTKEY] Mouse.ahk

snippets := {}
snippets.dir := A_ScriptDir "\Snippets\"
#Include RB [SNIPPET] Work.ahk
#Include RB [SNIPPET] Others.ahk
#Include RB [SNIPPET] HotKeys.ahk

hotstrings := {}
hotstrings.dir := A_ScriptDir "\Hotstrings\"
#Include Hotstrings\Data.ahk

; -----------------------------------------------------------------
; ----------------------- #INCLUDE SCRIPTS ------------------------
; -----------------------------------------------------------------
; *i — ingnor syntax errors if it is not critical for main script
programs := {}
programs.dir := A_ScriptDir "\Programs\"
#Include *i Programs\Figma.ahk
#Include *i Programs\Lunacy.ahk
#Include *i Programs\Affinity Designer.ahk
#Include *i Programs\Illustrator.ahk
#Include *i Programs\Indesign.ahk
#Include *i Programs\Photoshop.ahk
#Include *i Programs\Corel Draw.ahk
#Include *i Programs\Studio One.ahk
; #Include *i Programs\Ableton.ahk
#Include *i Programs\ShareX.ahk
#Include *i Programs\Guitar Pro.ahk
#Include *i Programs\Telegram.ahk
#Include *i Programs\Notepad.ahk

#Include *i Programs\Studio One Hand Tool.ahk


ProgramMenu := createMenu("Programs", A_ScriptDir "\Menus\Programs")

; #Include *i RB [HOYKEY_P] Reaper.ahk
; #Include *i RB [HOYKEY_P] Abletone.ahk
; #Include *i illustrator.ahk
; #MaxThreadsBuffer true
Say("SCRIPTS WERE LOADED", 2)

; SetTimer indexSoundBeep(), -1
; SetTimer (*) => Say("SCRIPTS ARE LOADED", 0.4), -1


; SetTimer (*) => Say_FC(text, time, x, y, title), -1
; indexSoundBeep() {
    SoundBeep 440, 125
    ; SoundBeep 523.25, 125
    ; SoundBeep 659.26, 125
    ; SoundBeep 523.25, 125
    SoundBeep 220, 250
; }
; #MaxThreadsBuffer false







; -----------------------------------------------------------------
; -----------------------  ------------------------
; -----------------------------------------------------------------



; #SuspendExempt  ; Exempt the following hotkey from Suspend.
; #Esc::
; {
; 	WinGetPos , , win_x, win_y, "A"
; 	SoundPlay "*-1, WAIT"
; 	if (is_suspended){
; 			Suspend ;"Toggle"
; 			SoundPlay "*-1, WAIT"
; 			is_suspended := false
;             Say "Script is ON"
; 	} else {
; 			Suspend ;"Toggle"
; 			SoundPlay "*-1, WAIT"
; 			is_suspended := true
; 			Tooltip "script is OFF", win_x/2, win_y/2
; 			Sleep 1000
; 			Tooltip
;             Say "Script is OFF"
; 	}
; }

; #SuspendExempt False  ; Disable exemption for any hotkeys/hotstrings below this.





; click(x := 0, y := 0, title :='ClickGUI', button := "L") {
;     time := 1
;     text := ""

;     Switch button
;     {
;         Case "L": color := "27AE60" ;-- green
;         Case "M": color :="AE3030"
;         Case "R": color :="BD832B"
;     }

;     winTitle := WinGetTitle(,,"A")

;     ClickGUI := Gui.New("+LastFound +AlwaysOnTop +ToolWindow -Caption", title)
;     ; ClickGUI.SetFont(, "MS sans serif")
;     ; ClickGUI.SetFont(, "Verdana")
;     ClickGUI.SetFont("cWhite s14 q5 w700", "Segoe UI Bold")  ; Preferred font.
;     ClickGUI.Add("Text", "", text)
;     ClickGUI.BackColor := color ;-- green
  
;     ; WinSetTransColor("FFFFFE 255", ClickGUI)"xCenter y" winHeight)
;     ; ClickGUI.Opt("-Caption")
;     winHeight := A_ScreenHeight-A_ScreenHeight/5
;     MouseGetPos mouseX, mouseY
;     mouseX := 500 ;mouseX-mouseX/2
;     mouseY := 500 ;mouseY-mouseY/2
;     ClickGUI.Show("x" mouseX " y" mouseY)
;     WinGetPos(winX, winY, winWidth, winHeight, title)
;     WinSetRegion("0-0 w" winWidth " h" winHeight " r50-50", title)

;     ; time := time * 5000
;     ; Sleep time
;     ; ClickGUI.Destroy

;     destroyClickGUI(ClickGUI) {
;         ClickGUI.Destroy
  
;         ; SetTimer ,0
;     }

;     SetTimer (*) => destroyClickGUI(ClickGUI), time * -100
;     WinExist(,,"A")
;     WinActivate(,,winTitle)
; }


; arr := []
; #^o::{
;     global arr
;     file := "MENU_files/ok.txt"
;     arr := getMenuArrFromTxt(file)
;     MsgBox "stop"
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
        ProgramMenu.Show()
        ; sleep 1000
    }
}


#^o::{
; Run A_ComSpec ' /c "C:\My Utility.exe" "param 1" "second param" >"C:\My File.txt"'
RunWait A_ComSpec ' /c "cmd.exe" > "d:/mkdir wikihow"'
; Run A_ComSpec ' /c >"pause"'
}


#^p::{

RunWaitOne("echo Put your commands here")
linesCmd := "
(
    echo Put your commands here,
    echo each one will be run,
    echo and you'll get the output.
    pause
)"

RunWaitMany(linesCmd)

RunWaitOne(command) {
    ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99 ¬
    shell := ComObject("WScript.Shell")
    ; Execute a single command via cmd.exe
    exec := shell.Exec(A_ComSpec " /C>" command)
    exec := shell.Exec(A_ComSpec " /C>pause")
    ; Read and return the command's output
    return exec.StdOut.ReadAll()
}

RunWaitMany(commands) {
    shell := ComObject("WScript.Shell")
    ; Open cmd.exe with echoing of commands disabled
    exec := shell.Exec(A_ComSpec " /Q /K echo off")
    ; Send the commands to execute, separated by newline
    exec.StdIn.WriteLine(commands "`n")	; Always exit at the end!
    ; Read and return the output of all commands
    return exec.StdOut.ReadAll()
}

}