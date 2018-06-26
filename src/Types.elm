module Types exposing(..)
{-| This module contains all the types we use through
the application -}

import Navigation exposing(Location)
import Select



-- Build some messages to update the state
type Msg
    = CheckUrl
    | SetTerm String
    | SetMin String
    | SetMax String
    | SetSearch Location
    | SendSearch
    | OnCurrencySelect (Maybe Currency)
    | SelectCurrency (Select.Msg Currency)
    | OnTypeSelect (Maybe SellerType)
    | SelectType (Select.Msg SellerType)




-- Build a type for our model
type alias Model =
  { q: String
  , priceMin: String
  , priceMax: String
  , accountType: String
  , selectedCurrencyId : Maybe String
  , currencySelectState : Select.State
  , currencies : List Currency
  , selectedSellerTypeId : Maybe String
  , typeSelectState : Select.State
  , types : List SellerType
  , errors : List String
  }


-- build a type for the currency
type alias Currency =
  { id : String
  , label : String
  }


-- build a type for the currency
type alias SellerType =
  { id : String
  , label : String
  }
