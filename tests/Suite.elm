module Suite exposing (..)

import Expect exposing (Expectation)
import Main exposing(..)
import Test exposing (..)


model : Model
model =
  { q = ""
  , priceMin = ""
  , priceMax =  ""
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
                              , priceMin = ""
                              , priceMax = ""
                              , priceCurrency = ""
                              , accountType = ""
                             }

          , test "add a priceMin to state" <|
              \_ ->
                  model
                      |> update (SetMin "50")
                      |> Tuple.first
                      |> Expect.equal
                              { q = ""
                              , priceMin = "50"
                              , priceMax = ""
                              , priceCurrency = ""
                              , accountType = ""
                              }
         , test "add a priceMax to state" <|
             \_ ->
                 model
                     |> update (SetMax "500")
                     |> Tuple.first
                     |> Expect.equal
                             { q = ""
                             , priceMin = ""
                             , priceMax = "500"
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
