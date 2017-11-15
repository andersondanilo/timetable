module Timetable.Dashboard.Types exposing (..)

import Navigation

type alias Model =
  { currentRoute : Route
  }

type Msg
  = UrlChange Navigation.Location
  | NavigateTo String

type Route
  = IndexRoute
  | NotFoundRoute