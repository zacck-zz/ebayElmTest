module Suite exposing (..)

import Expect exposing (Expectation)
import State exposing(update)
import Types exposing(Msg(..), Model)
import Test exposing (..)
import Select


-- Build an inital model to start up with
model : Model
model =
  { q = ""
  , priceMin = ""
  , priceMax = ""
  , priceCurrency = ""
  , accountType = ""
  , selectedCurrencyId = Nothing
  , currencySelectState = Select.newState ""
  , currencies = []
  , selectedSellerTypeId = Nothing
  , typeSelectState = Select.newState ""
  , types = []
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
                              , selectedCurrencyId = Nothing
                              , currencySelectState = Select.newState ""
                              , currencies = []
                              , selectedSellerTypeId = Nothing
                              , typeSelectState = Select.newState ""
                              , types = []
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
                              , selectedCurrencyId = Nothing
                              , currencySelectState = Select.newState ""
                              , currencies = []
                              , selectedSellerTypeId = Nothing
                              , typeSelectState = Select.newState ""
                              , types = []
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
                             , selectedCurrencyId = Nothing
                             , currencySelectState = Select.newState ""
                             , currencies = []
                             , selectedSellerTypeId = Nothing
                             , typeSelectState = Select.newState ""
                             , types = []
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
