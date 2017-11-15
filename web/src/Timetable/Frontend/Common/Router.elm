module Timetable.Frontend.Common.Router exposing (..)

import Navigation
import UrlParser exposing (s, top)

type Route
  = IndexRoute
  | SignupRoute
  | LoginRoute
  | NotFoundRoute

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
    , UrlParser.map SignupRoute (s "signup")
    , UrlParser.map LoginRoute (s "login")
    ]

