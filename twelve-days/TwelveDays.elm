module TwelveDays exposing (recite)

import Array exposing (..)


recite : Int -> Int -> List String
recite start stop =
    List.range start stop
        |> List.map verse


things =
    Array.fromList
        [ "", "a Partridge in a Pear Tree" ]


days =
    Array.fromList [ "", "first" ]


verse : Int -> String
verse number =
    let
        day =
            days
                |> Array.get number
                |> Maybe.withDefault "nanana"

        thing =
            things
                |> Array.get number
                |> Maybe.withDefault "yiyiyi"
    in
    "On the " ++ day ++ " day of Christmas my true love gave to me, " ++ thing ++ "."
