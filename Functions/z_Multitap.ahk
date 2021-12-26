mt(key, deley := 200) {

    counter := 1
    while KeyWait(key, "T." deley)

        if KeyWait(key, "D T.1") {
            counter++
        } else {
            return counter
        }

    KeyWait(key)

    return -counter
}