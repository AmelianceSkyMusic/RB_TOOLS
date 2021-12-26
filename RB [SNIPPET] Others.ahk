#HotIf
#hotstring EndChars `t ;tab - expand snippet
#hotstring o ?
 ; *  - ending char is not required
 ; ?  - trigger inside word (?0 - turn off)
 ; b0 - turn off auto backspacing (b - turn on)
 ; c  - case sensitive (c0 - turn off)
 ; c1 - case conform (abc, Abc, ABC expands hotstring approrpiate)
 ; kN - key delay (in ms, -1 is no delay)
 ; o  - omit ending char
 ; pN - priority ???
 ; r  - send raw (r0 - turn off)
 ; si/sp/se - method to send: sendinput/sendplay/sendevent (si - default)
 ; t  - send raw without translating character to keystroke (t0/r0 - turn off)
 ; x  - execute (run code instead sending text)
 ; z  - reset hotstring processing (for preventing recursion on b0) (z0 - turn off)

 ; AHK1 RU help https://ahk-wiki.ru/hotstrings


 
hotkey_var := "^!z" ; TEST — User hotkeys

Hotkey hotkey_var, MyFunc

MyFunc(ThisHotkey)
{
    MsgBox "You pressed " ThisHotkey
}


; e-mails
; ::rs@::Rsay@ukr.net
; ::rs2::Rsay@ukr.net
; ::кы@::Rsay@ukr.net
; ::кы2::Rsay@ukr.net
; ::кі@::Rsay@ukr.net
; ::кі2::Rsay@ukr.net

; :*:rs@::Rsay@ukr.net
; :*:rs2::Rsay@ukr.net
; :*:кы@::Rsay@ukr.net
; :*:кы2::Rsay@ukr.net
; :*:кі@::Rsay@ukr.net
; :*:кі2::Rsay@ukr.net



; ::rr@::Rsay@ukr.net
; ::rr2::Rsay@ukr.net
; ::кr@::Rsay@ukr.net
; ::кr2::Rsay@ukr.net


; :*:rr@::Rsay@ukr.net
; :*:rr2::Rsay@ukr.net
; :*:кr@::Rsay@ukr.net
; :*:кr2::Rsay@ukr.net

; ::r@::Radzhab@ukr.net
; ::r2::Radzhab@ukr.net 
; ::к@::Radzhab@ukr.net
; ::к2::Radzhab@ukr.net 

::rr::Rsay@ukr.net
::кк::Rsay@ukr.net

::r::Radzhab@ukr.net
::к::Radzhab@ukr.net 


; ::ad@::AmelianceDesign@gmail.com
; ::ad2::AmelianceDesign@gmail.com
; ::фв@::AmelianceDesign@gmail.com
; ::фв2::AmelianceDesign@gmail.com

; ::aw@::AmelianceWorship@gmail.com
; ::aw2::AmelianceWorship@gmail.com
; ::фц@::AmelianceWorship@gmail.com
; ::фц2::AmelianceWorship@gmail.com

; ::a@::AmelianceSkyMusic@gmail.com
; ::a2::AmelianceSkyMusic@gmail.com
; ::ф@::AmelianceSkyMusic@gmail.com
; ::ф2::AmelianceSkyMusic@gmail.com


::adg::AmelianceDesign@gmail.com
::фвп::AmelianceDesign@gmail.com

::awg::AmelianceWorship@gmail.com
::фцп::AmelianceWorship@gmail.com

::asg::AmelianceSkyMusic@gmail.com
::фып::AmelianceSkyMusic@gmail.com
::фіп::AmelianceSkyMusic@gmail.com


; ::@g::@gmail.com
; ::2g::@gmail.com
; ::@п::@gmail.com
; ::2п::@gmail.com

:*:@g::@gmail.com
:*:2g::@gmail.com
:*:@п::@gmail.com
:*:2п::@gmail.com


; ::@u::@ukr.net
; ::2u::@ukr.net
; ::@г::@ukr.net
; ::2г::@ukr.net

:*:@u::@ukr.net
:*:2u::@ukr.net
:*:@г::@ukr.net
:*:2г::@ukr.net


::tasm::http://t.me/amelianceskymusic

::ASM::AmelianceSkyMusic
::ФЫЬ::AmelianceSkyMusic
::ФІЬ::AmelianceSkyMusic

::A SM::Ameliance SkyMusic
::Ф ЫЬ::Ameliance SkyMusic
::Ф ІЬ::Ameliance SkyMusic
::A S::Ameliance SkyMusic
::Ф Ы::Ameliance SkyMusic
::Ф І::Ameliance SkyMusic

::,::, будь ласка, `


::duck::duckduckgo.com



; (
;     dribbble.com/rsayuaie
;     +{enter}
;     behance.net/rsayuaie
; )

::ta::t.me/amelianceskymusic
::@a::@amelianceskymusic
:*:t.me/a::t.me/amelianceskymusic
; :*:імя::(ім'я)
:x*:імя::SendInput("ім'я")

; ================================================================
; ================================================================
; ================================================================
#HotIf not WinActive("ahk_exe code.exe") and not WinActive("ahk_exe photoshop.exe") and not WinActive("ahk_exe illustrator.exe") and not WinActive("ahk_exe figma.exe")
:*:(::(){Left}
:*:[::[]{Left}
:*:{::{{}{}}{Left}
:*:('::(''){Left 2}
:*:("::(""){Left 2}
:*:"::""{Left}
:*:'::''{Left}

; :*:<p::<p></p>{Left}{Left}{Left}{Left}

; *>!.:: Send"{U+00AB}{U+00BB}{Left}" ; » “
; :*: —:: — 

:x:p::SendInput("dribbble.com/rsayuaie^{enter}behance.net/rsayuaie")

#HotIf WinActive("ahk_exe Obsidian.exe")
::h1::{#}{SPACE}
::р1::{#}{SPACE}
::h2::{#}{#}{SPACE}
::р2::{#}{#}{SPACE}
::h3::{#}{#}{#}{SPACE}
::р3::{#}{#}{#}{SPACE}
::h4::{#}{#}{#}{#}{SPACE}
::р4::{#}{#}{#}{#}{SPACE}
::h5::{#}{#}{#}{#}{#}{SPACE}
::р5::{#}{#}{#}{#}{#}{SPACE}










