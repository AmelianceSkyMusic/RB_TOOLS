﻿{
;~ +Home::
;~ #vk41:: ;Win+A

global sepatator := ". "

#q:: ;Win+q
global sepatator := InputBox("Please enter separator", "Separator", "w300 h130", sepatator)
return

#a:: ;Win+A
;~ Send "^{vk43}" ;~ Ctrl+C
;~ sleep 200
;~ global main_varible := Clipboard
;~ first_varible_backup := first_varible
global first_varible := InputBox("Please enter 1st varible", "1st varible", "w300 h130", first_varible)
global second_varible := 1
global third_varible := 1
;~ if ErrorLevel  first_varible := first_varible_backup
;~ global main_varible := 1
;~ MsgBox main_varible
return

;~ #vk53:: ;Win+S
#s:: ;Win+S
;~ Send "^{vk43}" ;~ Ctrl+C
;~ sleep 200
;~ global second_varible := Clipboard
;~ second_varible_backup := second_varible
global second_varible := InputBox("Please enter 2nd varible", "2nd varible", "w300 h130", second_varible)
global third_varible := 1
;~ if ErrorLevel  second_varible := second_varible_backup
;~ global second_varible := 1
;~ MsgBox main_varible
return

;~ #vk44:: ;Win+D
#d:: ;Win+D
;~ Send "^{vk43}" ;~ Ctrl+C
;~ sleep 200
;~ global third_varible := Clipboard
;~ third_varible_backup := second_varible
global third_varible := InputBox("Please enter 3rd varible", "3rd varible", "w300 h130", third_varible)
;~ if ErrorLevel  second_varible := third_varible_backup
;~ global third_varible := 1
;~ MsgBox main_varible
return


;~ #vk46:: ;Win+F
#f:: ;Win+F
if (third_varible >= 0) {
	Clipboard := first_varible sepatator second_varible sepatator third_varible sepatator
	third_varible++
} else if (second_varible >= 0 ) {
	Clipboard := first_varible ". " second_varible ". "
	second_varible++
} else if (first_varible >= 0 ) {
	Clipboard := first_varible ". "
	first_varible++
}

;~ second_varible++
;~ MsgBox main_varible
Send "{F2}"
Send "^{Home}"
Send "^{vk56}"
Send "{Tab}"
return

;~ #vk46:: ;Win+F
!LButton::
#r:: ;Win+F
if (third_varible >= 0) {
	Clipboard := first_varible sepatator second_varible sepatator third_varible sepatator
	third_varible++
} else if (second_varible >= 0 ) {
	Clipboard := first_varible sepatator second_varible sepatator
	second_varible++
} else if (first_varible >= 0 ) {
	Clipboard := first_varible sepatator
	first_varible++
}

MouseGetPos x_mouse, y_mouse
MouseClick left, x_mouse, y_mouse, 2, 1
Sleep 100
Send "^a"
Send "^v"
return

+End::
Send "{F2}"
Send "{End}"
Send "^V"
Send "{Tab}"
return

+Home::
Send "{Tab}"
Send "^{Home}"
Send "^{v}"
return

#F2::
Send "{F2}"
Send "^{Home}"
;~ Send "{Right}"
;~ Send "{Right}"
Send "{Del}"
Send "{Del}"
Send "{Del}"
Send "{Tab}"
return

^F2::
loop_end_del := InputBox("How many files?", "How many files", "w300 h130", 1)
loop loop_end_del{
Send "{F2}"
Send "^{End}"
;~ Send "{Right}"
;~ Send "{Right}"
loop 10{
	Send "{Backspace}"
}
Sleep 100

Send "{Tab}"
}
Send "{Esc}"
return
}
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"