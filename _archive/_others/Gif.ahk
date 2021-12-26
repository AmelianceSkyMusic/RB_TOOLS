  test := Gif(A_ScriptDir "\test.gif")

  class Gif {
    Win := ""
    __New(path) {
      if not FileExist(path)
        return
      this.Win := Gui("-border -Caption ")
      size := this._getDimensions(path)
      ; w := q.Add("ActiveX", "x0 y0 w" ww " h" hh, "mshtml:<style>*{border:0;margin:0}</style><img style=border:0;padding:0 src='" pic "' />")
      image := this.Win.Add("ActiveX", "x0 y0 w" size[1] " h" size[2], "Shell.Explorer").Value
      image.Navigate("about:blank")
      image.document.write("<style>*{overflow:hidden;border:0;margin:0;padding:0}</style><img src='" path "' />")
      this.Win.Show("AutoSize Center")
      ; WinSetTransColor("ffffff", "gui title")
    }

    _getDimensions(path) {
      win := Gui()
      image := win.Add("Picture",, path)
      w := h := 0
      ControlGetPos ,, &w, &h, image.Hwnd
      win.Destroy()
      return [w, h]
    }

    Show(arg) {
      this.Image.Show(arg)
    }
  }

