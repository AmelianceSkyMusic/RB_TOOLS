;# Win   ! Alt   ^ Ctrl   + Shift

  #SuspendExempt  ; Exempt the following hotkey from Suspend.

  #Esc::{
    Suspend
    if index_ahk.isSuspended {
      Say "Script is OFF",,,,,"WRNNG"
    } else {
      Say "Script is ON"
    }
    index_ahk.isSuspended := !index_ahk.isSuspended
    SoundPlay "*-1, WAIT"
  }
  ; {
  ;   ; WinGetPos(, , &win_x, &win_y, "A")
  ;   SoundPlay "*-1, WAIT"
  ;   if index_ahk.isSuspended {
  ;       Suspend ;"Toggle"
  ;       SoundPlay "*-1, WAIT"
  ;         index_ahk.isSuspended := false
  ;       Say "Script is ON"
  ;   } else {
  ;       Suspend ;"Toggle"
  ;       SoundPlay "*-1, WAIT"
  ;         index_ahk.isSuspended := true
  ;       Say "Script is OFF"
  ;   }
  ; }

  #SuspendExempt False  ; Disable exemption for any hotkeys/hotstrings below this.