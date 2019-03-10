module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    List.foldr
        (\x xs ->
            if predicate x then
                x :: xs

            else
                xs
        )
        []
        list


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    keep (\x -> not (predicate x)) list
