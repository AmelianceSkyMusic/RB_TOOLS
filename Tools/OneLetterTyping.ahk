;# Win   ! Alt   ^ Ctrl   + Shift
$^!+Enter::
{
	ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^a"
	Send "^c"
	ClipWait
	ClipTemp := A_Clipboard
	Loop Parse, ClipTemp, "" {

		symbol := A_LoopField
		
		if A_LoopField = " " {
			symbol := "⋅"
		}

		SendInput symbol
		sleep 300
		Send "{enter}"

	}
	A_Clipboard := ClipSaved
}
