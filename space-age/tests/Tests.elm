module Tests exposing (tests)

import Expect
import SpaceAge exposing (Planet(..), ageOn)
import Test exposing (..)


tests : Test
tests =
    describe "SpaceAge"
        [ test "age in earth years" <|
            \() -> Expect.equal 32 (round (ageOn Earth 1000000000.0))
        , test "age in mercury years" <|
                \() -> Expect.equal 281 (round (ageOn Mercury 2134835688.0))
        , test "age in venus years" <|
                \() -> Expect.equal 10 (round (ageOn Venus 189839836.0))
        , test "age on mars" <|
                \() -> Expect.equal 39 (round (ageOn Mars 2329871239.0))
        , test "age on jupiter" <|
                \() -> Expect.equal 2 (round (ageOn Jupiter 901876382.0))
        , test "age on saturn" <|
                \() -> Expect.equal 3 (round (ageOn Saturn 3000000000.0))
        , test "age on uranus" <|
                \() -> Expect.equal 1 (round (ageOn Uranus 3210123456.0))
        , test "age on neptune" <|
                \() -> Expect.equal 2 (round (ageOn Neptune 8210123456.0))
        ]
