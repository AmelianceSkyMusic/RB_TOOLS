; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
; #SingleInstance ignore 
; #If WinActive("ahk_exe Studio One.exe")
#HotIf WinActive("ahk_exe ShareX.exe")

#Numpad0::
{
	 Send "{LButton Down}"
}

#NumpadEnter::
{
	 Send "{LButton Up}"
}




#Left::
{
	MouseMove -1, 0, , "R"
}

#Up::
{
	MouseMove 0, -1, , "R"
}

#Right::
{
	MouseMove 1, 0, , "R"
}

#Down::
{
	MouseMove 0, 1, , "R"
}




#Numpad4::
{
	MouseMove -10, 0, , "R"
}
#Numpad8::
{
	MouseMove 0, -10, , "R"
}

#Numpad6::
{
	MouseMove 10, 0, , "R"
}

#Numpad5::
{
	MouseMove 0, 10, , "R"
}

