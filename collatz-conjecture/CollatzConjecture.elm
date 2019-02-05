module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    if start <= 0 then
        Err "Only positive numbers are allowed"

    else
        Ok <| collatzRec start 0


collatzRec : Int -> Int -> Int
collatzRec start acc =
    if start == 1 then
        acc

    else if modBy 2 start == 0 then
        collatzRec (start // 2) acc + 1

    else
        collatzRec (3 * start + 1) acc + 1
