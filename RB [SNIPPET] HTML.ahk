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

; ================================================================
; ================================================================
; ================================================================
#HotIf not WinActive("ahk_exe code.exe") and not WinActive("ahk_exe photoshop.exe") and not WinActive("ahk_exe illustrator.exe") and not WinActive("ahk_exe figma.exe")
; :*:(::(){LEFT}
; :*:[::[]{LEFT}
; :*:{::{{}{}}{LEFT}
; :*:('::(''){LEFT 2}
; :*:("::(""){LEFT 2}
; :*:"::""{LEFT}
; :*:'::''{LEFT}

; ---------- html ----------

::<p::<p></p>{LEFT 4}
::<h1::<h1></h1>{LEFT 5}
::<h2::<h2></h2>{LEFT 5}
::<h3::<h3></h3>{LEFT 5}
::<h4::<h4></h4>{LEFT 5}
::<h5::<h5></h5>{LEFT 5}
::<h6::<h6></h6>{LEFT 5}

::<ul::<ul>`n+{TAB}</ul>{LEFT 5}{ENTER}{UP}{TAB}
::<ol::<ol>`n+{TAB}</ol>{LEFT 5}{ENTER}{UP}{TAB}
::<li::<li></li>{LEFT 5}

::<pre::<pre></pre>{LEFT 6}
::<span::<span></span>{LEFT 7}

::<a::<a href=""></a>{LEFT 6}
::<img::<img src="" alt="">{LEFT 9}
::<audio::<audio src="" controls></audio>{LEFT 19}
::<audios::<audio controls>{`n}<source src="">{`n}<source src="">{`n}</audio>{LEFT 33}
::<video::<video src="" controls></video>{LEFT 19}
::<videos::<video controls>{`n}<source src="" type="video/">>{`n}<source src="" type="video/">{`n}</video>{LEFT 60}
; ::<audio::<audio src="" controls></audio>{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}{LEFT}

::<icon::<link rel="icon" href="">{LEFT 2}
::<icon16::<link rel="icon" href="" type="image/png" sizes="16x16">{LEFT 33}
::<icon32::<link rel="icon" href="" type="image/png" sizes="32x32">{LEFT 33}
::<icon64::<link rel="icon" href="" type="image/png" sizes="64x64">{LEFT 33}

::<code::<code></code>{LEFT 7}

::<title::<title></title>{LEFT 8}
::<description::<meta name="description" content="">{LEFT 2}
; Все OG теги можно посмотреть в официальной документации
; https://developers.facebook.com/docs/sharing/webmasters?locale=ru_RU
::<ogtitle::<meta property="og:title" content="">{LEFT 2}
::<ogdescription::<meta property="og:description" content="">{LEFT 2}
::<ogimage::<meta property="og:image" content="">{LEFT 2}

::<form::<form action="">`n+{TAB}</form>{LEFT 7}{ENTER}{UP}{TAB}
::<inputtext::<label><input type="text"></label>{LEFT 8}
::<inputcheckbox::<label><input type="checkbox" name="" value=""></label>{LEFT 8}
::<inputradio::<label><input type="radio" name="" value=""></label>{LEFT 8}
::<inputcheckboxid::<input id="" type="checkbox" name=""><label for=""></label>{LEFT 8}
::<inputradioid::<input id="" type="radio" name=""><label for=""></label>{LEFT 8}
::<textarea::<textarea rows="" cols=""></textarea>{LEFT 11}
::<selectdisabled::<select disabled>`n+{TAB}</select>{LEFT 9}{ENTER}{UP}{TAB}<option></option>{LEFT 9}
::<selectmultiple::<select multiple>`n+{TAB}</select>{LEFT 9}{ENTER}{UP}{TAB}<option></option>{LEFT 9}
::<select::<select>`n+{TAB}</select>{LEFT 9}{ENTER}{UP}{TAB}<option></option>{LEFT 9}
::<option::<option></option>{LEFT 9}
::<button::<button></button>{LEFT 9}

::<main::<main>`n+{TAB}</main>{LEFT 7}{ENTER}{UP}{TAB}
::<article::<article>`n+{TAB}</article>{LEFT 10}{ENTER}{UP}{TAB}
::<header::<header>`n+{TAB}</header>{LEFT 9}{ENTER}{UP}{TAB}
::<footer::<footer>`n+{TAB}</footer>{LEFT 9}{ENTER}{UP}{TAB}
::<address::<address>`n+{TAB}</address>{LEFT 9}{ENTER}{UP}{TAB}
::<time::<time datetime="yyyy-mm-dd"></time>{LEFT 7}


::<aside::<aside>`n+{TAB}</aside>{LEFT 8}{ENTER}{UP}{TAB}
::<div::<div></div>{LEFT 6}
::<nav::<nav>`n+{TAB}</nav>{LEFT 6}{ENTER}{UP}{TAB}




; ::<section::<section itemscope itemtype="">`n+{TAB}</section>{LEFT 9}{ENTER}{UP}{TAB}
::<section::<section>`n+{TAB}</section>{LEFT 10}{ENTER}{UP}{TAB}
::<sectionitem::<p><span itemprop=""></span></p>{LEFT 13}



::<tr::<tr></tr>{LEFT 5}
::<td::<td></td>{LEFT 5}
::<th::<th></th>{LEFT 5}
::<table::<table></table>{LEFT 8}
::<thead::<thead></thead>{LEFT 8}
::<tbody::<tbody></tbody>{LEFT 8}

::<style::<style>`n+{TAB}</style>{LEFT 8}{ENTER}{UP}{TAB}



::id::id=""{LEFT}
::class::class=""{LEFT}
::width::width=""{LEFT}
::height::height=""{LEFT}
::style::style=""{LEFT}









