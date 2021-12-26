;# Win   ! Alt   ^ Ctrl   + Shift

global ClipTempFile
global ClipTempName
global ClipSaved

$^!+q::
{
	ClipSaved := ClipboardAll()
	A_Clipboard := ""

	Send "^c"
	ClipWait
	ClipTempFile := A_Clipboard
	A_Clipboard := ""

	Send "{F2}"
	Send "^c"
	ClipWait
	ClipTempName := A_Clipboard

	A_Clipboard := ClipSaved

	Send "{esc}"
}

$^!+w::
{
	A_Clipboard := ""
	ClipWait
	A_Clipboard := ClipTempFile
	Send "^v"

	A_Clipboard := ""
	ClipWait
	A_Clipboard := ClipTempName
	Send "^v"

	A_Clipboard := ClipSaved

}
