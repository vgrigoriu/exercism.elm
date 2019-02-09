module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


squareOfSum : Int -> Int
squareOfSum n =
    let
        sum =
            n * (n + 1) // 2
    in
    sum * sum


sumOfSquares : Int -> Int
sumOfSquares n =
    n * (n + 1) * (2 * n + 1) // 6


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
