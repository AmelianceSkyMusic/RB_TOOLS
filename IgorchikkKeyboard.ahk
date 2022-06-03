;# Win   ! Alt   ^ Ctrl   + Shift
#HotIf

F1::{
	MsgBox("
	(
Igorchikk Keyboard


МОДИФІКАТОР:

CAPS`t—`tКлавіша яку потрібно тримати натиснутою
`t`tдля активації режиму модифікації клавіш

`t`t(найзручніше зажимати мізинцем лівої руки,
`t`tтоді решта пальців автоматично стають
`t`tна потрібні позиції)


ГАРЯЧІ КЛАВІШІ ДЛЯ ЛІВОЇ РУКИ:

A`t—`tLeft
D`t—`tRight
W`t—`tUp
S`t—`tDown
Q`t—`tHome
E`t—`tEnd
F`t—`tEnter


ГАРЯЧІ КЛАВІШІ ДЛЯ ПРАВОЇ РУКИ:

J`t—`tLeft
L`t—`tRight
I`t—`tUp
K`t—`tDown
U`t—`tHome
O`t—`tEnd
	)", "Igorchikk Keyboard", "")

}

CapsLock & j::      Send("{Blind}{Left}")
CapsLock & i::      Send("{Blind}{Up}")
CapsLock & l::      Send("{Blind}{Right}")
CapsLock & k::      Send("{Blind}{Down}")
CapsLock & u::      Send("{Blind}{Home}")
CapsLock & o::      Send("{Blind}{End}")

CapsLock & a::      Send("{Blind}{Left}")
CapsLock & w::      Send("{Blind}{Up}")
CapsLock & d::      Send("{Blind}{Right}")
CapsLock & s::      Send("{Blind}{Down}")
CapsLock & q::      Send("{Blind}{Home}")
CapsLock & e::      Send("{Blind}{End}")
CapsLock & f::      Send("{Blind}{Enter}")
