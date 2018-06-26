module View exposing(..)

import Html exposing(Html, div, text, button, input, h3, h4, label)
import Html.Attributes exposing(..)
import Html.Events exposing(onClick, onInput)
import Types exposing(Msg(..), Model)
import Utils exposing(currencySelectConfig, typeSelectConfig)
import Select

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
  , (selectType model)
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
      , (selectCurrency model)
      ]
    ]
   , button [ onClick SendSearch ] [text "Search"]
  ]



{-| Render an autocompleting select to make sure user can only select valid
options in the currency field
-}
selectCurrency : Model -> Html Msg
selectCurrency model =
    let
        selectedCurrency =
            case model.selectedCurrencyId of
                Nothing ->
                    Nothing

                Just id ->
                    List.filter (\curr -> curr.id == id) model.currencies
                        |> List.head
    in
        div [align "center"]
            [ label [] [ text "Available Currencies"]
            , Html.map SelectCurrency (Select.view currencySelectConfig model.currencySelectState model.currencies selectedCurrency)
            ]


{-| Render an autocompleting select to make sure user can only select valid
options in the Seller Type field
-}
selectType: Model -> Html Msg
selectType model =
    let
        selectedType =
            case model.selectedSellerTypeId of
                Nothing ->
                    Nothing

                Just id ->
                    List.filter (\typ -> typ.id == id) model.types
                        |> List.head
    in
        div [align "center"]
            [ label [] [ text "Seller Types"]
            , Html.map SelectType (Select.view typeSelectConfig model.typeSelectState model.types selectedType)
            ]
