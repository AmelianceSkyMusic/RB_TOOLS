@echo off
Set-WinUserLanguageList -LanguageList ru, en-US -Force
setlocal
set ahk=%~dp0bin\AutoHotkey64.exe
@REM set ahk=%~dp0bin\AutoHotkeyU64_a122f595abc2.exe
set script=%~dp0RB [MAIN] Index.ahk
echo DetectHiddenWindows(1), PostMessage(0x50,, 0x4090409,, "A") | "%ahk%" /ErrorStdOut * && start "" "%ahk%" "%script%"