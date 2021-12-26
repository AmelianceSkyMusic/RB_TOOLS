;# Win   ! Alt   ^ Ctrl   + Shift

; Say(text, time := 1.5, x := 0, y := 0) {

;   ; WinGetPos , , win_x, win_y, "A"
;   if (x && y) {
;     ToolTip text, x, y
;   } else {
;     ToolTip text ;, win_x/2, win_y/2
;   }
;   SetTimer "stop", time * 1000
;   return

;   stop() {
;     ToolTip
;     SetTimer , 0
;     ; SetTimer , "Off"
;   }
; }


Say(text, time := 1.5, x := 0, y := 0, title :=' ') {
    ToolTipGUI := Gui.New("+LastFound +AlwaysOnTop +ToolWindow -Caption", title)
    ToolTipGUI.SetFont(, "MS sans serif")
    ToolTipGUI.SetFont(, "Verdana")
    ToolTipGUI.SetFont("cWhite s18 q3", "Segoe UI Bold")  ; Preferred font.
    ToolTipGUI.Add("Text", "", text)
    ToolTipGUI.BackColor := "27AE60"
    ; WinSetTransColor("FFFFFE 255", ToolTipGUI)
    ; ToolTipGUI.Opt("-Caption")

    ToolTipGUI.Show

    time := time * 1000
    Sleep time
    ToolTipGUI.Destroy
}

Say_OLD(text, time := 1.5, x := 0, y := 0) {

  ; WinGetPos , , win_x, win_y, "A"
  if (x && y) {
    ; ToolTip text, x, y
    ; ToolTip_GUI(text)
  } else {
    ; ToolTip text ;, win_x/2, win_y/2
    ; ToolTip_GUI(text)
  }
  ; SetTimer "stop", time * 1000
  return

  ; stop() {
  ;   ; Gui_Close(MyGui)
  ;   ; myGui_Close(thisGui)
  ;   WinClose "RB [MAIN] Index"
  ;   ToolTipGUI.Destroy

  ;   SetTimer , 0
  ; }
}


;tooltip
  ; say(text := "", time := 1.5, x := 0, y := 0, window := 1) {
  ;   ToolTip text, x or "", y or "", window
  ;   if time != 0
  ;     SetTimer (*) => ToolTip(,,,window), -1000 * time
  ; }



; MyGui := Gui.New()
; MyGui.Opt("+AlwaysOnTop -Caption +ToolWindow")  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
; MyGui.BackColor := "EEAA99"  ; Can be any RGB color (it will be made transparent below).
; MyGui.SetFont("s32")  ; Set a large font size (32-point).
; CoordText := MyGui.Add("Text", "cLime", "XXXXX YYYYY")  ; XX & YY serve to auto-size the window.
; ; Make all pixels of this color transparent and make the text itself translucent (150):
; WinSetTransColor(MyGui.BackColor " 150", MyGui)
; SetTimer(() => UpdateOSD(CoordText), 200)
; UpdateOSD(CoordText)  ; Make the first update immediate rather than waiting for the timer.
; MyGui.Show("x0 y400 NoActivate")  ; NoActivate avoids deactivating the currently active window.

; UpdateOSD(GuiCtrl)
; {
;     MouseGetPos(MouseX, MouseY)
;     GuiCtrl.Value := "X" MouseX ", Y" MouseY
; }


;onscreen display
  osd(text, arg := "") {
    time    := .5
    x       := "Center"
    y       := "Center"
    opacity := 70
    font    := "Roboto"
    size    := 100
    color   := "FFFFFE"
    weight  := "100"
    title   := "blkOsdWnd"

    if Type(arg) = "Object" and ObjOwnPropCount(arg)
      for k,v in arg.OwnProps()
        %k% := v

    SetTimer (*) => onScreenDisplay(text, time, x, y, opacity, font, size, color, weight, title), -1
  }

  onScreenDisplay(
    text,
    time    := 10,
    x       := 0,
    y       := 0,
    opacity := 50,
    font    := "SegoeUI",
    size    := 20,
    color   := "FFFFFE",
    weight  := "100",
    title   := "blkOsdWnd"
  ) {

    (title and WinExist(title)) and WinClose()

    osd := Gui.New("+LastFound +AlwaysOnTop +ToolWindow -Caption", title)
    osd.MarginX := size/2
    osd.MarginY := size/5
    osd.BackColor := 0x000000
    osd.SetFont("c" color " s" size " w" weight " q5", font)
    osd.Add("Text", "+0x80 v&blkOsdCtrlName Center", text) ;0x80 = SS_NOPREFIX -> Ampersand (&) is shown instead of underline one letter for Alt+letter navigation

    WinSetExStyle "+0x20" ;WS_EX_TRANSPARENT -> mouse klickthrough
    opacity := opacity * 255 / 100
    WinSetTransColor "FFFFFF " opacity
    WinRedraw

    osd.Show("x" x " y" y " NoActivate")
    try {
      WinGetPos ,, wW, wH, title
      WinSetRegion("0-0 W" wW " H" wH " R" size/3 "-" size/3, title)
      WinRedraw
    }

    time := time * 1000
    Sleep time
    osd.Destroy
  }

; Можно менять любые параметры, только надо в объект их заключать. Пример: 
; osd "тут текстушка", {opacity: 30, y: A_ScreenHeight - 300}
