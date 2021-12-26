; -------------------------------------------------------------------------------------------
; -------- Check  is it image and return true/false and coordinates --------
; -------------------------------------------------------------------------------------------
;~ "Figma_files\img\text_active.png")
isImage_FC(img_path, img_name)
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
isImageForce_FC(img_path, img_name, x1, y1, x2, y2)
{

	; Switch screenPart
	; {
	; 	Case "LT":
	; 		x1 := 0
	; 		y1 := 0
	; 		x2 := A_ScreenWidth/2
	; 		y2 := A_ScreenHeight/2
	; 	Case "RT":
	; 		x1 := A_ScreenWidth/2
	; 		y1 := 0
	; 		x2 := A_ScreenWidth
	; 		y2 := A_ScreenHeight/2
	; 	Case "LB":
	; 		x1 := 0
	; 		y1 := A_ScreenHeight/2
	; 		x2 := A_ScreenWidth/2
	; 		y2 := A_ScreenHeight
	; 	Case "RB":
	; 		x1 := A_ScreenWidth
	; 		y1 := 0
	; 		x2 := A_ScreenWidth
	; 		y2 := A_ScreenHeight
	; 	Default:
	; 		x1 := A_ScreenWidth/2
	; 		y1 := A_ScreenHeight/2
	; 		x2 := A_ScreenWidth
	; 		y2 := A_ScreenHeight
	; }


	img_path_full := img_path img_name
	tooltip_state := 0

	; loop {
	; 	if tooltip_state != 1 {
	; 		; Say "Trying To Find Image"
	; 	}

	; 	if (A_Index > 100){
	; 		break 
	; 	}
		
	; 	sleep 100
	; 	tooltip_state := 1
	; } until ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full)

	; while !ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full)
	; {
	; 	loop 100 {
	; 		if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full){
	; 			break
	; 		}
	; 		sleep 100
	; 	}

	; }




	 if ImageSearch(FoundX, FoundY, x1, y1, x2, y2, img_path_full){
		img_is:= true
					; Say("0")
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



		; if ImageSearch(FoundX, FoundY, x1, y1, x2, y2, img_path_full) {
		; 	img_is := true
		; 	; Say "Image Is In Place"
		; } else {
		; 	img_is := false
			; while !ImageSearch(FoundX, FoundY, x1, y1, x2, y2, img_path_full)
			; {
			; 	loop 100 {
			; 		if ImageSearch(FoundX, FoundY, x1, y1, x2, y2, img_path_full){
			; 			return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}
			; 		}
			; 		sleep 100
			; 	}
			; }
			; Say "Can't Find Image"
		; }

	; if ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) {
	; 		img_is := true
	; 		; Say "Image Is In Place"
	; 	} else {
	; 		img_is := false
	; 		; Say "Can't Find Image"
	; }
	;~ tooltip
	return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}
}



; -------------------------------------------------------------------------------------------
; ------- Click on image and check is it image and return true/false -------
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
	FoundX := FoundX + plus_x
	FoundY := FoundY + plus_y
	MouseClick "left", FoundX, FoundY, 1, 1
	MouseMove start_xpos, start_ypos, 1
	return img_is
}

; -------------------------------------------------------------------------------------------
; -------- Force click image for a 10 seconds --------
; -------------------------------------------------------------------------------------------
ImageForceClick_FC(img_path, img_name, plus_x, plus_y)
{
	img_path_full := img_path img_name

	MouseGetPos start_xpos, start_ypos
	 ;~ while ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) = false {

	;~ }
	
	;~ loop {
		;~ if (A_Index > 100){
			;~ tooltip
        ;~ break 
	;~ }
		;~ tooltip "Cant Find" A_Index
		;~ sleep 100
	;~ } until ImageSearch(FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) 
	;~ tooltip
	
	
	
	
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