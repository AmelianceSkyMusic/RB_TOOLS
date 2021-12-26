﻿; -------------------------------------------------------------------------------------------
; -------- Check  is it image and return true/false and coordinates --------
; -------------------------------------------------------------------------------------------
;~ "Figma_files\img\text_active.png")
; isImage_FC(img_path, img_name, x1, y1, x2, y2)
isImage_FC(img_path, img_name, x1, y1, x2, y2)
{
	img_path_full := img_path img_name

	 if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) 
			img_is:= true
		else
			img_is := false
	return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}
}


; -------------------------------------------------------------------------------------------
; --- Check for a 10 seconds is it image and return true/false and coordinates ---
; -------------------------------------------------------------------------------------------
isImageWaitForImg_FC(img_path, img_name, x1, y1, x2, y2)
{

	img_path_full := img_path img_name

	 if ImageSearch(FoundX, FoundY, x1, y1, x2, y2, img_path_full){
		img_is:= true
	 } else {
		sleep 100
		if ImageSearch(FoundX, FoundY, x1, y1, x2, y2, img_path_full){
			img_is:= true
	 	} else {
			 loop 100 {
				 if ImageSearch(FoundX, FoundY, x1, y1, x2, y2, img_path_full){
					 img_is:= true
					 return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}
				 }
			 }
			img_is := false
	 	}
	 }

	return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}
}



; -------------------------------------------------------------------------------------------
; ------- Click on image and check is it image and return true/false -------
; -------------------------------------------------------------------------------------------
; isImageClick_FC(img_path, img_name, plus_x, plus_y)
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
	FoundX := FoundX + plus_x
	FoundY := FoundY + plus_y
	MouseClick "left", FoundX, FoundY, 1, 1
	MouseMove start_xpos, start_ypos, 1
	return img_is
}

; -------------------------------------------------------------------------------------------
; -------- Force click image for a 10 seconds --------
; -------------------------------------------------------------------------------------------
; ImageForceClick_FC(img_path, img_name, plus_x, plus_y)
isImageWaitForImgClick_FC(img_path, img_name, plus_x, plus_y)
{
	img_path_full := img_path img_name

	MouseGetPos start_xpos, start_ypos

		
	loop {
		if (A_Index > 100){
			;~ tooltip
			break 
		}
		;~ tooltip A_Index
		sleep 100
	} until ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) 
	
	if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) {
		FoundX := FoundX + plus_x
		FoundY := FoundY + plus_y
		MouseClick "left", FoundX, FoundY, 1, 1
		MouseMove start_xpos, start_ypos, 1
	}
	;~ tooltip
	return
}