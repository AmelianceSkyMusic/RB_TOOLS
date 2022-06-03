isMouseOnRightEdge(){
    CoordMode "Mouse", "Screen"
    MouseGetPos(&MouseX, &MouseY)
    MouseOnRightEdge := (MouseX >= 1364  and MouseX <= 1365) and (MouseY >= 0 and MouseY <= 767)
    return MouseOnRightEdge
}

isMouseOnLeftEdge(){
    CoordMode "Mouse", "Screen"
    MouseGetPos(&MouseX, &MouseY)
    MouseOnLeftEdge := (MouseX >= 0  and MouseX <= 0) and (MouseY >= 0 and MouseY <= 767)
    return MouseOnLeftEdge
}

WheelDown::{
if (isMouseOnRightEdge()) {
        Send('{LWIN DOWN}{SPACE}')
        KeyWait('LBUTTON', 'D T0.3')
        Send('{LWIN UP}')
        return
    }
    Send('{WheelDown}')
}

WheelUp::{
if (isMouseOnRightEdge()) {
        Send('{LWIN DOWN}{SHIFT DOWN}{SPACE}')
        KeyWait('LBUTTON', 'D T0.3')
        Send('{LWIN UP}{SHIFT UP}')
        return
    }
    Send('{WheelUp}')
}