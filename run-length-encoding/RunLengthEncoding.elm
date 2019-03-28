module RunLengthEncoding exposing (decode, encode)


encode : String -> String
encode =
    encodeToListOfCounts
        >> encodeListOfCounts


decode : String -> String
decode =
    decodeToListOfCounts
        >> decodeListOfCounts


encodeToListOfCounts : String -> List ( Char, Int )
encodeToListOfCounts string =
    String.foldr addToRun [] string


addToRun : Char -> List ( Char, Int ) -> List ( Char, Int )
addToRun ch list =
    case list of
        [] ->
            [ ( ch, 1 ) ]

        ( c, n ) :: rest ->
            if c == ch then
                ( c, n + 1 ) :: rest

            else
                ( ch, 1 ) :: list


encodeListOfCounts : List ( Char, Int ) -> String
encodeListOfCounts list =
    case list of
        [] ->
            ""

        ( ch, n ) :: rest ->
            encodeRun ch n ++ encodeListOfCounts rest


encodeRun : Char -> Int -> String
encodeRun ch n =
    if n == 1 then
        String.fromChar ch

    else
        String.fromInt n ++ String.fromChar ch


decodeToListOfCounts : String -> List ( Char, Int )
decodeToListOfCounts string =
    case String.uncons string of
        Nothing ->
            []

        Just ( ch, rest ) ->
            case String.toInt (String.fromChar ch) of
                Nothing ->
                    -- first char is a letter
                    ( ch, 1 ) :: decodeToListOfCounts rest

                Just n ->
                    decodeToListOfCountsWithDigit n rest


decodeToListOfCountsWithDigit : Int -> String -> List ( Char, Int )
decodeToListOfCountsWithDigit n string =
    case String.uncons string of
        Nothing ->
            []

        Just ( ch, rest ) ->
            case String.toInt (String.fromChar ch) of
                Nothing ->
                    ( ch, n ) :: decodeToListOfCounts rest

                Just n2 ->
                    decodeToListOfCountsWithDigit (n * 10 + n2) rest


decodeListOfCounts : List ( Char, Int ) -> String
decodeListOfCounts list =
    case list of
        [] ->
            ""

        ( ch, n ) :: rest ->
            String.repeat n (String.fromChar ch) ++ decodeListOfCounts rest
