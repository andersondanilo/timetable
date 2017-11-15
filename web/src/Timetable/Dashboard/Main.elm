module Timetable.Dashboard.Main exposing (..)

import Timetable.Dashboard.Views.LayoutView exposing (view)
import Timetable.Dashboard.Types exposing (..)
import Timetable.Dashboard.Router exposing (toRoute)
import Navigation

main =
  Navigation.program UrlChange
    { init = init
    , view = view
    , update = update
    , subscriptions = (\_ -> Sub.none)
    }

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
  ( Model(toRoute(location))
  , Cmd.none
  )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UrlChange location ->
      ( { model | currentRoute = toRoute(location) }
      , Cmd.none
      )

    NavigateTo path ->
      ( model, Navigation.newUrl(path) )