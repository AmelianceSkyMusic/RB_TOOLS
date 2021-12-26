;# Win   ! Alt   ^ Ctrl   + Shift
PasteText(text) {
    ClipSaved := ClipboardAll()
    A_Clipboard := text
    Send "^v"
    Sleep 200
    A_Clipboard := ClipSaved
}