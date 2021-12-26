#HotIf GetKeyState("ScrollLock", "T")
{

    RButton::{
        key := "RButton"
        sensitivity := 10 ; настройка чувствительности
        MouseGetPos &x1, &y1 ; хватаем позицию курсора мыши
        Sleep 200

        If !GetKeyState(key, "P") ; если по окончании задержки клавиша отпущена
        {
            MouseClick("Right") ; выполнить обычное действие клавиши
            ; ShowAction = %A_ThisHotkey% Click ; выставить переменной "ShowAction" значение для отображения в окошке
            ; ShowToolTip(ShowAction)
            ; Goto,RemoveToolTip ; перейти к завершающему разделу
            ; Gosub,ShowToolTip ; пойти на "показуху" - раздел "ShowToolTip"
            ; Goto,RemoveToolTip ; перейти к завершающему разделу

            ; x1 := x2
            ; y1 := y2
            ; ToolTip A_ThisHotkey Click ; отображать ToolTip`ом название нажатой кнопке
            ; Sleep 100 ; задержка на отображение ToolTip
            ; ToolTip ; по истечении задержки убираем ToolTip
            Return ; полный конец
        }

        Loop
        {
            MouseGetPos &x2, &y2 ; взять текущую позицию курсора
            ; назначаем разные действия по разнице начальных и конечных координат:

            If (x1 - x2 > sensitivity and y1 - y2 < sensitivity) {	; влево
                Send("+!{Tab}")
                ; Msg("Left")
                return
            }

            If (x1 - x2 < -sensitivity and y1 - y2 < sensitivity)	; вправо
            {
                Send("!{Tab}")
                ; Msg("Right")
                return
            }

            If (x1 - x2 < sensitivity and y1 - y2 > sensitivity)	; вверх
            {
                ; Msg("Up")
                return
            }

            If (x1 - x2 < sensitivity and y1 - y2 < -sensitivity)	; вниз
            {
                ; Msg("Down")
                return
            }

            ; If (x1-x2 > sensitivity and y1-y2 > sensitivity) ; вверх-влево
            ; {
            ;     Msg("Left and Up")
            ; }
            ; If (x1-x2 < -sensitivity and y1-y2 > sensitivity) ; вверх-вправо
            ; {
            ;     Msg("Right and Up")
            ; }
            ; If (x1-x2 > sensitivity and y1-y2 < -sensitivity) ; вниз-влево
            ; {
            ;     Msg("Left and Down")
            ; }
            ; If (x1-x2 < -sensitivity and y1-y2 < -sensitivity) ; вниз-вправо
            ; {
            ;     Msg("Right and Down")
            ; }


            If !GetKeyState(key, "P") { ; по отжатии
                        Msg("Break")
                break
            }
            ; Goto,RemoveToolTip ; перейти к завершающему разделу
        }

        ; ShowToolTip(ShowAction){
        ;     ; "ПОКАЗУХА"
        ;     ; присваиваем конечные координаты начальным переменным
        ;     ; для отслеживания изменения относительно нового положения курсора
        ;     x1 := x2
        ;     y1 := y2
        ;     ToolTip ShowAction ; отображать ToolTip`ом название нажатой кнопке
        ;     Sleep 100 ; задержка на отображение ToolTip
        ;     ToolTip ; по истечении задержки убираем ToolTip
        ;     Return ; полный конец
        ; }
    }
    ;     RemoveToolTip:
    ;     Sleep,100 ; задержка на отображение ToolTip
    ;     ToolTip ; по истечении задержки убираем ToolTip
    ;     Return ; полный конец
    ; }
}