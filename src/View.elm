module View exposing(..)

import Html exposing(Html, div, text, button, input)
import Html.Attributes exposing(..)
import Html.Events exposing(onClick, onInput)
import Types exposing(Msg(..), Model)


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
   , button [ onClick SendSearch ] [text "Search"]
  ]
