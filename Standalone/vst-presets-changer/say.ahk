;# Win   ! Alt   ^ Ctrl   + Shift



Say(text := "Say", time := 1, x := 0, y := 0, title :='ToolTipGUI', state := "NRML") {
    oldWindowActive := WinGetID(,,"A")
    ; MsgBox "The active window's class is " WinGetClass("A")
  ; SetTimer (*) => Say_FC(text, time, x, y, title), -1
  ; Say_FC(text, time, x, y, title){
    Switch state
    {
        Case "NRML": color := "27AE60" ;-- green
        Case "ERR": color :="AE3030"
        Case "WRNNG": color :="BD832B"
    }

    winTitle := WinGetTitle(,,"A")

    ToolTipGUI := Gui("+LastFound +AlwaysOnTop +ToolWindow -Caption", title)

    ; ToolTipGUI.SetFont(, "MS sans serif")
    ; ToolTipGUI.SetFont(, "Verdana")
    ToolTipGUI.SetFont("cWhite s14 q5 w700", "Segoe UI Bold")  ; Preferred font.
    ToolTipGUI.Add("Text", "", text)
    ToolTipGUI.BackColor := color ;-- green
    ; WinSetTransColor("FFFFFE 255", ToolTipGUI)"xCenter y" winHeight)
    ; ToolTipGUI.Opt("-Caption")
    winHeight := A_ScreenHeight-A_ScreenHeight/5
    ToolTipGUI.Show("xCenter y" winHeight)
    WinGetPos(&winX, &winY, &winWidth, &winHeight, title)
    WinSetRegion("0-0 w" winWidth " h" winHeight " r24-24", title)

    ; time := time * 5000
    ; Sleep time
    ; ToolTipGUI.Destroy

    destroyToolTipGUI(ToolTipGUI) {
        ToolTipGUI.Destroy
        WinActivate("ahk_id" oldWindowActive)
        ; SetTimer ,0
    }
    SetTimer (*) => destroyToolTipGUI(ToolTipGUI), time * -1000
    WinExist(,,"A")
    WinActivate(,,winTitle)
    

    ; WinActivate("ID " oldActiveWindow)
    
}


Msg(text, time := 1, x := -1, y := -1) {
  ; CoordMode "ToolTip", "Screen"
    if x > -1 && y > -1 {
      xpos := x
      ypos := y
    } else {
      MouseGetPos(&xpos, &ypos)
      xpos := xpos+15
      ypos := ypos+10
    }

    ToolTip(text, xpos, ypos)

    ; time := time * 5000
    ; Sleep time
    ; ToolTip
    SetTimer Tooltip, time * -1000

}




/* 
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
  } */
/* 
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
  } */

; Можно менять любые параметры, только надо в объект их заключать. Пример: 
; osd "тут текстушка", {opacity: 30, y: A_ScreenHeight - 300}
