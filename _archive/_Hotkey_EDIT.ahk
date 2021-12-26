Gui := GuiCreate(, "Simple Input Example 0x40000")
Gui.Add("Text",, "0:")
Gui.Add("Text",, "1:")
Gui.Add("Text",, "2:")
Gui.Add("Text",, "3:")
Gui.Add("Text",, "4:")
Gui.Add("Text",, "5:")
Gui.Add("Text",, "6:")
Gui.Add("Text",, "7:")
Gui.Add("Text",, "8:")
Gui.Add("Text",, "9:")
;~ Gui.Add("Text",, "HK:")


;~ Gui.Add("Edit", "vFirstName ym")  ; The ym option starts a new column of controls.
hotkey_main_gui := Gui.Add("Edit", "xm", "") ;.OnEvent("label_h1")
hotkey_0_gui := Gui.Add("Edit", "ym w100", "") ;.OnEvent("label_h1")
hotkey_1_gui := Gui.Add("Edit", "w100", "") 
hotkey_2_gui := Gui.Add("Edit", "w100", "") 
hotkey_3_gui := Gui.Add("Edit", "w100", "") 
hotkey_4_gui := Gui.Add("Edit", "w100", "") 
hotkey_5_gui := Gui.Add("Edit", "w100", "") 
hotkey_6_gui := Gui.Add("Edit", "w100", "") 
hotkey_7_gui := Gui.Add("Edit", "w100", "") 
hotkey_8_gui := Gui.Add("Edit", "w100", "") 
hotkey_9_gui := Gui.Add("Edit", "w100", "") 


Gui.Add("Text", "ym", "*")
Gui.Add("Text", "", "*")
Gui.Add("Text", "", "*")
Gui.Add("Text", "", "*")
Gui.Add("Text", "", "*")
Gui.Add("Text", "", "*")
Gui.Add("Text", "", "*")
Gui.Add("Text", "", "*")
Gui.Add("Text", "", "*")
Gui.Add("Text", "", "*")

loop_count_0_gui := Gui.Add("Edit", "ym w30", "1") 
loop_count_1_gui := Gui.Add("Edit", "w30", "1") 
loop_count_2_gui := Gui.Add("Edit", "w30", "1") 
loop_count_3_gui := Gui.Add("Edit", "w30", "1") 
loop_count_4_gui := Gui.Add("Edit", "w30", "1") 
loop_count_5_gui := Gui.Add("Edit", "w30", "1") 
loop_count_6_gui := Gui.Add("Edit", "w30", "1") 
loop_count_7_gui := Gui.Add("Edit", "w30", "1") 
loop_count_8_gui := Gui.Add("Edit", "w30", "1") 
loop_count_9_gui := Gui.Add("Edit", "w30", "1") 

;~ set_hotkey := Gui.Add("Hotkey", "w135", "!f2")

Gui.Add("Button", "default", "OK").OnEvent("Click", (*) => ProcessUserInput(Gui))
;~ Gui.OnEvent("Button", "ProcessUserInput")
;~ Gui.OnEvent("Close")
Gui.Show()
;~ F2::
;~ ProcessUserInput(Gui)
;~ return

global hotkey_0 := hotkey_0_gui.value
global hotkey_1 := hotkey_1_gui.value
global hotkey_2 := hotkey_2_gui.value
global hotkey_3 := hotkey_3_gui.value
global hotkey_4 := hotkey_4_gui.value
global hotkey_5 := hotkey_5_gui.value
global hotkey_6 := hotkey_6_gui.value
global hotkey_7 := hotkey_7_gui.value
global hotkey_8 := hotkey_8_gui.value
global hotkey_9 := hotkey_9_gui.value
global loop_count_0 := loop_count_0_gui.value
global loop_count_1 := loop_count_1_gui.value
global loop_count_2 := loop_count_2_gui.value
global loop_count_3 := loop_count_3_gui.value
global loop_count_4 := loop_count_4_gui.value
global loop_count_5 := loop_count_5_gui.value
global loop_count_6 := loop_count_6_gui.value
global loop_count_7 := loop_count_7_gui.value
global loop_count_8 := loop_count_8_gui.value
global loop_count_9 := loop_count_9_gui.value



ProcessUserInput(this, *)
{
;~ saved := this.Submit()  ; Save the contents of named controls into an object.
global hotkey_0_gui, hotkey_1_gui, hotkey_2_gui, hotkey_3_gui, hotkey_4_gui, hotkey_5_gui, hotkey_6_gui, hotkey_7_gui, hotkey_8_gui, hotkey_9_gui
global loop_count_0_gui, loop_count_1_gui, loop_count_2_gui, loop_count_3_gui, loop_count_4_gui, loop_count_5_gui, loop_count_6_gui, loop_count_7_gui, loop_count_8_gui, loop_count_9_gui


global hotkey_0 := hotkey_0_gui.value
global hotkey_1 := hotkey_1_gui.value
global hotkey_2 := hotkey_2_gui.value
global hotkey_3 := hotkey_3_gui.value
global hotkey_4 := hotkey_4_gui.value
global hotkey_5 := hotkey_5_gui.value
global hotkey_6 := hotkey_6_gui.value
global hotkey_7 := hotkey_7_gui.value
global hotkey_8 := hotkey_8_gui.value
global hotkey_9 := hotkey_9_gui.value
global loop_count_0 := loop_count_0_gui.value
global loop_count_1 := loop_count_1_gui.value
global loop_count_2 := loop_count_2_gui.value
global loop_count_3 := loop_count_3_gui.value
global loop_count_4 := loop_count_4_gui.value
global loop_count_5 := loop_count_5_gui.value
global loop_count_6 := loop_count_6_gui.value
global loop_count_7 := loop_count_7_gui.value
global loop_count_8 := loop_count_8_gui.value
global loop_count_9 := loop_count_9_gui.value
;~ MsgBox value_1 sep value_2 sep value_3 sep loop_count
		;~ MsgBox saved.first_varible
		;~ FileAppend(saved.first_varible.Text, "D:\Saved File2.txt")
return
}
return

label_h1:
loop  1 {
	;~ global ChosenHotkey
	MsgBox "ок"
	;~ if (value_3 >= 0) {
		;~ Clipboard := value_1 sep value_2 sep value_3 sep
		;~ value_3++
	;~ } else if (value_2 >= 0 ) {
		;~ Clipboard := value_1 sep value_2 sep
		;~ value_2++
	;~ } else if (value_1 >= 0 ) {
		;~ Clipboard := value_1 sep
		;~ value_1++
	;~ }
;~ ChosenHotkey := GuiCtrl.value
;~ Send hotkey_0
;~ Send "^{Home}"
;~ Send "^v"
;~ Send "{Tab}"

}
return

#F2::
Hotkey hotkey_0, "MyLabel"
return

MyLabel:
MsgBox "You pressed " A_ThisHotkey
return

