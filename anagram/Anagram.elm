module Anagram exposing (detect)


detect : String -> List String -> List String
detect word =
    let
        sortedWord =
            sortLetters word

        lowerWord =
            String.toLower word

        isAnagram candidate =
            String.toLower candidate /= lowerWord && sortedWord == sortLetters candidate
    in
    List.filter isAnagram


sortLetters : String -> String
sortLetters =
    String.toList
        >> List.map Char.toLower
        >> List.sort
        >> String.fromList
