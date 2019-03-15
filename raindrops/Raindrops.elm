module Raindrops exposing (raindrops)

import Dict


factorsToWords =
    [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]


raindrops : Int -> String
raindrops number =
    let
        result =
            convertNumberToFactorWords number
    in
    case result of
        "" ->
            String.fromInt number

        _ ->
            result


convertNumberToFactorWords : Int -> String
convertNumberToFactorWords number =
    List.foldl (appendIfDivisible number) "" factorsToWords


appendIfDivisible : Int -> ( Int, String ) -> String -> String
appendIfDivisible number ( factor, word ) result =
    case modBy factor number of
        0 ->
            String.append result word

        _ ->
            result
