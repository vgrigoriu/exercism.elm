module Raindrops exposing (raindrops)

import Dict


factors : Dict.Dict Int String
factors =
    Dict.fromList [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]


raindrops : Int -> String
raindrops number =
    let
        result =
            x number
    in
    case result of
        "" ->
            String.fromInt number

        _ ->
            result


x : Int -> String
x number =
    Dict.foldl (f number) "" factors


f : Int -> Int -> String -> String -> String
f number factor output result =
    case modBy factor number of
        0 ->
            String.append result output

        _ ->
            result
