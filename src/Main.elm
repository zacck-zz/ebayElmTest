module Main exposing(..)
{-| This module contains the entry point into
our application and it has a few functions that we can use to initialize
and set up our application
-}


import Navigation exposing(Location)
import State exposing(init, update)
import Types exposing(Msg(..))
import View exposing(view)

-- our program
main =
  Navigation.program SetSearch
    { init = init
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }
