module State exposing(..)

import Navigation exposing(Location)
import Types exposing(Msg(..), Model)
import Utils exposing(baseUrl, currencySelectConfig, currencies, accountTypes, typeSelectConfig)
import Select





{-| We use this function to initialize our application when starting up
We can always start up by checking the value of the url
-}
init : Location -> (Model, Cmd Msg)
init location = (initialModel, Cmd.none)



-- Build an inital model to start up with
initialModel : Model
initialModel =
  { q = ""
  , priceMin = ""
  , priceMax = ""
  , priceCurrency = ""
  , accountType = ""
  , selectedCurrencyId = Nothing
  , currencySelectState = Select.newState ""
  , currencies = currencies
  , selectedSellerTypeId = Nothing
  , typeSelectState = Select.newState ""
  , types = accountTypes
  }



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
    SetSearch location ->
      let
          _ =
              Debug.log "SendSearch" location
      in
        (model, Cmd.none)
    SendSearch ->
      let
          cmd =
                Navigation.newUrl baseUrl
      in
        (model, cmd)
    OnCurrencySelect maybeCurrency ->
      let
          maybeId =
              Maybe.map .id maybeCurrency
      in
      -- set a selected currency
          ( { model | selectedCurrencyId = maybeId}, Cmd.none)
    SelectCurrency subMsg ->
      -- send a message to select the currency
      let
          (updated, cmd) =
              Select.update  currencySelectConfig subMsg model.currencySelectState
      in
        ( { model | currencySelectState = updated }, cmd)
    OnTypeSelect maybeType ->
      let
          maybeId =
              Maybe.map .id maybeType
      in
      -- set a selected type
          ( { model | selectedSellerTypeId = maybeId}, Cmd.none)
    SelectType subMsg ->
      -- send a message to select the type
      let
          (updated, cmd) =
              Select.update  typeSelectConfig subMsg model.typeSelectState
      in
        ( { model | typeSelectState = updated }, cmd)
