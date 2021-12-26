offsets := Map(
    "ableton"    , {x:   0, y:  100},
    "reaper"     , {x:   0, y:  -55},
    "studio one" , {x:   0, y:    0},
  )

    ; offsets["new"].Set("x", 5, "y", 3)
    offsets.Set("new", {x: 5, y: 3})

  Say(offsets["new"].x)






offsets := Map(
    "ableton"    , {x:   0, y:  100},
    "reaper"     , {x:   0, y:  -55},
    "studio one" , {x:   0, y:    0},
  )
    newd := "new"
    ; offsets["new"].Set("x", 5, "y", 3)
    offsets.Set(newd, {x: 5, y: 3})

  Say(offsets[newd].x)