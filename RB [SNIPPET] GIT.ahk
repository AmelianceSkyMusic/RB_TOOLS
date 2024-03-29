﻿#HotIf
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
::ga.::git add .{ENTER}            ; - добавить все файлы в стейдж
::ga::git add                      ; - добавить файл в стейдж
::gs::git status --short{ENTER}    ; - посмотреть статус
::gp::git push{ENTER}              ; - закинуть изминения из гита на репозиторий

::gc::git commit -m ""{LEFT}      ; - записать коммит в гит
::gam::git commit --amend
::gamn::git commit --amend --no-edit
::gcb::git checkout -b{SPACE}      ; - создать ветку и перейти на нее
::gch::git checkout                 ; - перейти на ветку
::gb::git branch                   ; - посмотреть ветки
::gr.::git reset .                 ; - отменить git add
::gr::git reset                    ; - отменить git add

::gac::git add .{ENTER}{SLEEP 200}git commit -m ""{LEFT}   ; - git add + commit
