module Raindrops exposing (raindrops)

import Dict


factors : Dict.Dict Int String
factors =
    Dict.fromList [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]


raindrops : Int -> String
raindrops number =
    let
        result =
            convert number
    in
    case result of
        "" ->
            String.fromInt number

        _ ->
            result


convert : Int -> String
convert number =
    Dict.foldl (appendIfDivisible number) "" factors


appendIfDivisible : Int -> Int -> String -> String -> String
appendIfDivisible number factor output result =
    case modBy factor number of
        0 ->
            String.append result output

        _ ->
            result
