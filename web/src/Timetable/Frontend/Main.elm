module Timetable.Frontend.Main exposing (..)

import Timetable.Frontend.View exposing (view)
import Timetable.Frontend.Update exposing (update, Msg(UrlChange))
import Timetable.Frontend.Model exposing (Model, initialModel)
import Navigation

main =
  Navigation.program UrlChange
    { init = init
    , view = view
    , update = update
    , subscriptions = (\_ -> Sub.none)
    }

init : Navigation.Location -> ( Model, Cmd msg )
init location =
  ( initialModel(location)
  , Cmd.none
  )