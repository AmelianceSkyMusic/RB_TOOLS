;;bin2dec           convert bin to dec
  bin2dec(n) {
    return convertBase(2, 10, n)
    ; k := StrLen(n)
    ; r := 0
    ; loop Parse, n
    ;   r |= A_LoopField << --k
    ; return r
  }

  ;;dec2bin           convert dec to bin
  dec2bin(n) {
    return convertBase(10, 2, n)
    ; r := ''
    ; while n
    ;   r := 1 & n r, n >>= 1
    ; return r
  }

;;dec2hex           convert dec to hex
  dec2hex(n) {
    return convertBase(10, 16, n)
  }

;;convertBase       convert numbers from one system to another
  convertBase(InputBase, OutputBase, number) { ;Base 2 - 36
    s := ""
    VarSetStrCapacity(&s, 66)
    value := DllCall("msvcrt.dll\_wcstoui64", "Str",number, "UInt",0, "UInt",InputBase, "CDECL Int64")
    DllCall("msvcrt.dll\_i64tow", "Int64",value, "Str",s, "UInt",OutputBase, "CDECL")
    return s
  }

;;hex2dec           convert hex to dec
  hex2dec(n) {
    return convertBase(16, 10, n)
  }

;;hex2str           convert hex to string
  hex2str(text) { ;'abcdef' => '«Íï' or 'ab cd ef' => '«Íï'
    r := ''
    text := RegExReplace(text, " ", "")
    if Mod(StrLen(text), 2) ;check string length for even
      return

    loop StrLen(text)/2
      r .= Chr(DllCall("msvcrt.dll\_wcstoui64", "Str",SubStr(text, (A_Index - 1) * 2 + 1, 2), "Uint",0, "UInt",16, "CDECL Int64"))
    return r
  }

  ;;str2hex           convert string to hex
  str2hex(str, separator := "") {
    hex := Array()
    ; loop Parse, str {
    ;   s := ""
    ;   VarSetStrCapacity(&s, 65)
    ;   DllCall("msvcrt.dll\_i64tow", "Int64",Ord(A_LoopField), "Str",s, "UInt",16, "CDECL")
    ;   hex.Push(s)
    ; }

    u16to8(s) {
      return s < 0x80 ? toHex2(s) : (s < 0x800 ? toHex2(s >> 6 & 0x1f | 0xc0) : toHex2(s >> 12 | 0xe0) toHex2(s >> 6 & 0x3f | 0x80)) toHex2(s & 0x3f | 0x80)
    }

    toHex2(num) {
      return SubStr(Format("{:X}", num), -2)
    }

    loop Parse, str
      hex.Push(u16to8(Ord(A_LoopField)))
      ; hex.Push(Format("{:X}", Ord(A_LoopField)))
    return join(hex, separator)
  }

  ;;join              join array
  join(arr, sep1 := "", sep2 := "") {
    result := ""
    switch Type(arr), 0 {
      case "map":
        for k,v in arr
          result .= k sep1 v sep2
        if StrLen(sep2)
          result := SubStr(result, 1, -StrLen(sep1))

      case "array":
        for v in arr
          result .= v sep1
        if StrLen(sep1)
          result := SubStr(result, 1, -StrLen(sep1))

      default:
        throw {what: "Error: arg1 has type neither Array nor Map", file: A_LineFile, line: A_LineNumber}
    }
    if result != ""
      return result
  }
