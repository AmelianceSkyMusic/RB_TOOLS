;# Win   ! Alt   ^ Ctrl   + Shift
fullscreen_is := false

#f:: ; Win+F  - fullscreen
  {
    global fullscreen_is
    if fullscreen_is = false {

      global handle := DllCall("GetMenu", "Ptr", WinActive("A"))
      DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", 0)

      WinSetStyle "-0xC00000", "A"

      fullscreen_is := true
      return  

    } else {

      DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", handle)

      WinSetStyle "+0xC00000", "A"

      fullscreen_is := false

      return
      
    }

  }


; fullscreen_is := handle := 0

; #f:: { ;fullscreen
;   global fullscreen_is, handle := (fullscreen_is := !fullscreen_is)? DllCall("GetMenu", "Ptr", WinActive("A")) : 0
;   DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", handle)
;   WinSetStyle (fullscreen_is? "+" : "-") "0xC00000", "A"
; }



; fullscreen_is := false

; #f:: { ;fullscreen
;   global fullscreen_is
;   if fullscreen_is = false {
;     global handle := DllCall("GetMenu", "Ptr", WinActive("A"))
;     DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", 0)
;     WinSetStyle "-0xC00000", "A"
;     fullscreen_is := true
;   } else {
;     DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", handle)
;     WinSetStyle "+0xC00000", "A"
;     fullscreen_is := false
;   }
; }





; global fullscreen_is := false
; global win_x, win_y, win_w, win_h
; DetectHiddenWindows 1
; {
;   #f:: ; Win+F  - fullscreen
;   {
;     if fullscreen_is = false {

;       ; handleMenu := DllCall("GetMenu", "Ptr", WinActive("A"))
;       ; ----- HIDE MENU -----
;       ; global handle := DllCall("GetMenu", "Ptr", WinActive("A"))
;       ; DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", 0)

;       ; ----- HIDE NAME BAR -----
;       ; WinSetStyle "-0x1c00000", "A" ; ----bordersline
;       ; ~ WinSet, Style, -0x1c00000,  ;CAPTION|DLGFRAME|MAXIMIZE
;             WinSetStyle "+0x40000", "A"

;       WinGetPos win_x, win_y, win_w, win_h, "A"

;       WinWaitActive "A"
;       WinMove 0, -50, A_ScreenWidth, A_ScreenHeight+50

;       ; WinSetStyle "-0xC00000", "A"




;       ; WinSetStyle "-0x400000", "A"
;       ; WinSetStyle "-0x800000", "A"
;       ; WinSetStyle "-0x10000", "A"
;       ; WinSetStyle "-0xCF0000", "A"

;       ; WinSetStyle "-0x80000", "A"
;       ; WinSetExStyle "-0x80", "A"

;       ; WinMaximize
;       fullscreen_is := true
;       return  

;     } else {

;       ; ; ----- HIDE MENU -----
;       ; handleMenu := DllCall("GetMenu", "Ptr", WinActive("A"))
;       ; DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", handleMenu)
;       ; DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", handle)
;       ; ; ----- SHOW NAME BAR -----
;       ; WinSetStyle "+0x1c00000", "A" ; ++++bordersline
;       ; ; ~ WinSet, Style, +0x1c00000,  ;CAPTION|DLGFRAME|MAXIMIZE
;       ; WinSetStyle "+0xC00000", "A"

;       ; WinGetPos win_x, win_y, win_w, win_h, "A"

;       WinWaitActive "A"
;       WinMove win_x,  win_y+30, win_w, win_h-30
      





;       ; WinSetStyle "+0x400000", "A"
;       ; WinSetStyle "+0x800000", "A"
;       ; WinSetStyle "+0x10000", "A"
;       ; WinSetStyle "+0xCF0000", "A"
      
;       WinSetStyle "-0x40000", "A"

;       fullscreen_is := false

;       ; WinRestore
;       return
      
;     }
;     ;~ WinSetStyle "^0x400000", "A" ; bordersline

;     ;~ WinSetStyle "^0xC00000", "A"
;     ;~ WinSetStyle "^0x80000", "A" ; Icon in Title
;     ;~ WinSetStyle "^0x40000", "A" ; Size change lines
;     ;~ WinSetStyle "^0x20000000", "A" ; Size change lines
;   }
; }




; #+f::toggleWinZen

; toggleWinZen() {
;   static MenuArray := Map()
;   if id := WinExist("A") {
;     WinSetStyle "^" 0xC00000, "A"
    
;     if MenuArray.Has(id) { ;exit zen
;       state := MenuArray[id].state 
;       menu := MenuArray[id].menu 
;       MenuArray.Delete(id)
;       WinRestore
;       if state
;         WinMaximize
;     } else { ;enter zen
;       menu := 0
;       state := WinGetMinMax()
;       MenuArray[id] := {menu: DllCall("GetMenu", "uInt", id), state: state}
;       if state 
;         WinRestore
;       WinMaximize
;     }

;     DllCall("SetMenu", "uInt", id, "uInt", menu)    
;   }
; }