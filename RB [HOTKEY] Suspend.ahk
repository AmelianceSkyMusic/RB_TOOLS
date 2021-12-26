;# Win   ! Alt   ^ Ctrl   + Shift

  #SuspendExempt  ; Exempt the following hotkey from Suspend.

  #Esc::
  {
    WinGetPos(, , &win_x, &win_y, "A")
    SoundPlay "*-1, WAIT"
    if (A_IsSuspended){
        Suspend ;"Toggle"
        SoundPlay "*-1, WAIT"
        Say("Script is ON")
    } else {
        Suspend ;"Toggle"
        SoundPlay "*-1, WAIT"
        Say("Script is OFF",,,,,"WRNNG")
    }
  }

  #SuspendExempt False  ; Disable exemption for any hotkeys/hotstrings below this.