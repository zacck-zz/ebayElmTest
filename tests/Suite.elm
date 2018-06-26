module Suite exposing (..)

import Expect exposing (Expectation)
import State exposing(update)
import Types exposing(Msg(..), Model)
import Utils exposing(validateSearch)
import Test exposing (..)
import Select


-- Build an inital model to start up with
model : Model
model =
  { q = ""
  , priceMin = ""
  , priceMax = ""
  , accountType = ""
  , selectedCurrencyId = Nothing
  , currencySelectState = Select.newState ""
  , currencies = []
  , selectedSellerTypeId = Nothing
  , typeSelectState = Select.newState ""
  , types = []
  , errors = []
  }

-- Build an inital model to start up with
starmodel : Model
starmodel =
  { q = "jsbfjsefb*jbjb"
  , priceMin = ""
  , priceMax = ""
  , accountType = ""
  , selectedCurrencyId = Nothing
  , currencySelectState = Select.newState ""
  , currencies = []
  , selectedSellerTypeId = Nothing
  , typeSelectState = Select.newState ""
  , types = []
  , errors = []
  }


-- Build an inital model to start up with
currencyModel : Model
currencyModel =
  { q = "iPhone"
  , priceMin = ""
  , priceMax = "500"
  , accountType = ""
  , selectedCurrencyId = Nothing
  , currencySelectState = Select.newState ""
  , currencies = []
  , selectedSellerTypeId = Nothing
  , typeSelectState = Select.newState ""
  , types = []
  , errors = []
  }




validationTest : Test
validationTest =
  describe "validation"
      [ test "checks that query is not blank" <|
        \_ ->
            model
                |> validateSearch
                |> List.length
                |> Expect.atLeast 1
      , test "checks for the * character in terms" <|
        \_ ->
            starmodel
                |> validateSearch
                |> List.length
                |> Expect.atLeast 1
      , test "checks that we have chosen a currency" <|
        \_ ->
            currencyModel
                |> validateSearch
                |> List.length
                |> Expect.atLeast 1
      ]

modelTest : Test
modelTest =
  describe "Model"
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
                              , accountType = ""
                              , selectedCurrencyId = Nothing
                              , currencySelectState = Select.newState ""
                              , currencies = []
                              , selectedSellerTypeId = Nothing
                              , typeSelectState = Select.newState ""
                              , types = []
                              , errors = []
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
                              , accountType = ""
                              , selectedCurrencyId = Nothing
                              , currencySelectState = Select.newState ""
                              , currencies = []
                              , selectedSellerTypeId = Nothing
                              , typeSelectState = Select.newState ""
                              , types = []
                              , errors = []
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
                             , accountType = ""
                             , selectedCurrencyId = Nothing
                             , currencySelectState = Select.newState ""
                             , currencies = []
                             , selectedSellerTypeId = Nothing
                             , typeSelectState = Select.newState ""
                             , types = []
                             , errors = []
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
      , validationTest
      ]
