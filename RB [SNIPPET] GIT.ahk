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

; ================================================================
; ================================================================
; ================================================================
; #HotIf not WinActive("ahk_exe code.exe") and not WinActive("ahk_exe photoshop.exe") and not WinActive("ahk_exe illustrator.exe") and not WinActive("ahk_exe figma.exe")
::g a.::git add .{ENTER}            ; - добавить все файлы в стейдж
::g a::git add                      ; - добавить файл в стейдж
::g s::git status --short{ENTER}    ; - посмотреть статус
::g p::git push{ENTER}              ; - закинуть изминения из гита на репозиторий

::g cm::git commit -m "             ; - записать коммит в гит
::g cb::git checkout -b{SPACE}      ; - создать ветку и перейти на нее
::g c::git checkout                 ; - перейти на ветку
::g b::git branch                   ; - посмотреть ветки
::g r.::git reset .                 ; - отменить git add
::g r::git reset                    ; - отменить git add