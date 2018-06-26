module Utils exposing (..)

import Types exposing(Msg(..), Currency, SellerType, Model)
import Select
import Validate exposing (Validator, ifBlank, ifInvalidEmail, ifFalse, ifTrue, validate)


{-| Utitility function that builds a url out of our currenct model  -}
urlBuilder : Model -> String
urlBuilder model =
  let
    q = "?q=" ++ model.q

    price =
      if not (String.isEmpty model.priceMax) && not (String.isEmpty model.priceMin)  then
        "[" ++ model.priceMin ++ ".." ++ model.priceMax ++ "],priceCurrency:" ++ (currencyPicker model)
      else if not (String.isEmpty model.priceMax) then
        "[.." ++ model.priceMax ++ "],priceCurrency:" ++ (currencyPicker model)
      else if not (String.isEmpty model.priceMin) then
        "[" ++ model.priceMin ++ "],priceCurrency:" ++ (currencyPicker model)
      else
        ""

    seller =
      case model.selectedSellerTypeId of
        Just x ->  "sellerAccountTypes:{" ++ x ++ "}"
        Nothing -> ""
  in
    q ++ ",filter=" ++ price ++ "," ++ seller


-- pluck the currency from state
currencyPicker : Model -> String
currencyPicker model  =
  case model.selectedCurrencyId of
    Nothing -> ""
    Just x  -> x


--search validator
searchValidator : Validator String Model
searchValidator =
  Validate.all
    [ Validate.firstError
        [ifBlank .q "Please enter a term"
        ,ifTrue (\model -> String.contains "*" model.q) "* Not allowed in term"
        ]
    , ifFalse (\model -> currencyPredicate model) "Please select a currency"
    ]

{-| Predicate function to check  for currency type if min or max is entered-}
-- take a model
-- if min is entered currency must be chosen
-- if max is entered currency must be chosen
currencyPredicate : Model -> Bool
currencyPredicate model =
  case model.selectedCurrencyId of
    Just p -> True
    Nothing ->
          -- our currency has to be selected if the max or min is entered
          if not (String.isEmpty model.priceMax) || not (String.isEmpty model.priceMin)  then
            False
          else
            True




-- validateContract
validateSearch : Model -> List String
validateSearch model =
    validate searchValidator model

-- base url for the api call
baseUrl : String
baseUrl =
  "/buy/browse/v1/item_summary/search?"


{-|  A list of currencies for options in our form -}
currencyList : List ( String, String)
currencyList =
  [("USD","USD")
  ,("EUR", "EUR")
  ,("GBP", "GBP")
  ,("CAD", "CAD")
  ]

{-| A helper function that transforms a list of tuples into records
-}
currencies : List Currency
currencies =
    List.map (\( id, name ) -> Currency id name) currencyList


{-| A list of account types for our form -}
accountList : List ( String, String)
accountList =
  [("INDIVIDUAL", "INDIVIDUAL")
  ,("BUSINESS", "BUSINESS")
  ]

{-| A helper function that transforms a list of account types into records
-}
accountTypes : List SellerType
accountTypes =
    List.map (\( id, name ) -> SellerType id name) accountList



{-| A helper function for the configuration
-}
transformQuery : String -> Maybe String
transformQuery query =
    if String.length query < 1 then
        Nothing
    else
        Just query

{-| Create the configuration for the  Currency Select component
-}
currencySelectConfig : Select.Config Msg Currency
currencySelectConfig =
    Select.newConfig OnCurrencySelect .label
        |> Select.withCutoff 5
        |> Select.withInputStyles [("width", "10rem")]
        |> Select.withMenuStyles [ ( "background", "white" ) ]
        |> Select.withNotFound "No matches"
        |> Select.withNotFoundClass "red"
        |> Select.withNotFoundStyles [ ( "padding", "auto auto" ) ]
        |> Select.withHighlightedItemClass "bg-silver"
        |> Select.withHighlightedItemStyles [ ( "color", "black" ), ("width", "10rem") ]
        |> Select.withPrompt "Select Currency"
        |> Select.withPromptClass "grey"
        |> Select.withUnderlineClass "underline"
        |> Select.withTransformQuery transformQuery

{-| Create the configuration for the  Currency Select component
-}
typeSelectConfig : Select.Config Msg SellerType
typeSelectConfig =
    Select.newConfig OnTypeSelect .label
        |> Select.withCutoff 5
        |> Select.withInputStyles [("width", "10rem")]
        |> Select.withMenuStyles [ ( "background", "white" ) ]
        |> Select.withNotFound "No matches"
        |> Select.withNotFoundClass "red"
        |> Select.withNotFoundStyles [ ( "padding", "auto auto" ) ]
        |> Select.withHighlightedItemClass "bg-silver"
        |> Select.withHighlightedItemStyles [ ( "color", "black" ), ("width", "10rem") ]
        |> Select.withPrompt "Select Type"
        |> Select.withPromptClass "grey"
        |> Select.withUnderlineClass "underline"
        |> Select.withTransformQuery transformQuery
