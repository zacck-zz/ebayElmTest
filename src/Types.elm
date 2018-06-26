module Types exposing(..)

import Navigation exposing(Location)



-- Build some messages to update the state
type Msg
    = CheckUrl
    | SetTerm String
    | SetMin String
    | SetMax String
    | SetSearch Location
    | SendSearch



-- Build a type for our model
type alias Model =
  { q: String
  , priceMin: String
  , priceMax: String
  , priceCurrency: String
  , accountType: String
  }
