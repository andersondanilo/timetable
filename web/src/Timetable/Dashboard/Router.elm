module Timetable.Dashboard.Router exposing (..)

import Timetable.Dashboard.Types exposing (..)
import Navigation
import UrlParser exposing (s, top)

toRoute : Navigation.Location -> Route
toRoute location =
  let
    maybeRoute = UrlParser.parsePath parser location
  in
    case maybeRoute of
      Nothing ->
        NotFoundRoute 

      Just route ->
        route

parser : UrlParser.Parser (Route -> a) a
parser =
  UrlParser.oneOf
    [ UrlParser.map IndexRoute top
    , UrlParser.map IndexRoute (s "dashboard")
    ]

