module Pangram exposing (isPangram)

import Set


isPangram : String -> Bool
isPangram =
    String.filter Char.isAlpha
        >> String.map Char.toLower
        >> String.toList
        >> Set.fromList
        >> Set.size
        -- a bit of a cheat, it only works if the input only has letters of the English alphabet
        >> (==) 26
