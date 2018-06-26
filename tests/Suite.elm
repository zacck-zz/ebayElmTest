module Suite exposing (..)

import Expect exposing (Expectation)
import Main exposing(..)
import Test exposing (..)


model : Model
model =
  { q = ""
  , price = ""
  , priceCurrency = ""
  , accountType = ""
  }

modelTest : Test
modelTest =
  describe "update"
      [ describe "SetTerm"
          [ test "adds a term to the state" <|
              \_ ->
                  model
                      |> update (SetTerm "qq")
                      |> Tuple.first
                      |> Expect.equal
                             { q = "qq"
                              , price = ""
                              , priceCurrency = ""
                              , accountType = ""
                             }

          ]
      ]


suite : Test
suite =
    describe "Tests"
      [ test "Addition works" <|
        \() ->
          4 |> Expect.equal (3 + 1)
      , modelTest
      ]
