module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts =
    String.foldl increment zeroes


increment : Char -> NucleotideCounts -> NucleotideCounts
increment nucleotide counts =
    case nucleotide of
        'A' ->
            { counts | a = counts.a + 1 }

        'T' ->
            { counts | t = counts.t + 1 }

        'C' ->
            { counts | c = counts.c + 1 }

        'G' ->
            { counts | g = counts.g + 1 }

        _ ->
            counts


zeroes : NucleotideCounts
zeroes =
    { a = 0, t = 0, c = 0, g = 0 }
