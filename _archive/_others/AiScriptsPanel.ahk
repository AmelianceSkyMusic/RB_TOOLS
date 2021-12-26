class AiScriptsPanel {
  __New(
    folder,
    title                     := "AI Scripts",
    parentTitle               := "ahk_exe Illustrator.exe",
    editor                    := "notepad",
    bg                        := "Default",
    fg                        := "Default",
    width                     := 180,
    height                    := 300,
    caption                   := "F4 - edit, F5 - refresh",
    captionHeight             := 25
  ) {

    if DirExist(folder)
      this.Folder := folder
    else {
      MsgBox ("Script folder not found:`n" folder "`n`n" A_LineFile " #" A_LineNumber), "Error", "Iconx "
      return
    }

    this.Title                := title
    this.Editor               := editor
    this.Visible              := false
    this.Height               := height
    this.ParentTitle          := parentTitle
    this.CaptionHeight        := captionHeight

    this.Win := Gui("+Resize -0x30000 +MinSize140 ", title)
    this.Win.BackColor := bg
    ;this.Input := this.Win.Add("Edit", "x0 y0 r1 w250 -Border Background" bg " c" fg)

    ;set icons
    ImageListID := IL_Create(3)
    IL_Add(ImageListID, "shell32.dll", 4) ;folder

    iconPath := ""
    SplitPath A_LineFile,, &iconPath
    if FileExist(iconPath "\icon_js.png") and FileExist(iconPath "\icon_jsx.png") {
      IL_Add(ImageListID, iconPath "\icon_js.png") ;script.js
      IL_Add(ImageListID, iconPath "\icon_jsx.png") ;script.jsx
    } else {
      IL_Add(ImageListID, "shell32.dll", 1) ;script.js
      IL_Add(ImageListID, "shell32.dll", 73) ;script.jsx
    }

    this.Win.Add("Text", "x10 y5 c" fg, caption)
    this.Tree := this.Win.Add("TreeView", "x0 y+0 r30 h" height " w" width " -E0x200 -HScroll Background" bg " c" fg " ImageList" ImageListID) ;-Lines
    SendMessage(TVM_SETITEMHEIGHT := 0x111B, 18, 0, this.Tree.Hwnd) ;set row height to 18px
    _ := 1
    SendMessage(WM_SETICON := 0x80, 0, LoadPicture("shell32.dll", "Icon301", &_),, this.Win.Hwnd) ;set window icon
    this.Tree.Opt("")
    this.List := Map()
    this.Refresh()
    this.Tree.Focus()

    this.Win.Add("Button", "Default hidden ", "OK").OnEvent("Click", ObjBindMethod(this, "_Enter"))

    ;set events
    this.Win.OnEvent("Close", ObjBindMethod(this, "Hide"))
    this.Win.OnEvent("Escape", ObjBindMethod(this, "Hide"))
    this.Win.OnEvent("Size", ObjBindMethod(this, "_Size"))
    this.Tree.OnEvent("DoubleClick", ObjBindMethod(this, "_Click"))

    ;set hotkeys
    HotIfWinActive(this.Title " ahk_class AutoHotkeyGUI")
    Hotkey "Space"            , (*) => Send("{Enter}")
    Hotkey "RButton"          , (*) => Send("{Enter}")
    Hotkey "^WheelUp"         , (*) => Send("{Up}")
    Hotkey "^WheelDown"       , (*) => Send("{Down}")
    Hotkey "^+WheelUp"        , (*) => Send("{Up 5}")
    Hotkey "^+WheelDown"      , (*) => Send("{Down 5}")
    Hotkey "F4"               , ObjBindMethod(this, "Edit")
    Hotkey "F5"               , ObjBindMethod(this, "Refresh")
  }

  _AddSubfolder(TV, Folder, DirList, ParentItemID := 0) {
    loop Files, Folder "\*.*", "D" {
      if A_LoopFileAttrib ~= "[HS]"
        Continue
      ItemID := TV.Add(A_LoopFileName, ParentItemID, "Icon1")
      DirList[ItemID] := A_LoopFilePath
      DirList := this._AddSubfolder(TV, A_LoopFilePath, DirList, ItemID)
    }

    loop Files, Folder "\*.js?", "F" {
      if not A_LoopFileAttrib ~= "[HS]" and (A_LoopFileExt = "js" or A_LoopFileExt = "jsx") { ;skip hidden and system files
        ext := name := ""
        SplitPath A_LoopFileName,,, &ext, &name
        ItemID := TV.Add(name, ParentItemID, (ext = "js")? "Icon2" : "Icon3")
        DirList[ItemID] := A_LoopFilePath
      }
    }
    return DirList
  }

  _Click(Tree, item) {
    if not InStr(FileGetAttrib(this.List[item]), "D")
      this._Run(item)
  }

  _Enter(*) {
    if this.Win.FocusedCtrl = this.Tree {
      item := this.Tree.GetSelection()
      if InStr(FileGetAttrib(this.List[item]), "D")
        this.Tree.Modify(item, (this.Tree.Get(item, "Expanded") = item ? "-" : "") "Expand")
      else
        this._Run(item)
    }
  }

  _Run(item) {
    Run '"' WinGetProcessPath(this.ParentTitle) '" "' this.List[item] '"',, "max"
  }

  _Size(_, fold, width, height) {
    if fold = -1
      return
    this.Tree.Move(0, this.CaptionHeight, width, height - this.CaptionHeight)
    WinGetPos ,,, &height, this.Win ;&height?
  }

  Edit(*) {
    item := this.Tree.GetSelection()
    if item {
      if InStr(FileGetAttrib(this.List[item]), "D")
        this.Tree.Modify(item, (this.Tree.Get(item, "Expanded") = item ? "-" : "") "Expand")
      else {
        try Run '"' this.Editor '" "' this.List[item] '"'
        catch Any
          Run '"notepad.exe" "' this.List[item] '"'

        return "edit '" this.List[item] "'"
      }
    }
  }

  Hide(*) {
    this.Win.Hide()
    this.Visible := false
    return "hide '" this.Title "'"
  }

  Refresh(*) {
    for k,v in this.List
      this.Tree.Delete(k)
    this.List := this._AddSubfolder(this.Tree, this.Folder, Map())
  }

  Show(*) {
    if parentHwnd := WinActive(this.ParentTitle)
      this.Win.Opt("+Owner" parentHwnd)
    SetTimer () => (this.Win.Show(), this.Tree.Focus()), -100
    this.Visible := true
    Sleep 200
    return "show '" this.Title "'"
  }

  Toggle(*) {
    return (this.Visible)? this.Hide() : this.Show()
  }
}
