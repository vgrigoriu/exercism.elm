module Accumulate exposing (accumulate)


accumulate : (a -> b) -> List a -> List b
accumulate func input =
    List.reverse <| tailAccumulate func input []


tailAccumulate : (a -> b) -> List a -> List b -> List b
tailAccumulate func input accumulator =
    case input of
        [] ->
            accumulator

        head :: tail ->
            tailAccumulate func tail (func head :: accumulator)
