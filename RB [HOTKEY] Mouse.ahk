;# Win   ! Alt   ^ Ctrl   + Shift

  ~LButton::
  {
    ; Send "{LButton}"
    if tr.mouseClickSoundState != false {
      SoundPlay "Media_files\left_mouse_click.mp3", -1000
    }
  }

  ~RButton::
  {
    ; Send "{LButton}"
    ; master_volume := SoundGetVolume()
    ; SoundSetVolume -40
    if tr.mouseClickSoundState != false {
      SoundPlay "Media_files\right_mouse_click.mp3", -1000
    }
    ; SoundSetVolume master_volume  ; Set the master volume to 50%
  }

  ~MButton::
  {
    ; Send "{LButton}"
    if tr.mouseClickSoundState != false {
      SoundPlay "Media_files\mouse_click.mp3", -1000
    }
  }

; ^XButton2::SoundPlay A_WinDir "\Media_files\mouse_click.mp3"

#HotIf WinActive("ahk_exe explorer.exe")
XButton1::Send "!{UP}"

#HotIf WinActive("ahk_exe TOTALCMD64.exe")
XButton1::Send "{BACKSPACE}"

#HotIf WinActive("ahk_exe doublecmd.exe")
XButton1::Send "{BACKSPACE}"

#HotIf WinActive("ahk_exe OneCommander.exe")
XButton1::Send "!{UP}"

#HotIf WinActive("ahk_class #32770")
XButton1::Send "!{UP}"

#HotIf WinActive("ahk_exe sharex.exe")
XButton1::Send "{Enter}"

#HotIf WinActive("ahk_exe Studio One.exe")
XButton1::Send "{LButton}{Del}"


#HotIf
XButton1::Send "{PrintScreen}"

XButton2::Click 2

!XButton2::
{
  Send "!{Click 2}"
}

; +XButton1::Send "^+z"
; +XButton2::Send "^z"

^XButton1::Send "^C"
^XButton2::Send "^v"

+MButton::Send "+{enter}"

^MButton::Send "{enter}"


; #HotIf !GetKeyState("CapsLock", "T")
; {
;   XButton1::Say "1"
;   XButton2::Say "2"
; }

; #HotIf !GetKeyState("NumLock", "T")
; {
;   XButton1::Say "3"
;   XButton2::Say "4"
; }

#HotIf GetKeyState("ScrollLock", "T")
{
  XButton1::Send("!{Tab}")
  XButton2::Send("+!{Tab}")
}




#HotIf WinActive("ahk_exe chrome.exe")
XButton1::{
  ; Send "^+3"
  Send "{Click 3}"
  Sleep 200
  Send "^+h"
}

~LButton & RButton::
{
    Send "{Enter}"
}


; CapsLock & ~LButton:: Send("{Blind}{Left}")
; CapsLock & ~RButton:: Send("{Blind}{Right}")
; CapsLock & ~WheelUp:: Send("{Blind}{Up}")
; CapsLock & ~WheelDown:: Send("{Blind}{Down}")
