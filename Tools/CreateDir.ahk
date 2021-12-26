; ; #SingleInstance, Force
; ; SendMode Input
; ; SetWorkingDir, %A_ScriptDir%
; ; #SingleInstance, Force
; ; #KeyHistory, 0
; ; SetBatchLines, -1
; ; ListLines, Off
; ; SendMode Input ; Forces Send and SendRaw to use SendInput buffering for speed.
; ; SetTitleMatchMode, 3 ; A window's title must exactly match WinTitle to be a match.
; ; SetWorkingDir, %A_ScriptDir%
; ; SplitPath, A_ScriptName, , , , thisscriptname
; ; #MaxThreadsPerHotkey, 1 ; no re-entrant hotkey handling
; ; ; DetectHiddenWindows, On
; ; ; SetWinDelay, -1 ; Remove short delay done automatically after every windowing command except IfWinActive and IfWinExist
; ; ; SetKeyDelay, -1, -1 ; Remove short delay done automatically after every keystroke sent by Send or ControlSend
; ; ; SetMouseDelay, -1 ; Remove short delay done automatically after Click and MouseMove/Click/Drag

; WinGetPos , , win_x, win_y, "A"

; dir_var := InputBox("Пожалуйста, вставьте сюда директиву для создания папок:", "Создание папок", "w500 h100").value
; If (dir_var){
; DirCreate dir_var
; 		Tooltip 'DONE', win_x/2, win_y/2
; 		Sleep 1000
; 		Tooltip
;         Run dir_var
; } else {
;     	Tooltip 'CANCELED', win_x/2, win_y/2
; 		Sleep 1000
; 		Tooltip
; }


; ; Gui.Destroy()





; MyGui := Gui.New()
; Tab := MyGui.Add("Tab3", "w500", ["First Tab","Second Tab","Third Tab"])

; MyGui.Add("Checkbox", "vMyCheckbox", "Sample checkbox") 
; Tab.UseTab(2)

; MyGui.Add("Radio", "vMyRadio", "Sample radio1")
; MyGui.Add("Radio",, "Sample radio2")
; Tab.UseTab(3)

; MyGui.Add("Edit", "vMyEdit r5 w500")  ; r5 means 5 rows tall.
; Tab.UseTab()  ; i.e. subsequently-added controls will not belong to the tab control.

; Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
; Btn.OnEvent("Click", (*) => ProcessUserInput(MyGui))
; MyGui.OnEvent("Close", "ProcessUserInput")
; MyGui.OnEvent("Escape", "ProcessUserInput")
; MyGui.Show()

; ProcessUserInput(thisGui, *)
; {
;     Saved := thisGui.Submit()  ; Save the contents of named controls into an object.
;     MsgBox("You entered:`n" Saved.MyCheckbox "`n" Saved.MyRadio "`n" Saved.MyEdit)
; }






; Gui.Destroy()
; MyGui := Gui.New()
; createFolder := MyGui.Add("Создание папок", "w500") ;, ["First Tab","Second Tab","Third Tab"])

; MyGui.Add("Checkbox", "vMyCheckbox", "Sample checkbox") 
; Tab.UseTab(2)

; MyGui.Add("Radio", "vMyRadio", "Sample radio1")
; MyGui.Add("Radio",, "Sample radio2")
; Tab.UseTab(3)




; iconsize := 32  ; Ideal size for alt-tab varies between systems and OS versions.
; hIcon := LoadPicture("asm.ico", "Icon1 w" iconsize " h" iconsize, imgtype)
; MyGui := Gui.New()

createFolderGUI := Gui()

; SendMessage(0x80, 1, hIcon, createFolderGUI)  ; 0x80 is WM_SETICON; and 1 

createFolderGUI.MarginX := 16
createFolderGUI.MarginY := 16
; MyGui.Add("Edit", "w600")  ; Add a fairly wide edit control at the top of the window.
; createFolderGUI.Add("Text", "cCCCCCC", " (C:\Users\Default\Documents...):")  ; Save this control's position and start a new section.
createFolderGUI.Add("Text", "cCCCCCC section", "D:\Existing Folder\")  ; Save this control's position and start a new section.
createFolderGUI.Add("Text","cCCCCCC", "New Folder\Another New Folder\")
createFolderGUI.Add("Text","cCCCCCC", "Extra Line\For\Other New Folders\")

createFolderGUI.Add("Edit", "vpartOne w480 section ys")  ; Start a new column within this section.
createFolderGUI.Add("Edit", "vparttwo w500")
createFolderGUI.Add("Edit", "vpartThree w500")


selectDir := createFolderGUI.Add("Button", "vgetBtnOne section w20 hp xs+480 ys", "...")  ; xm puts it at the bottom left corner.
bthClear_1 := createFolderGUI.Add("Button", "hp xs+25 ys", "clear")  ; xm puts it at the bottom left corner.
bthClear_2 := createFolderGUI.Add("Button", "hp", "clear")  ; xm puts it at the bottom left corner.
bthClear_3 := createFolderGUI.Add("Button", "hp", "clear")  ; xm puts it at the bottom left corner.
; bthTwo := createFolderGUI.Add("Button", , "...")  ; xm puts it at the bottom left corner.
; btnThree := createFolderGUI.Add("Button", , "...")  ; xm puts it at the bottom left corner.

selectDir.OnEvent("Click", (*) => dirSel(createFolderGUI))
bthClear_1.OnEvent("Click", (*) => clearInput_1(createFolderGUI))
bthClear_2.OnEvent("Click", (*) => clearInput_2(createFolderGUI))
bthClear_3.OnEvent("Click", (*) => clearInput_3(createFolderGUI))
; bthTwo.OnEvent("Click", (*) => dirSel(createFolderGUI))
; btnThree.OnEvent("Click", (*) => dirSel(createFolderGUI))


btnOk := createFolderGUI.Add("Button", "default w725 xm hp+20", "CREATE")  ; xm puts it at the bottom left corner.
btnOk.OnEvent("Click", (*) => ProcessUserInput(createFolderGUI))


createFolderGUI.OnEvent("Close", ProcessUserExit)
createFolderGUI.OnEvent("Escape", ProcessUserExit)

createFolderGUI.BackColor := "333333"
; btnOk.Opt("0x8000")
createFolderGUI.Title := "Folder creator from path"
; createFolderGUI.Opt("DPIScale")
createFolderGUI.Opt("ToolWindow")
createFolderGUI.Opt("+E0x40000")
; createFolderGUI.Opt("0x400000")
; createFolderGUI.Opt("-Theme")


; createFolderGUI.Opt("-SysMenu")
; btnOk.SetColor "White"
createFolderGUI.Show()

; WinSetAlwaysOnTop true, "Folder creator from path"

SoundBeep 440, 200
SoundBeep 220, 200
SoundBeep 330, 200
SoundBeep 440, 500


; WinSetTransColor("EEAA99", createFolderGUI)

ProcessUserInput(thisGui, *)
{
	
    sevedElm := thisGui.Submit(false)  ; Save the contents of named controls into an object.
	dir_var := sevedElm.partOne "\" sevedElm.partTwo "\" sevedElm.partThree "\"
	DirCreate dir_var
	Run dir_var
	WinGetPos , , &win_x, &win_y, "A"
	; Tooltip 'DONE', win_x/2, win_y/2
	; Sleep 400
	; Tooltip
}

ProcessUserExit(thisGui, *) {
	WinGetPos , , &win_x, &win_y, "A"
	; Tooltip 'Exit', win_x/2, win_y/2
	; Sleep 400
	; Tooltip
}


dirSel(thisGui, *) {
	gPartOne := thisGui["partOne"]
	getPath := FileSelect("D", , "Select a folder")
	gPartOne.value := getPath
}

clearInput_1(thisGui, *) {
	gPartOne := thisGui["partOne"]
	gPartOne.value := ""
}

clearInput_2(thisGui, *) {
	gPartTwo := thisGui["partTwo"]
	gPartTwo.value := ""
}

clearInput_3(thisGui, *) {
	gPartThree := thisGui["PartThree"]
	gPartThree.value := ""
}