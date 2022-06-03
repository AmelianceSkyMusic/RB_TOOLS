
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
    windowsMap := Map()

    addListener(title, key, windowsMap) {

        imgPath := A_ScriptDir '\img\'
        title := WinGetTitle('A')
        Try {
            if (windowsMap[title][key]['img']) {
                img := windowsMap[title][key]['img']
                xOffset := windowsMap[title][key]['xOffset']
                yOffset := windowsMap[title][key]['yOffset']
                isImageClick_FC(imgPath, img, xOffset, yOffset)
            }
        } catch error {
            Msg('No window on focus!')
        }

    }


    Loop Parse, sectionNamesString, '`n', '`r' { ; Get all sections count

        sectionName := A_LoopField ; section name

        sectionLines  := IniRead(configPath, sectionName)

        windowsMap[sectionName] := Map()

        Loop Parse, sectionLines, '`n', '`r' { ; Get all sections count

            params := StrSplit(A_LoopField, '=')[2]

            userkeyCustom := Trim(StrSplit(params, '|')[1])
            userkey := ''
            Loop parse, userkeyCustom, "+" {
                covertedKey := StrLower(A_LoopField)
                covertedKey := StrReplace(covertedKey, 'shift', '+')
                covertedKey := StrReplace(covertedKey, 'ctrl', '^')
                covertedKey := StrReplace(covertedKey, 'alt', '!')
                covertedKey := StrReplace(covertedKey, 'win', '#')
                userkey := userkey covertedKey
            }

            xOffset := Trim(StrSplit(params, '|')[2])
            yOffset := Trim(StrSplit(params, '|')[3])
            img     := Trim(StrSplit(params, '|')[4])

            windowsMap[sectionName].Set(
                userkey,
                Map(
                    'xOffset', xOffset,
                    'yOffset', yOffset,
                    'img', img
                )
            )

            do(key) {
                addListener(sectionName, key, windowsMap)
            }

            hotkey userkey, do
        }

    }

} else {
    MsgBox 'The target file does not exist.'
}
