Class AiScriptsPanel {
  __New(
      folder,
      title        := "AI Scripts",
      parentTitle  := "ahk_exe Illustrator.exe",
      editor       := "notepad",
      bg           := "Default",
      fg           := "Default",
      width        := 180,
      height       := 300,
      caption      := "F4 - edit, F5 - refresh"
    ) {
    if DirExist(folder)
      this.Folder := folder
    else {
      say "error: script folder not found"
      return
    }

    this.Title         := title
    this.Editor        := editor
    this.Visible       := false
    this.Height        := height
    this.ParentTitle   := parentTitle
    this.CaptionHeight := 25

    this.Win := Gui.New("+Resize -0x30000 +MinSize140", title)
    this.Win.BackColor := bg
    ;this.Input := this.Win.Add("Edit", "x0 y0 r1 w250 -Border Background" bg " c" fg)

    ;set icons
    ImageListID := IL_Create(3)
    IL_Add(ImageListID, "shell32.dll", 4) ;folder

    SplitPath(A_LineFile,, &iconPath)
    if FileExist(iconPath "\icon_js.png") and FileExist(iconPath "\icon_jsx.png") {
      IL_Add(ImageListID, iconPath "\icon_js.png") ;script.js
      IL_Add(ImageListID, iconPath "\icon_jsx.png") ;script.jsx
    } else {
      IL_Add(ImageListID, "shell32.dll", 1) ;script.js
      IL_Add(ImageListID, "shell32.dll", 73) ;script.jsx
    }

    this.Fold := this.Win.Add("Button", "x7 y4 w13 h16", "·")
    this.Win.Add("Text", "x25 y5 c" fg, caption)
    this.Tree := this.Win.Add("TreeView", "x0 y+0 r30 h" height " w" width " -HScroll +Lines Background" bg " c" fg " ImageList" ImageListID)
    TVM_SETITEMHEIGHT := 0x111B
    SendMessage(TVM_SETITEMHEIGHT, 18, 0, this.Tree.Hwnd) ;set row height to 18px
    this.List := Map()
    this.Refresh()
    this.Tree.Focus()

    this.Win.Add("Button", "Default Hidden", "OK").OnEvent("Click", ObjBindMethod(this, "_Enter"))

    ;set events
    this.Win.OnEvent("Close", ObjBindMethod(this, "Hide"))
    this.Win.OnEvent("Escape", ObjBindMethod(this, "Hide"))
    this.Win.OnEvent("Size", ObjBindMethod(this, "_Size"))
    this.Fold.OnEvent("Click", ObjBindMethod(this, "_Fold"))
    this.Tree.OnEvent("DoubleClick", ObjBindMethod(this, "_Click"))

    ;set hotkeys
    HotIfWinActive(this.Title " ahk_class AutoHotkeyGUI")
    Hotkey "RButton", (*) => Send("{Enter}")
    ; Hotkey "Space", (*) => doubleTap()? (WinGetPos(X, Y, W, H), WinMove(A_ScreenWidth - W - 150, A_ScreenHeight - H * 1.2)) : Send("{Space}")
    ; Hotkey "Space", (*) => WinGetPos(X, Y, W, H), WinMove(A_ScreenWidth - W - 150, A_ScreenHeight - H * 1.2)
    Hotkey "WheelUp", (*) => Send("{Up}")
    Hotkey "WheelDown", (*) => Send("{Down}")
    Hotkey "+WheelUp", (*) => Send("{Up 5}")
    Hotkey "+WheelDown", (*) => Send("{Down 5}")
    Hotkey "F4", ObjBindMethod(this, "Edit")
    Hotkey "F5", ObjBindMethod(this, "Refresh")
  }

  _AddSubfolder(TV, Folder, DirList, ParentItemID := 0) {
    loop Files, Folder "\*.*", "D" {
      if A_LoopFileAttrib ~= "[HS]" {
        Continue
      }
      ItemID := TV.Add(A_LoopFileName, ParentItemID, "Icon1")
      DirList[ItemID] := A_LoopFilePath
      DirList := this._AddSubfolder(TV, A_LoopFilePath, DirList, ItemID)
    }

    loop Files, Folder "\*.js?", "F" {
      if not A_LoopFileAttrib ~= "[HS]" { ;skip hidden and system files
        SplitPath(A_LoopFilePath,,,ext)
        icon := (ext = "js")? "Icon2" : "Icon3"
        ItemID := TV.Add(RegexReplace(A_LoopFileName, "\.jsx?$", ""), ParentItemID, icon)
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

  _Fold(*) {
    WinGetPos(,,, activeHeight, this.Win)
    this.Win.Move(,,, (activeHeight = 60)? this.Height : 60)
    this.Height := activeHeight
  }

  _Run(item) {
    Run '"' WinGetProcessPath("ahk_exe Illustrator.exe") '" "' this.List[item] '"',, "max"
  }

  _Size(_, fold, width, height) {
    if fold = -1
      return
    this.Tree.Move(0, this.CaptionHeight, width, height - this.CaptionHeight)
    WinGetPos(,,,height, this.Win)
  }

  Edit(*) {
    item := this.Tree.GetSelection()
    if InStr(FileGetAttrib(this.List[item]), "D")
      this.Tree.Modify(item, (this.Tree.Get(item, "Expanded") = item ? "-" : "") "Expand")
    else if this.Editor {
      Run '"' this.Editor '" "' this.List[item] '"',, "max"
      return "edit '" this.List[item] "'"
    }
  }

  Hide(*) {
    this.Win.Hide()
    this.Visible := false
  }

  Refresh(*) {
    for k,v in this.List
      this.Tree.Delete(k)
    this.List := this._AddSubfolder(this.Tree, this.Folder, Map())
  }

  Show(*) {
    if parentHwnd := WinActive(this.ParentTitle)
      this.Win.Opt("+Owner" parentHwnd)
    SetTimer (*) => (this.Win.Show(), this.Tree.Focus()), -100
    this.Visible := true
  }

  Toggle(*) {
    (this.Visible)? this.Hide() : this.Show()
  }
}




;remove modifiers from hotkey
  ; modsTrim(key) {
  ;   return RegExReplace(RegExReplace(key, "^.*?(\S*?)( up)*$", "$1"), "^[~#!<>\^\+\*\$]*", "")
  ; }

; ;check double tap
;   doubleTap(key := "") {
;     if not key
;       key := modsTrim(A_ThisHotkey)
;     KeyWait Key
;     Sleep 10
;     return KeyWait(key, "D T.1")
;   }

