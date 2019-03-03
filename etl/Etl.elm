module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform input =
    innerTransform input Dict.empty


innerTransform : Dict Int (List String) -> Dict String Int -> Dict String Int
innerTransform input result =
    case Dict.toList input of
        [] ->
            result

        ( score, letters ) :: _ ->
            innerTransform (Dict.remove score input) (add result score letters)


add : Dict String Int -> Int -> List String -> Dict String Int
add result score letters =
    case letters of
        [] ->
            result

        letter :: rest ->
            add (Dict.insert (String.toLower letter) score result) score rest
