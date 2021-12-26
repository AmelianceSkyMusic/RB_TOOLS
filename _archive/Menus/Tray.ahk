; ;# Win   ! Alt   ^ Ctrl   + Shift

; ; #HotIf

tr := {}
tr.mouseClickSoundState := false

tr.tray := A_TrayMenu ; For convenience.
tr.tray.delete ; Delete the standard items.
tr.tray.add("Click Sound", mouseClickSound)
tr.tray.add
tr.tray.add
tr.tray.add
tr.tray.addStandard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



mouseClickSound(*) {
    tr.mouseClickSoundState := !tr.mouseClickSoundState
    tr.tray.ToggleCheck "Click Sound"        
}

; TestToggleCheck(*)
; {
;     tr.tray.ToggleCheck "TestToggleCheck"
;     Msg("TestToggleCheck")
;     ; tr.tray.Enable "TestToggleEnable" ; Also enables the next test since it can't undo the disabling of itself.
;     tr.tray.add "TestDelete", "TestDelete" ; Similar to above.
; }

; TestToggleEnable(*)
; {
;     tr.tray.ToggleEnable "TestToggleEnable"
; }

; TestDefault(*)
; {
;     if tr.tray.default = "TestDefault"
;         tr.tray.default := ""
;     else
;         tr.tray.default := "TestDefault"
; }

; TestAddStandard(*)
; {
;     tr.tray.addStandard
; }

; TestDelete(*)
; {
;     tr.tray.delete "TestDelete"
; }

; TestDeleteAll(*)
; {
;     tr.tray.delete
;     MsgBox "The script may exit now, as the tray menu no longer contains custom items."
; }

; TestRename(*)
; {
;     static OldName := "", NewName := ""
;     if NewName != "renamed"
;     {
;         OldName := "TestRename"
;         NewName := "renamed"
;     }
;     else
;     {
;         OldName := "renamed"
;         NewName := "TestRename"
;     }
;     tr.tray.rename OldName, NewName
; }

; Test(Item, *)
; {
;     MsgBox 'You selected "' Item '"'
; }





; MyMenu.Add "Item 1", "MenuHandler"
; MyMenu.Add "Item 2", "MenuHandler"
; MyMenu.Add  ; Add a separator line.

; ; Create another menu destined to become a submenu of the above menu.
; Submenu1 := Menu.New()
; Submenu1.Add "Item A", "MenuHandler"
; Submenu1.Add "Item B", "MenuHandler"

; ; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
; MyMenu.Add "My Submenu", Submenu1

; MyMenu.Add  ; Add a separator line below the submenu.
; MyMenu.Add "Item 3", "MenuHandler" 
