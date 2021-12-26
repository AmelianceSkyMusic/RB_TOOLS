; -------------------------------------------------------------------------------------------
;~ "Figma_files\img\text_active.png")
isImage_FC(img_path, img_name)
{
	img_path_full := img_path img_name

	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) 
			img_is:= true
		else
			img_is := false
	;~ Mousemove FoundX, FoundY
	return {img_is : img_is, FoundX:FoundX, FoundY:FoundY}
}



; -------------------------------------------------------------------------------------------
isImageClick_FC(img_path, img_name, plus_x, plus_y)
{
	img_path_full := img_path img_name

	MouseGetPos start_xpos, start_ypos
	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) {
			img_is:= true
	} else {
			img_is := false
			return img_is
	}
	;~ MouseMove FoundX, FoundX, 1
	;~ MsgBox img_is
	FoundX := FoundX + plus_x
	FoundY := FoundY + plus_y
	MouseClick left, FoundX, FoundY, 1, 1
	MouseMove start_xpos, start_ypos, 1
	return img_is
}



; -------------------------------------------------------------------------------------------
ImageForceClick_FC(img_path, img_name, plus_x, plus_y)
{
	img_path_full := img_path img_name

	MouseGetPos start_xpos, start_ypos
	    while GetKeyState("LButton")
    {
        MouseGetPos x, y
        ToolTip begin_x ", " begin_y "`n" Abs(begin_x-x) " x " Abs(begin_y-y)
        Sleep 10
    }
	 while ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) = false {

	}
	;~ MouseMove FoundX, FoundX, 1
	;~ MsgBox img_is
	FoundX := FoundX + plus_x
	FoundY := FoundY + plus_y
	MouseClick left, FoundX, FoundY, 1, 1
	MouseMove start_xpos, start_ypos, 1
	return
}