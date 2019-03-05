module Anagram exposing (detect)


detect : String -> List String -> List String
detect word =
    List.filter (isAnagram word)


isAnagram : String -> String -> Bool
isAnagram word1 word2 =
    let
        lowerWord1 =
            String.toLower word1

        lowerWord2 =
            String.toLower word2
    in
    lowerWord1 /= lowerWord2 && sortLetters lowerWord1 == sortLetters lowerWord2


sortLetters : String -> String
sortLetters =
    String.toList
        >> List.sort
        >> String.fromList
