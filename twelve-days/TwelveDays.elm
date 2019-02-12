module TwelveDays exposing (recite)

import Array exposing (..)


recite : Int -> Int -> List String
recite start stop =
    List.range start stop
        |> List.map verse


allThings =
    Array.fromList
        [ ""
        , "a Partridge in a Pear Tree."
        , "two Turtle Doves, and"
        , "three French Hens,"
        , "four Calling Birds,"
        , "five Gold Rings,"
        , "six Geese-a-Laying,"
        , "seven Swans-a-Swimming,"
        , "eight Maids-a-Milking,"
        , "nine Ladies Dancing,"
        , "ten Lords-a-Leaping,"
        , "eleven Pipers Piping,"
        , "twelve Drummers Drumming,"
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
    "On the " ++ day ++ " day of Christmas my true love gave to me, " ++ things


getThings : Int -> String
getThings day =
    List.range 1 day
        |> List.reverse
        |> List.map getThing
        |> String.join " "


getThing : Int -> String
getThing day =
    Array.get day allThings
        |> Maybe.withDefault "???"
