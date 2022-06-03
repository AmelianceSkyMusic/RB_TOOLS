
;# Win   ! Alt   ^ Ctrl   + Shift
#SingleInstance ignore
SetKeyDelay -1

!Esc::Reload

#include say.ahk
#include images.ahk
; Say 'SCRIPTS ARE LOADED'
Say('SCRIPTS ARE LOADED', 0.4)

;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------



configPath := A_ScriptDir '\config.ini'

if FileExist(configPath) {

    sectionNamesString := IniRead(configPath) ; Get selection names in separete '`n' string

    addListener(title, prevHotkey, nextHotkey) {
        key := prevHotkey ? prevHotkey : nextHotkey
        Loop Parse, sectionNamesString, '`n', '`r' { ; Get all sections count
            sectionName := A_LoopField ; section name
            imgPath := A_ScriptDir '\img\'
            img                    := IniRead(configPath, sectionName, 'img_path')
            previousCoordinatesOffset  := IniRead(configPath, sectionName, 'previous_coordinates_offset')
            nextCoordinatesOffset      := IniRead(configPath, sectionName, 'next_coordinates_offset')
            title := WinGetTitle("A")
            if title = sectionName {
                Msg(imgPath)
                try {
                    isImageClick_FC(imgPath, img, 16, 16)
                } catch error {
                    Msg(error)
                }
                ; MsgBox(imgPath)
            }
        }
    }


    Loop Parse, sectionNamesString, '`n', '`r' { ; Get all sections count


        sectionName := A_LoopField ; section name

        previousHotkey  := IniRead(configPath, sectionName, 'previous_hotkey')
        nextHotkey      := IniRead(configPath, sectionName, 'next_hotkey')

        doPrev(key) {
            addListener(sectionName, key, '')
        }
        doNext(key) {
            addListener(sectionName, '', key)
        }

        hotkey previousHotkey, doPrev
        hotkey nextHotkey, doNext

    }

} else {

    MsgBox 'The target file does not exist.'
}
