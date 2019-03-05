module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade student =
    Dict.update grade (addSorted student)


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade =
    Dict.get grade
        >> Maybe.withDefault []


allStudents : School -> List ( Grade, List Student )
allStudents =
    Dict.toList


addSorted : comparable -> Maybe (List comparable) -> Maybe (List comparable)
addSorted item maybeList =
    case maybeList of
        Just list ->
            Just (item :: list |> List.sort)

        Nothing ->
            Just (List.singleton item)
