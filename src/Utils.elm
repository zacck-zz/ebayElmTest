module Utils exposing (..)

import Types exposing(Msg(..), Currency, SellerType)
import Select


-- base url for the api call
baseUrl : String
baseUrl =
  "/buy/browse/v1/item_summary/search?"


{-|  A list of currencies for options in our form -}
currencyList : List ( String, String)
currencyList =
  [("1","USD")
  ,("2", "EUR")
  ,("3", "GBP")
  ,("4", "CAD")
  ]

{-| A helper function that transforms a list of tuples into records
-}
currencies : List Currency
currencies =
    List.map (\( id, name ) -> Currency id name) currencyList


{-| A list of account types for our form -}
accountList : List ( String, String)
accountList =
  [("1", "INDIVIDUAL")
  ,("2", "BUSINESS")
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
