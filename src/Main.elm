module Main exposing(..)
{-| This module contains the entry point into
our application and it has a few functions that we can use to initialize
and set up our application
-}

import Html exposing(Html, div, text, button, input)
import Html.Attributes exposing(..)
import Html.Events exposing(onClick, onInput)




-- Build a type for our model
type alias Model =
  { q: String
  , priceMin: String
  , priceMax: String
  , priceCurrency: String
  , accountType: String
  }

-- Build an inital model to start up with
initialModel : Model
initialModel =
  { q = ""
  , priceMin = ""
  , priceMax = ""
  , priceCurrency = ""
  , accountType = ""
  }

{-| We use this function to initialize our application when starting up
We can always start up by checking the value of the url
-}
init : (Model, Cmd Msg)
init = (initialModel, Cmd.none)


-- Build some messages to update the state
type Msg
    = CheckUrl
    | SetTerm String
    | SetMin String
    | SetMax String


{-| Use this function to update the state of out form
We send updates to this function containing a message and the payload
-}
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    CheckUrl ->
      (model, Cmd.none)
    SetTerm term ->
      ({ model | q = term }, Cmd.none)
    SetMin minAmount ->
      ({ model | priceMin = minAmount }, Cmd.none)
    SetMax maxAmount ->
      ({ model | priceMax = maxAmount}, Cmd.none)




{-| This function contains the view we display for the form it render the UI
from whatever the state of the model is
-}
view : Model -> Html Msg
view model =
  div [ align "center"]
  [ div []
    [ text "Search"
    , input [ type_ "text", placeholder "iPhone...", onInput SetTerm ] []
    ]
  , div []
    [ text "Seller Type"
    , input [ type_ "text", placeholder "Individual"] []
    ]
  , div []
    [ div []
      [ div []
        [ text "Min"
        , input [ type_ "text", placeholder "50", onInput SetMin ] []
        ]
      , div []
        [ text "Max"
        , input [ type_ "text", placeholder "500", onInput SetMax ] []
        ]
      , div []
        [ text "Currency"
        , input [ type_ "text", placeholder "USD"] []
        ]
      ]
    ]
   , button [] [text "Search"]
  ]

-- our program
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }
