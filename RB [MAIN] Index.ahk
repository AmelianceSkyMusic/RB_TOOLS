;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance Force
Persistent
; SetKeyDelay -1
; SendMode "Play"
SetKeyDelay 0
SetWinDelay -1
; SetMouseDelay 0
SetStoreCapsLockMode 0
SetDefaultMouseSpeed 0
SetWorkingDir A_ScriptDir
; CoordMode "Mouse"
; CoordMode "Pixel"

; index := {}
; index.scriptDir := A_ScriptDir

index_ahk := {}
index_ahk.data := A_WorkingDir "\Data\"
index_ahk.isSuspended := true



!#Esc::
{
    Try
        Run "INDEX_RUN.bat"
    catch Error
        MsgBox("Cant find file")
    ExitApp
}

!Esc::reload
#y::MsgBox WinGetTitle("A")


; -----------------------------------------------------------------
; --------------------------- TRAY MENU ---------------------------
; -----------------------------------------------------------------


TraySetIcon "RB.ico", ,1

; -----------------------------------------------------------------
; ----------------------- #INCLUDE MODULES ------------------------
; -----------------------------------------------------------------
; #include Lib\CLR.ahk
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
#Include Functions\Convert.ahk
#include Functions\Say.ahk
#Include Functions\Suspend.ahk
#include Functions\Paste Text.ahk
#include Functions\Images.ahk
#include Functions\Change Case.ahk
#include Functions\Change SelText Layout.ahk
#include Functions\Show Hide Taskbar.ahk
#include Functions\Get Arr From Txt Config.ahk
#include Functions\Create Menu.ahk
#include Functions\Others.ahk
#include Functions\Mouse Drag.ahk

tools := {}
tools.dir := A_ScriptDir "\Tools\"
#include Tools\Add Hotstrings.ahk
#include Tools\Something.ahk
; #include Tools\CreateDir.ahk
; #include Tools\OneLetterTyping.ahk



#Include Quick actions.ahk
; #Include 2021 01 25 _ 12-14 _ Functions\ Get arrey from ini.ahk
hotkeys := {}
hotkeys.dir := A_ScriptDir "\Hotkeys\"
#Include RB [HOTKEY] Suspend.ahk
#Include RB [HOTKEY] Fullscreen.ahk
#Include RB [HOTKEY] Navigation.ahk
#Include RB [HOTKEY] Typography.ahk
#Include RB [HOTKEY] Emoji.ahk
#Include RB [HOTKEY] Mouse.ahk

snippets := {}
snippets.dir := A_ScriptDir "\Snippets\"
#Include RB [SNIPPET] HTML.ahk
#Include RB [SNIPPET] CSS.ahk
#Include RB [SNIPPET] JS.ahk
#Include RB [SNIPPET] GIT.ahk
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
#Include Programs\Figma.ahk
#Include Programs\Lunacy.ahk
#Include Programs\Affinity Designer.ahk
#Include Programs\Illustrator.ahk
#Include Programs\Indesign.ahk
#Include Programs\Photoshop.ahk
#Include Programs\Premiere Pro.ahk
#Include Programs\Corel Draw.ahk
#Include Programs\Studio One.ahk
#Include Programs\Reaper.ahk
; #Include *i Programs\Ableton.ahk
#Include Programs\ShareX.ahk
#Include Programs\Guitar Pro.ahk
#Include Programs\Telegram.ahk
#Include Programs\Notepad.ahk
#Include Programs\Explorer.ahk
#Include Programs\Obsidian.ahk
#Include Programs\Chrome.ahk


ProgramMenu := createMenu("Programs", A_ScriptDir "\Menus\Programs")

; #Include *i RB [HOYKEY_P] Reaper.ahk
; #Include *i RB [HOYKEY_P] Abletone.ahk
; #Include *i illustrator.ahk
; #MaxThreadsBuffer true
Say("SCRIPTS WERE LOADED", 1)

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

; Sleep 500
; Run("Sciter\Amazing App.ahk")

readReload(index_ahk.data "reload")
; #MaxThreadsBuffer false
; if FileExist(index_ahk.data "reload") {
;     reloadStr := FileRead(index_ahk.data "reload")
;     reloadStrArr := StrSplit(reloadStr,"`n", "`r")
;     reloadFun := reloadStrArr[1]
;     reloadArg := reloadStrArr[2]
;     If reloadFun != "" && reloadArg != "" {
;         ; Msg "run function: " reloadFun '("' reloadArg '")'
;         if Type(%reloadFun%) = "Func"
;             %reloadFun%(reloadArg)
;         else
;             Say(reloadFun " is not a function", , , , , "ERR")
;     }
;     FileDelete index_ahk.data "reload"
; }
; if FileExist(index_ahk.data "autorun.txt") {
;     autorunStr := FileRead(index_ahk.data "autorun.txt")
; }





#HotIf

#h::addHotstringAHK("")
#b::domethingAHK("")
; -----------------------------------------------------------------
; -----------------------  ------------------------
; -----------------------------------------------------------------

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