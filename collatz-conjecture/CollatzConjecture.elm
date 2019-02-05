module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    if start <= 0 then
        Err "Only positive numbers are allowed"

    else if start == 1 then
        Ok 0

    else if modBy 2 start == 0 then
        Result.map ((+) 1) (collatz (start // 2))

    else
        Result.map ((+) 1) (collatz (3 * start + 1))
