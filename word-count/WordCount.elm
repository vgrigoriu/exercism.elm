module WordCount exposing (wordCount)

import Dict exposing (Dict)
import Regex


wordCount : String -> Dict String Int
wordCount =
    normalize
        >> String.trim
        >> String.split " "
        >> List.foldl count Dict.empty


count : String -> Dict String Int -> Dict String Int
count word =
    Dict.update (String.toLower word) inc


inc : Maybe Int -> Maybe Int
inc =
    Maybe.withDefault 0
        >> (+) 1
        >> Just


normalize sentence =
    case Regex.fromString "[:!&@$%^, ]+" of
        Just regex ->
            Regex.replace regex (\_ -> " ") sentence

        Nothing ->
            sentence
