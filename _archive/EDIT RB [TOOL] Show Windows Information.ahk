;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance ignore 
SetKeyDelay -1

!Esc::Reload 

#include RB [FUNCTION] Say.ahk
; Say "SCRIPTS ARE LOADED"
Say("TEST LOADED", 0.4)

;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------

; MyGui := Gui.New()
; MyGui.Add("Text",, "Enter some Text and press Submit:")
; MyGui.Add("Edit", "vMyEdit")
; MyGui.Add("Button",, "Submit").OnEvent("Click", "Submit")
; MyGui.Show

; Submit(Btn, *)
; {
;     Saved := Btn.Gui.Submit(false)
;     MsgBox "Content of the edit control: " Saved.MyEdit
; }



newLine := "`n"
dispText := ""
disp := []
disp.push("Width: `n" A_ScreenWidth "px")
disp.push("Height: `n" A_ScreenHeight "px")
disp.push("Screen: `n" A_ScreenDPI "dpi")
disp.push("A_IsAdmin: `n" A_IsAdmin)
disp.push("MyDocuments folder: `n" A_MyDocuments)
disp.push("StartupCommon (The full path and name of the Startup folder in the all-users Start Menu): `n" A_StartupCommon)
disp.push("Is64bitOS (1 — x64, 0 — x86): `n" A_Is64bitOS)
; newLine := ": " newLine
; newLine := ": " newLine
; newLine := ": " newLine
; newLine := ": " newLine

loop disp.Length{
    dispText := dispText disp[A_Index] newLine newLine
}

MsgBox(dispText)
; ; Create the popup menu by adding some items to it.

; ; global MMenu := [Menu.New()]  ↓↓↓↓↓↓↓
; global MMenu := [] 
; MMenu.InsertAt(1, Menu.New()) ;same ↑↑↑↑↑↑↑

; MMenu[1].Add("Item 1", "MenuHandler")
; MMenu[1].Add("Item 2", "MenuHandler")
; MMenu[1].Add()  ; Add a separator line.

; ; Create another menu destined to become a submenu of the above menu.
; ; MMenu[2] := Menu.New()
; MMenu.InsertAt(2, Menu.New())
; MMenu[2].Add("Item A", "MenuHandler")
; MMenu[2].Add("Item B", "MenuHandler")

; ; result[prev.sub].add(prev.title, result[sub]) ;set submenu parent

; ; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
; MMenu[1].Add("My Submenu", MMenu[2])

; MMenu[1].Add()  ; Add a separator line below the submenu.
; MMenu[1].Add("Item 3", "MenuHandler")  ; Add another menu item beneath the submenu.

; MenuHandler(Item, *) {
;     MsgBox "You selected " Item
; }

; #z::MMenu[1].Show()  ; i.e. press the Win-Z hotkey to show the menu.