module RNATranscription exposing (toRNA)


type Dna
    = DnaT
    | DnaA
    | DnaG
    | DnaC
    | InvalidDna Char


type Rna
    = RnaA
    | RnaU
    | RnaC
    | RnaG
    | InvalidRna Char


toRNA : String -> Result Char String
toRNA =
    String.toList
        >> List.map toDna
        >> List.map complement
        >> List.map fromRna
        >> String.fromList
        >> Ok


toDna : Char -> Dna
toDna nucleotide =
    case nucleotide of
        'T' ->
            DnaT
    
        'A' ->
            DnaA

        'G' ->
            DnaG
    
        'C' ->
            DnaC

        _ ->
            InvalidDna nucleotide



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

        InvalidDna c ->
            InvalidRna c

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

        InvalidRna c ->
            c