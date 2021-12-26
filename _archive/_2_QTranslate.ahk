{ 
vk91::
ActiveWindow := WinGetTitle("A")
Send "^+!{vk49}"
;~ Sleep 100
KeyWait "BS", "D"
Sleep 100
Send "^{vk41}"
;~ Sleep 100
Send "^{vk43}"
Sleep 100
Send "{ESC}"
WinActivate ActiveWindow
;~ Sleep 100
Send "^{vk56}"
return

}

;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;~ SoundPlay "*-1"