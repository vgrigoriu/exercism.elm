module Gigasecond exposing (add)

import Time exposing (millisToPosix, posixToMillis)


add : Time.Posix -> Time.Posix
add =
    posixToMillis
        >> (+) gigasecondInMillis
        >> millisToPosix


gigasecondInMillis : Int
gigasecondInMillis =
    10 ^ 9 * 1000
