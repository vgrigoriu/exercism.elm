module TwelveDays exposing (recite)

import Array exposing (..)


recite : Int -> Int -> List String
recite start stop =
    List.range start stop
        |> List.map verse


allThings =
    Array.fromList
        [ ""
        , "a Partridge in a Pear Tree"
        , "two Turtle Doves"
        , "three French Hens"
        , "four Calling Birds"
        , "five Gold Rings"
        , "six Geese-a-Laying"
        , "seven Swans-a-Swimming"
        , "eight Maids-a-Milking"
        , "nine Ladies Dancing"
        , "ten Lords-a-Leaping"
        , "eleven Pipers Piping"
        , "twelve Drummers Drumming"
        ]


days =
    Array.fromList [ "", "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" ]


verse : Int -> String
verse number =
    let
        day =
            days
                |> Array.get number
                |> Maybe.withDefault "nanana"

        things =
            getThings number
    in
    "On the " ++ day ++ " day of Christmas my true love gave to me, " ++ things ++ "."


getThings : Int -> String
getThings day =
    let
        thing =
            allThings
                |> Array.get day
                |> Maybe.withDefault "yiyiyi"
    in
    case day of
        1 ->
            thing

        2 ->
            thing ++ ", and " ++ getThings (day - 1)

        _ ->
            thing ++ ", " ++ getThings (day - 1)
