module RNATranscription exposing (toRNA)


type Dna
    = DnaT
    | DnaA
    | DnaG
    | DnaC


type Rna
    = RnaA
    | RnaU
    | RnaC
    | RnaG


toRNA : String -> Result Char String
toRNA =
    toDna2
        >> Result.map (List.map complement)
        >> Result.map (List.map fromRna)
        >> Result.map String.fromList


toDna2 : String -> Result Char (List Dna)
toDna2 str =
    str
        |> String.toList
        |> List.map toDna
        |> List.foldr extractResult (Ok [])


extractResult : Result error value -> Result error (List value) -> Result error (List value)
extractResult maybeItem maybeList =
    case maybeItem of
        Ok item ->
            Result.map ((::) item) maybeList

        Err err ->
            Err err


toDna : Char -> Result Char Dna
toDna nucleotide =
    case nucleotide of
        'T' ->
            Ok DnaT

        'A' ->
            Ok DnaA

        'G' ->
            Ok DnaG

        'C' ->
            Ok DnaC

        _ ->
            Err nucleotide


complement : Dna -> Rna
complement nucleotide =
    case nucleotide of
        DnaT ->
            RnaA

        DnaA ->
            RnaU

        DnaG ->
            RnaC

        DnaC ->
            RnaG


fromRna : Rna -> Char
fromRna rna =
    case rna of
        RnaA ->
            'A'

        RnaU ->
            'U'

        RnaC ->
            'C'

        RnaG ->
            'G'
