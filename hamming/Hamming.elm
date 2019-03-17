module Hamming exposing (distance)


distance : String -> String -> Result String Int
distance left right =
    if String.length left /= String.length right then
        Err "left and right strands must be of equal length"

    else
        List.map2 (\c1 c2 -> c1 /= c2) (String.toList left) (String.toList right)
            |> List.filter (\different -> different)
            |> List.length
            |> Ok
