;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance ignore 
SetKeyDelay -1

!Esc::Reload 

#include ../../RB [FUNCTION] Say.ahk
; Say "SCRIPTS ARE LOADED"
Say("SCRIPTS ARE LOADED", 0.4)

;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------

; interfaceScale := "90"
; global img_path := "Figma_files\img" "_" interfaceScale "\"

; figmaInterfaceScale := Gui.New()

; figmaInterfaceScale.MarginX := 16
; figmaInterfaceScale.MarginY := 16

; figmaInterfaceScale.Add("Text", "cCCCCCC section", "Figma scale (%):")  ; Save this control's position and start a new section.
; figmaInterfaceScale.Add("Edit", "vchangedInterfaceScale section ys").value := interfaceScale  ; Start a new column within this section.

; btnOk := figmaInterfaceScale.Add("Button", "default w212 xm hp", "Set Scale")  ; xm puts it at the bottom left corner.
; btnOk.OnEvent("Click", (*) => changeFolder(figmaInterfaceScale))

; figmaInterfaceScale.OnEvent("Close", "ProcessUserExit")
; figmaInterfaceScale.OnEvent("Escape", "ProcessUserExit")

; figmaInterfaceScale.BackColor := "333333"
; figmaInterfaceScale.Title := "Figma Interface Scale"
; figmaInterfaceScale.Opt("ToolWindow")
; figmaInterfaceScale.Opt("+E0x40000")
; figmaInterfaceScale.Show()
; WinSetAlwaysOnTop true, "Figma Interface Scale"

; changeFolder(thisGui, *)
; {
	
;     sevedElm := thisGui.Submit(false)  ; Save the contents of named controls into an object.

;     img_path := "Figma_files\img" "_" sevedElm.changedInterfaceScale "\"

; }


; global fig := {}
; fig.help := "10"
; fig.say := sss(zz) {
;     MsgBox(zz)
; }

; #z::Say(fig.help)
; #x::sss("555")

OnExit (*) => SystemCursor("Show")  ; Ensure the cursor is made visible when the script exits.

#c::SystemCursor("Toggle")  ; Win+C hotkey to toggle the cursor on and off.

SystemCursor(cmd)  ; cmd = "Show|Hide|Toggle|Reload"
{
    static visible := true, c := Map()
    static sys_cursors := [32512, 32513, 32514, 32515, 32516, 32642
                         , 32643, 32644, 32645, 32646, 32648, 32649, 32650]
    if (cmd = "Reload" or !c.Count)  ; Reload when requested or at first call.
    {
        for i, id in sys_cursors
        {
            h_cursor  := DllCall("LoadCursor", "Ptr", 0, "Ptr", id)
            h_default := DllCall("CopyImage", "Ptr", h_cursor, "UInt", 2
                , "Int", 0, "Int", 0, "UInt", 0)
            h_blank   := DllCall("CreateCursor", "Ptr", 0, "Int", 0, "Int", 0
                , "Int", 32, "Int", 32
                , "Ptr", BufferAlloc(32*4, 0xFF)
                , "Ptr", BufferAlloc(32*4, 0))
            c[id] := {default: h_default, blank: h_blank}
        }
    }
    switch cmd
    {
    case "Show": visible := true
    case "Hide": visible := false
    case "Toggle": visible := !visible
    default: return
    }
    for id, handles in c
    {
        h_cursor := DllCall("CopyImage"
            , "Ptr", visible ? handles.default : handles.blank
            , "UInt", 2, "Int", 0, "Int", 0, "UInt", 0)
        DllCall("SetSystemCursor", "Ptr", h_cursor, "UInt", id)
    }
}

