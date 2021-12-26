; AHK2
A_TrayMenu.delete() ; Delete all menu
;~ A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Pause", "PauseScript")  ; Creates a new menu item.
A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
;~ A_TrayMenu.SetIcon("Exit", "reaper.ico")
;~ return

PauseScript(ItemName, ItemPos, Menu) {
	Pause
}
	
ExitScript(ItemName, ItemPos, Menu) {
	ExitApp
}
	
{ 
SoundPlay "*16, WAIT"
go_start := MsgBox("Розпочнемо? `nЯ буду нагадувати тобі тримати спину рівно кожні 30 хв;)", "Чого дивишся?", "YesNo 0x40000")
if  go_start = "No" {
	SoundPlay "*-1, WAIT"
	ExitApp
} else {
	SetTimer "Alert_BACK", 1800000
	SoundPlay "*-1, WAIT"
}
return

Alert_BACK(){
SoundPlay "*16, WAIT"
if MsgBox("Тримай спинку рівно!!!", "Чого дивишся?", "R/C  0x40000") = "Cancel" {
		SoundPlay "*-1, WAIT"
	ExitApp
} else {
	SoundPlay "*-1, WAIT"
	SetTimer "Alert_BACK", 1800000
}
return
}

;~ WinWait "Чого дивишся?"
;~ SoundPlay "*-1, WAIT"
;~ MsgBox "cxvxcv"
;~ WinSetAlwaysOnTop "On"
;~ return
}

;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"