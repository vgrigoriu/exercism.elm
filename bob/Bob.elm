module Bob exposing (hey)


hey : String -> String
hey remark =
    if isYelling remark then
        "Whoa, chill out!"
    else
        "Whatever."

isYelling : String -> Bool
isYelling remark =
    remark == String.toUpper remark