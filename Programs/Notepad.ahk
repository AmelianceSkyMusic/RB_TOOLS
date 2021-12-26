; AHK2
;# Win   ! Alt   ^ Ctrl   + Shift
#HotIf WinActive("ahk_exe notepad.exe")
F1:: msgbox mt("F1")

F2:: {
	switch Abs(l := mt("F2")) {
		case 1: r := "один"
		case 2: r := "два"
		case 3: r := "три"
		case 4: r := "чопыре"
		default: r := "много"
	}
	msgbox l < 0 ? "долго " r : r
}

RButton:: {
	; switch Abs(l := mt("F2")) {
	; 	case 1: r := "один"
	; 	case 2: r := "два"
	; 	case 3: r := "три"
	; 	case 4: r := "чопыре"
	; 	default: r := "много"
	; }
	; msgbox l < 0 ? "долго " r : r
	Run "ahk_exe " "code" ".exe"
}

;   isFunc(fun) {
;   	if Type(fun) = "Func"
;   		return "Func"
;   	else if Type(fun) = "String"
;   		try if %fun% is Func
;   			return "String"
;   	return false
;   }

; functionA(number) {
; 	MsgBox a
; 	MsgBox b
; 	MsgBox c
; 	return a + b + c
; }

; FunctionB(aaa, bbb*){

; 	 if Type(%aaa%) = "Func"
; 		%aaa%(bbb*)
; 	; MsgBox ccc
	
; }

#z::{
	; getFunctionNameFromFile := "functionA"
	; getFunctionArgFromFile := 10
	; ; ; functionName
	; ; ; paremetr
	; ; abplus(a, b){
	; ; 	c := a+b
	; ; 	return c
	; ; }
	; ; cOnC(c){
	; ; 	return c+c
	; ; }
	; ; MMS(funct, paramp){
	; ; 	cc := funct(paramp)
	; ; 	Msg cc
	; ; }

	; ; MMS(cOnC, 4)
	; FunctionB(getFunctionNameFromFile, getFunctionArgFromFile)
}