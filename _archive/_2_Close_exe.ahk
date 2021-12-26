;# Win   ! Alt   ^ Ctrl   + Shift; AHK2

#NoTrayIcon
A_TrayMenu.delete() ; Delete all menu
;~ A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Pause", "PauseScript")  ; Creates a new menu item.
A_TrayMenu.Add("Exit", "ExitScript")  ; Creates a new menu item.
;~ A_TrayMenu.SetIcon("Exit", "reaper.ico")
;~ return

!x::{
	; MsgBox("Exit?","Exit", 0)
	; ExitApp
}

	; if ProcessExist("Taskmgr.exe"){
	; 	ProcessClose("Taskmgr.exe")
	; 	MsgBox("Fatal Error", , 16)
	; }
	


	global arrayEXE := [ "Studio One.exe", "Chrome.exe", "Telegram.exe", "Viber.exe", "Firefox.exe", "Tor.exe", "Opera.exe"]
	global arrayEXEClose := []
	global password := "12345"


PauseScript(ItemName, ItemPos, Menu) {
	isPassword := InputBox("Enter password:", "CLOSE EXE",  "password w150 h130").value
	if (isPassword = password) {
		MsgBox "Program is paused!"
		Pause
	} else {
		MsgBox "WRONG PASSWORD"
	}
}
	
ExitScript(ItemName, ItemPos, Menu) {
	isPassword := InputBox("Enter password:", "CLOSE EXE",  "password w150 h130").value
	if (isPassword = password){
		MsgBox "Program is Exit!"
		ExitApp
	} else {
		MsgBox "WRONG PASSWORD"
	}

}



;----------------------------------------------------------------------
;----------------------------------------------------------------------
;----------------------------------------------------------------------


	global programIWaitToClose := false
	global programsName := ""
	global programIsOpen := true
	global programIWaitToCloseTEMP := false

Main(){

	; global arrayEXE := [ "Studio One.exe", "Chrome.exe", "Telegram.exe", "Viber.exe", "Firefox.exe", "Tor.exe", "Opera.exe"]
	; global password := "12345"
	; global programIWaitToClose := false
	; global programIsOpen
	; global programsName := ""

	programsName := ""


	
	; MsgBox arrayEXE.Length
	; ----- Do loop form array lenght
	Loop arrayEXE.Length { 
		; MsgBox(arrayEXE[A_Index])
		if (ProcessExist(arrayEXE[A_Index]) and programIWaitToClose = false)
		{
			; MsgBox("")
			programIsOpen := true
			programIWaitToCloseTEMP := true
			programsName := programsName "`n" arrayEXE[A_Index]
			; arrayEXEClose

			
		}
		; MsgBox programsName
		
	}

	if programIWaitToCloseTEMP = true {
		programIWaitToClose := true
		programIWaitToCloseTEMP := false
					; MsgBox programsName
	}

	if (programIsOpen and programIWaitToClose) {
		; MsgBox("gg")
		SetTimer "CloseEXE", 6000 ;60 sec
		; MsgBox "We will close some programs after 1 minutes!:" programsName
	}

	CloseEXE(){
			Loop arrayEXE.Length { 
			ProcessClose(arrayEXE[A_Index])
			; MsgBox("arrayEXE[A_Index]")
		}
		programIWaitToClose := false
	}
	if ProcessExist("Taskmgr.exe"){
		ProcessClose("Taskmgr.exe")
		MsgBox("cc" , "Task Manager Error", 16) ;FATAL ERROR`n`nTask Manager is stopped`n`nComponent `"TASKMNG.EXE`" or one of its components is corrupted or invalid`n`nError code: 0x800F9379992", "Task Manager Error
	}
	SetTimer "Main", 1000 ;1 sec
}

Main()



;----------------------------------------------------------------------
;----------------------------------------------------------------------
;----------------------------------------------------------------------

;~ SetTimer "EXE_Cycle", 1800
;~ EXE_Cycle(){
	;~ SoundPlay "*16, WAIT"
	;~ Close_exe(arrayEXE[1])
	;~ Close_exe(arrayEXE[2])
	
	;~ if MsgBox("������ ������ ����!!!", "���� �������?", "R/C  0x40000") = "Cancel" {
		;~ SoundPlay "*-1, WAIT"
	;~ ExitApp
;~ } else {
	;~ SoundPlay "*-1, WAIT"
	;~ SetTimer "EXE_Cycle", 1800
;~ }
;~ return
	
;~ }


	



;~ Close_exe(program_exe){	
	
	;~ ProcessClose program_exe

;~ }