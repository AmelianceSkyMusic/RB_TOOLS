
; isImage_FC(img_path, img_name, x1:=0, y1:=0, x2:=-100000, y2:=-100000)
; return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}

; isImageWaitForImg_FC(img_path, img_name, x1:=0, y1:=0, x2:=-100000, y2:=-100000)
; return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}

; isImageClick_FC(img_path, img_name, plus_x, plus_y, speed:=0, sleepSet:=0, x1:=0, y1:=0, x2:=-100000, y2:=-100000)
; return img_is

; isImageWaitForImgClick_FC(img_path, img_name, plus_x, plus_y, speed:=0, sleepSet:=0, x1:=0, y1:=0, x2:=-100000, y2:=-100000)
; return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}

isImg_FC(img_path, img_name) {
	img_path_full := img_path img_name
	if ImageSearch(&FoundX, &FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, img_path_full) {
		Msg("++++++++++`n`nOK:`n" img_name)
	} else {
		Msg("----------`n`nCan't Find:`n" img_name)
	}
}
; -------------------------------------------------------------------------------------------
; -------- Check  is it image and return true/false and coordinates --------
; -------------------------------------------------------------------------------------------
isImage_FC(img_path, img_name, x1:=0, y1:=0, x2:=-100000, y2:=-100000) {

	if x2 = -100000
		x2 := A_ScreenWidth

	if y2 = -100000
		y2 := A_ScreenHeight

	img_path_full := img_path img_name

	Try {
		if ImageSearch(&FoundX, &FoundY, x1, y1, x2, y2, img_path_full) {
			img_is := true
			Msg("OK:`n" img_name)
		} else {
			img_is := false
			Msg("Can't find image:`n" img_name)
			return {img_is:img_is}
		}

	} catch Error {
		Say("NO FILE:`n" img_name, , , , ,"ERR")
		return {img_is:img_is}
	}
	return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}
}


isImageWaitForImg_FC(img_path, img_name, x1:=0, y1:=0, x2:=-100000, y2:=-100000)
{
	if x2 = -100000
		x2 := A_ScreenWidth

	if y2 = -100000
		y2 := A_ScreenHeight

	img_path_full := img_path img_name
	Try{
	 if ImageSearch(&FoundX, &FoundY, x1, y1, x2, y2, img_path_full){
		img_is:= true
	 } else {
		sleep 100
		if ImageSearch(&FoundX, &FoundY, x1, y1, x2, y2, img_path_full){
			img_is:= true
	 	} else {
			 progress := 0
			 loop 100 {
				Tooltip("Trying to find image " progress)
				 if ImageSearch(&FoundX, &FoundY, x1, y1, x2, y2, img_path_full){
					 img_is := true
					 Tooltip
					 return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}
				 }
				 Sleep 10
				 progress++
			 }
			Tooltip
			img_is := false
			Msg("Can't find image:`n" img_name "`n`nwidth= " x1 "-" x2 "`nheight=" y1 "-" y2)
			return {img_is:img_is}

	 	}
	 }
	} catch Error {
		Say("NO FILE:`n" img_name, , , , ,"ERR")
		return {img_is:img_is}
	}
	Tooltip
	return {img_is:img_is, FoundX:FoundX, FoundY:FoundY}
}



; -------------------------------------------------------------------------------------------
; ------- Click on image and check is it image and return true/false -------
; -------------------------------------------------------------------------------------------
; isImageClick_FC(img_path, img_name, plus_x, plus_y)
isImageClick_FC(img_path, img_name, plus_click_x, plus_click_y, clicks:=1, moveBack:=true, speed:=0, sleepSet:=0, x1:=0, y1:=0, x2:=-100000, y2:=-100000)
{

	; BlockInput "On"
	if x2 = -100000
		x2 := A_ScreenWidth

	if y2 = -100000
		y2 := A_ScreenHeight

	img_path_full := img_path img_name

	MouseGetPos(&start_xpos, &start_ypos)
	Try{
		if ImageSearch(&FoundX, &FoundY, x1, y1, x2, y2, img_path_full) {
				img_is:= true
		} else {
				img_is := false
				Msg("Can't find image:`n" img_name)
				return {img_is:img_is}
		}
	} catch Error {
		Say("NO FILE:`n" img_name, , , , ,"ERR")
		return {img_is:img_is}
	}
	FoundX := FoundX + plus_click_x
	FoundY := FoundY + plus_click_y

	if speed > 0 {
		SendMode "Event"
	} else {
		SendMode "Input"
	}

	; SystemCursor("Hide")
	MouseMove FoundX, FoundY, speed
	sleep sleepSet
	Click(clicks)
	if moveBack {
		MouseMove start_xpos, start_ypos, speed
	}
	SendMode "Input"
	; BlockInput "Off"
	; SystemCursor("Show")
	return {img_is:img_is}
}

; -------------------------------------------------------------------------------------------
; -------- Force click image for a 10 seconds --------
; -------------------------------------------------------------------------------------------
; ImageForceClick_FC(img_path, img_name, plus_x, plus_y)
isImageWaitForImgClick_FC(img_path, img_name, plus_click_x:=0, plus_click_y:=0, radius:=0, clicks:=1, moveBack:=true, speed:=0, sleepSet:=0, mode:="window", x1:=0, y1:=0, x2:=-100000, y2:=-100000) {
		CoordMode "Mouse", "Screen"
		CoordMode "Pixel", "Screen"
	if mode := "window" {
		WinGetPos &X, &Y, &W, &H, "A"
		if x2 = -100000
			x2 := W
		if y2 = -100000
			y2 := H
	} else if mode := "screen" {
		if x2 = -100000
			x2 := A_ScreenWidth
		if y2 = -100000
			y2 := A_ScreenHeight
	} else if mode := "client" {
		MsgBox "What is the Client mode"
		return
	} else {
		x2 := x2
		y2 := y2
	}

	img_path_full := img_path img_name
	MouseGetPos(&start_xpos, &start_ypos)


	updateCoord(&x1, &y1, &x2, &y2) {

		MouseGetPos(&updated_xpos, &updated_ypos)

		x1 := updated_xpos - radius
		if x1 < 0
			x1 := 0
		y1 := updated_ypos - radius
		if y1 < 0
			y1 := 0
		x2 := updated_xpos + radius
		if x2 > A_ScreenWidth
			x2 := A_ScreenWidth
		y2 := updated_ypos + radius
		if y2 > A_ScreenHeight
			y2 := A_ScreenHeight
	}
	If radius > 0 {
		updateCoord(&x1, &y1, &x2, &y2)
	}


	; Msg("width= " x1 "-" x2 "`nheight=" y1 "-" y2, 3000)
	; MsgBox("width= " x1 "-" x2 "`nheight=" y1 "-" y2, 3000)

	Try {
		if ImageSearch(&FoundX, &FoundY, x1, y1, x2, y2, img_path_full) {
			img_is := true
		} else {
			sleep 100
			if ImageSearch(&FoundX, &FoundY, x1, y1, x2, y2, img_path_full) {
				img_is := true
			} else {
				progress := 0
				loop 100 {
					If radius > 0 {
						updateCoord(&x1, &y1, &x2, &y2)
						; Tooltip("Trying to find image " progress "`n" x1 "-" x2 " " y1 "-" y2, x1, y1)
						Tooltip(progress)
					} else {
						Tooltip(progress)
						; Tooltip("Trying to find image " progress "`n" x1 "-" x2 " " y1 "-" y2, x1, y1)
						; Tooltip("Trying to find image " progress)
					}
					if ImageSearch(&FoundX, &FoundY, x1, y1, x2, y2, img_path_full) {
						img_is := true
						; Goto RUNMOUSECLICK
						break
					} else {
						img_is := false
					}
					Sleep 10
					progress++
				}

				if !img_is {
					Tooltip
					; Msg("Can't find image:`n" img_name "`n`nwidth= " x1 "-" x2 "`nheight=" y1 "-" y2)

					; return {img_is: img_is, FoundX: false, FoundY: false}
					return {img_is: img_is}
				}

			}
		}
	} catch Error {
		Say("NO FILE:`n" img_name, , , , , "ERR")
		return {img_is: img_is}
	}

	Tooltip
	FoundX := FoundX + plus_click_x
	FoundY := FoundY + plus_click_y

	if speed > 0 {
		SendMode "Event"
	} else {
		SendMode "Input"
	}
	; SystemCursor("Hide")
	MouseMove FoundX, FoundY, speed
	sleep sleepSet
	Click(clicks)
	if moveBack {
		MouseMove start_xpos, start_ypos, speed
	}
	; SystemCursor("Show")

	SendMode "Input"

	return {img_is: img_is, FoundX: FoundX, FoundY: FoundY}

}
