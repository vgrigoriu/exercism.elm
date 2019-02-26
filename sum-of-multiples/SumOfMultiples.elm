module SumOfMultiples exposing (sumOfMultiples)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples factors limit =
    List.range 1 (limit - 1)
        |> List.filter (isMultipleOfAny factors)
        |> List.sum


isMultipleOfAny : List Int -> Int -> Bool
isMultipleOfAny factors n =
    List.any (\factor -> modBy factor n == 0) factors
