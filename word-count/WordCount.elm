module WordCount exposing (wordCount)

import Dict exposing (Dict)


wordCount : String -> Dict String Int
wordCount =
    normalize
        >> String.trim
        >> String.split " "
        >> List.filter ((/=) "")
        >> List.foldl count Dict.empty


count : String -> Dict String Int -> Dict String Int
count word =
    Dict.update (String.toLower word) inc


inc : Maybe Int -> Maybe Int
inc =
    Maybe.withDefault 0
        >> (+) 1
        >> Just


normalize : String -> String
normalize =
    String.filter (not << isSeparator)


isSeparator : Char -> Bool
isSeparator c =
    String.any (\sep -> c == sep) ":!&@$%^,"
