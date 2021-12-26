;# Win   ! Alt   ^ Ctrl   + Shift
#HotIf
; *>!o:: Send "{U+00AB}" ; «
; *>!p:: Send "{U+00BB}" ; »

; *>!o:: Send "«" ; «
; *>!p:: Send "»" ; »

; *>!o:: Send "«" ; «
; *>!p:: Send "»" ;

; -----------------------------------------------------------------
; ---------------------- RIGHT ALT + SHIFT ------------------------
; -----------------------------------------------------------------
; *>!+q:: Send "{U+}" ;  
; *>!+w:: Send "{U+}" ;   
; *>!+e:: Send "{U+}" ;
*>!+r:: Send "{U+02DA}" ; ˚
; *>!+t:: Send "{U+}" ;
*>!+y:: Send "{U+2714}" ; ✔
; *>!+y:: Send "{U+0462}" ; Ѣ
*>!+u:: Send "{U+0474}" ; Ѵ
*>!+i:: Send "{U+0406}" ; І
; *>!+o:: Send "{U+0472}" ; Ѳ
*>!+o:: Send "{U+00B7}" ; ·
*>!+p:: Send "{U+2033}" ; ″
*>!+[:: Send "{U+FF5B}" ; {
*>!+]:: Send "{U+FF5D}" ; }
*>!+a:: Send "{U+2314}" ; ⌘
; *>!+s:: Send "{U+}" ;
*>!+d:: Send "{U+2300}" ; ⌀
; *>!+f:: Send "{U+}" ;
; *>!+g:: Send "{U+}" ;
; *>!+h:: Send "{U+}" ;
; *>!+j:: Send "{U+}" ;
*>!+k:: Send "{U+2018}" ; ‘
*>!+l:: Send "{U+2019}" ; ’
; *>!+;:: Send "{U+}" ;
; *>!+':: Send "{U+}" ;
; *>!+\:: Send "{U+}" ;
; *>!+z:: Send "{U+}" ;
; *>!+x:: Send "{U+}" ;
*>!+c:: Send "{U+FFE0}" ; ¢
*>!+v:: Send "{U+FFEC}" ; ￬
*>!+b:: Send "{U+0392}" ; ẞ
*>!+n:: Send "{U+2718}" ; ✘
*>!+m:: Send "{U+2022}" ; •
*>!+,:: Send "{U+201E}" ; „
*>!+.:: Send "{U+201F}" ; “
; *>!+/:: Send "{U+}" ;
; *>!+`:: Send "{U+}" ; 
*>!+1:: Send "{U+00A1}" ; ¡
*>!+2:: Send "{U+00DB}" ; ½
*>!+3:: Send "{U+2153}" ; ⅓
*>!+4:: Send "{U+00BC}" ; ¼
; *>!+5:: Send "{U+}" ;
*>!+6:: Send "{U+FFEA}" ; ￪
*>!+7:: Send "{U+00BF}" ; ¿
; *>!+8:: Send "{U+}" ;
*>!+9:: Send "{U+FFE9}" ; ￩
*>!+0:: Send "{U+FFEB}" ; ￫
*>!+-:: Send "{U+2013}" ; –
*>!+=:: Send "{U+00B1}" ; ±

; -----------------------------------------------------------------
; -------------------------- RIGHT ALT ----------------------------
; -----------------------------------------------------------------
; *>!q:: Send "{U+}" ;   
; *>!w:: Send "{U+}" ;   
*>!e:: Send "{U+20AC}" ; € 
*>!r:: Send "{U+00AE}" ; ® ˘˚
*>!t:: Send "{U+2122}" ; ™ 
*>!y:: Send "{U+2713}" ; ✓ Ѣ
; *>!y:: Send "{U+0463}" ; ѣ Ѣ
*>!u:: Send "{U+0475}" ; ѵ Ѵ
*>!i:: Send "{U+0456}" ; і І
; *>!o:: Send "{U+0473}" ; ѳ Ѳ
*>!o:: Send "{U+2022}" ; •
*>!p:: Send "{U+2032}" ; ′ ″
*>![:: Send "{U+005B}" ; [ {
*>!]:: Send "{U+005D}" ; ] }
*>!a:: Send "{U+2248}" ; ≈ ⌘
*>!s:: Send "§" ; § 
*>!d:: Send "{U+00B0}" ; ° ⌀
*>!f:: Send "{U+00A3}" ; £ 
; *>!g:: Send "{U+}" ; 
*>!h:: Send "{U+20B1}" ; ₽ 
*>!j:: Send "{U+201E}" ; „ 
*>!k:: Send "{U+201C}" ; “ ‘
*>!l:: Send "{U+0027}" ; ” ’
*>!;:: Send "{U+FF07}" ; ‘ 
*>!':: Send "{U+0027}" ; ’
; *>!\:: Send "{U+}" ;  
; *>!z:: Send "{U+}" ;  
*>!x:: Send "{U+00D7}" ; × 
*>!c:: Send "{U+00A9}" ; © ¢
*>!v:: Send "{U+2193}" ; ↓ ￬
*>!b:: Send "{U+03B2}" ; ß ẞ
*>!n:: Send "{U+2717}" ; ✗
*>!m:: Send "{U+2212}" ; − •

*>!,:: Send "{U+00AB}" ; « „
; *>!,:: Send "{U+00AB}{U+00BB}{Left}"

*>!.:: Send "{U+00BB}" ; » “
*>!/:: Send "{U+2026}" ; …  
; *>!`:: Send "{U+}" ; 
*>!1:: Send "{U+00B9}" ; ¹ ¡
*>!2:: Send "{U+00B2}" ; ² ½
*>!3:: Send "{U+00B3}" ; ³ ⅓
*>!4:: Send "{U+0024}" ; $ ¼
*>!5:: Send "{U+2030}" ; ‰ 
*>!6:: Send "{U+2191}" ; ↑ 
; *>!7:: Send "{U+}" ; 
*>!8:: Send "{U+221E}" ; ∞ 
*>!9:: Send "{U+2190}" ; ← 〈
*>!0:: Send "{U+2192}" ; → 〉
*>!-:: Send "{U+2014}" ; — –
*>!=:: Send "{U+2260}" ; ≠ ±

#HotIf WinActive("ahk_exe Telegram.exe") or WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe explorer.exe")
*>!,::
{
    ; tempClipboard := ClipboardAll()
    A_Clipboard := ""
    Send "^x"
    if ClipWait(0.1)
    {
        Send("{U+00AB}{U+00BB}{Left}")
        Send "^v"
    } else {
        A_Clipboard := ""
        Send("{U+00AB}{U+00BB}{Left}")
    }
    ; A_Clipboard := tempClipboard

}
