module RNATranscription exposing (toRNA)


toRNA : String -> Result Char String
toRNA =
    String.toList
        >> List.foldl concat (Ok [])
        >> Result.map List.reverse
        >> Result.map String.fromList


concat : Char -> Result Char (List Char) -> Result Char (List Char)
concat nucleotide result =
    case complement nucleotide of
        Ok n ->
            Result.map ((::) n) result

        Err n ->
            Err n


complement : Char -> Result Char Char
complement nucleotide =
    case nucleotide of
        'T' ->
            Ok 'A'

        'A' ->
            Ok 'U'

        'G' ->
            Ok 'C'

        'C' ->
            Ok 'G'

        _ ->
            Err nucleotide
