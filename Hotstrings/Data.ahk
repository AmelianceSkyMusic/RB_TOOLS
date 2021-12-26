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

 data_ahk := {}
 data_ahk.keyPath := A_WorkingDir "\Hotstrings\Data\Keys\"
 if FileExist(data_ahk.keyPath "key.txt") {
    dataKey := FileRead(data_ahk.keyPath "key.txt")
 } else {
     SoundPlay "*-1, WAIT"
     ; Say("Something.AHK.can't find key.txt! Generate a new key. Don't foget to save the key!", 2, , , , "WRNNG")
     MsgBox('"Something.ahk"' "can't find key.txt file!`nIt will be generating a new key.`nDon't forget to save the key!", , "Ok icon!")
 }


; :x*:zzz::Send(bin2txt2dec("11111100 12221112 02121101 11210110 11221012 12202212 02210212 12121020 11101111 11220201 11111212 02212011 01221210 11110110 02212101 11201201 12221021 02111102 11210110 11210012 12202211 02200211 11111010 12101122 11211201 11112112 02201022 01212121 11110110 02221201 11202100 12211112 01111001 11210120 11110022 12202212 02201221 12121120 12101212 11220111 11121211 01201011 00221111 11120110 01211101 11211200 12212122 01111001 11220120 10210021 11201101 02200121 12121111 12111211 11220201 11112222 02202121 00211111", dataKey))
