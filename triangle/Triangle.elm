module Triangle exposing (Triangle(..), triangleKind)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    if not <| lengthsArePositive x y z then
        Err "Invalid lengths"

    else if not <| sidesMeet x y z then
        Err "Violates inequality"

    else if allAreEqual x y z then
        Ok Equilateral

    else if twoAreEqual x y z then
        Ok Isosceles

    else
        Ok Scalene


lengthsArePositive : number -> number -> number -> Bool
lengthsArePositive x y z =
    x > 0 && y > 0 && z > 0


sidesMeet : number -> number -> number -> Bool
sidesMeet x y z =
    x + y > z && x + z > y && y + z > x


allAreEqual : number -> number -> number -> Bool
allAreEqual x y z =
    x == y && y == z


twoAreEqual : number -> number -> number -> Bool
twoAreEqual x y z =
    x == y || y == z || x == z
