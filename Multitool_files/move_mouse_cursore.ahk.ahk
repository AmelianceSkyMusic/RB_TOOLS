; Move mouse cursore of window on 1px
^#UP::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos, start_ypos-1, 1
return
^#DOWN::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos, start_ypos+1, 1
return
^#LEFT::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos-1, start_ypos, 1
return
^#RIGHT::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos+1, start_ypos, 1
return

; Move mouse cursore of window on 10px
^+#UP::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos, start_ypos-10, 1
return
^+#DOWN::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos, start_ypos+10, 1
return
^+#LEFT::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos-10, start_ypos, 1
return
^+#RIGHT::
MouseGetPos start_xpos, start_ypos
MouseMove start_xpos+10, start_ypos, 1
return