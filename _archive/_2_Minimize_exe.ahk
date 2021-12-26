; AHK2
A_TrayMenu.delete() ; Delete all menu
;~ A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Pause", "PauseScript")  ; Creates a new menu item.
A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
;~ A_TrayMenu.SetIcon("Exit", "reaper.ico")
;~ return


PauseScript(ItemName, ItemPos, Menu) {
	isPassword := InputBox InputBox("Enter password:", "MINIMIZE EXE",  "password w150 h130")
if (isPassword = password) {
    MsgBox "Program is paused!"
	Pause
	} else {
		MsgBox "WRONG PASSWORD"
	}
}
	
ExitScript(ItemName, ItemPos, Menu) {
	isPassword := InputBox InputBox("Enter password:", "MINIMIZE EXE",  "password w150 h130")
	if (isPassword = password){
    MsgBox "Program is Exit!"
	ExitApp
	} else {
		MsgBox "WRONG PASSWORD"
	}

}


global arrayEXE := [ "Chrome.exe", "Telegram.exe", "Viber.exe", "Firefox.exe", "Tor.exe", "Opera.exe"]

;~ global password := "Я понимаю что вместо работы буду заниматся ерундой"
global password := "12345"

global isPause := false


Main_fn() {
	
	StartTime := A_TickCount
	
	loop {
		
		ElapsedTime := A_TickCount - StartTime
		;~ MouseGetPos xpos, ypos 
		;~ Tooltip "Minimized " ElapsedTime, xpos+10, ypos
		
		for key, val in arrayEXE{ 
			if WinGetMinMax("ahk_exe" val) > -1 {
				WinMinimize "ahk_exe" val
				isPause := true
			}
		}
		
		If (isPause = true){
			Pause_fn()
			isPause := false
		}
		
		
		if (ElapsedTime >= 1800000) {
			;~ Tooltip
			break
		}
		
	}
	
	Work_fn()

	loop {
		Main_fn()
	}
		
}

Work_fn() {
	StartTime_Work := A_TickCount
	celiElapsedTime_Work_count := 0
	;~ Tooltip "Worked " celiElapsedTime_Work_new, xpos+10, ypos
		
	loop {
		
		ElapsedTime_Work := A_TickCount - StartTime_Work
		/*	
		MouseGetPos xpos, ypos 
		celiElapsedTime_Work_new := Ceil(ElapsedTime_Work/20)
		if (ElapsedTime_Work <= 5000) {
			
			celiElapsedTime_Work_count := celiElapsedTime_Work_count + 1
			celiElapsedTime_Work_new := Ceil(celiElapsedTime_Work_new/50)
			Tooltip 6 - celiElapsedTime_Work_new, xpos+10, ypos+10
			
		} else if (ElapsedTime_Work >= 355000) {
			celiElapsedTime_Work_count := celiElapsedTime_Work_count + 1
			celiElapsedTime_Work_new := Ceil(celiElapsedTime_Work_new/50)
			Tooltip 361 - celiElapsedTime_Work_new, xpos+10, ypos+10
		} else {
			Tooltip
		}
		*/
		
		ElapsedTime_Work_old := ElapsedTime_Work
		MouseGetPos xpos, ypos 
		celiElapsedTime_Work_new := Ceil(ElapsedTime_Work/20)
		If (celiElapsedTime_Work_new > celiElapsedTime_Work_count) {
			;~ Tooltip 361 - celiElapsedTime_Work_new, xpos+10, ypos
			celiElapsedTime_Work_count := celiElapsedTime_Work_count + 1
			;~ CoordMode "ToolTip"
			celiElapsedTime_Work_new := Ceil(celiElapsedTime_Work_new/50)
			Tooltip 361 - celiElapsedTime_Work_new, xpos+10, ypos+10
			;~ SetTimer () => ToolTip(), -1000
		}
		;~ WinMove ahk_class tooltips_class32, , xpos, ypos
		;~ SetTimer () => ToolTip(), -5000
		
		
		if (ElapsedTime_Work >= 360000) {
			Tooltip
			break
		}
	}
	
}

Pause_fn() {
	StartTime_Pause := A_TickCount
		
	loop {
		
		ElapsedTime_Pause := A_TickCount - StartTime_Pause
		;~ MouseGetPos xpos, ypos 
		;~ Tooltip "Paused " ElapsedTime_Pause, xpos+10, ypos
			
		if (ElapsedTime_Pause >= 10000) {
			;~ Tooltip
			break
		}
	}

}

Work_fn()

Main_fn()
