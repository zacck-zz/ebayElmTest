module Suite exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Math tests"
      [ test "Addition works" <|
        \() ->
          4 |> Expect.equal (3 + 1)
      ]
