module Bob exposing (hey)


hey : String -> String
hey remark =
    if isSilence remark then
        "Fine. Be that way!"

    else if isYelling remark && isQuestion remark then
        "Calm down, I know what I'm doing!"

    else if isYelling remark then
        "Whoa, chill out!"

    else if isQuestion remark then
        "Sure."

    else
        "Whatever."


isYelling : String -> Bool
isYelling remark =
    remark == String.toUpper remark && String.any Char.isAlpha remark


isQuestion : String -> Bool
isQuestion remark =
    remark
        |> String.trim
        |> String.endsWith "?"


isSilence : String -> Bool
isSilence remark =
    remark
        |> String.trim
        |> String.isEmpty
