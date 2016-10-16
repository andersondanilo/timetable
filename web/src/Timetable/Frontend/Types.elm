module Timetable.Frontend.Types where

import Hop.Types exposing (Location)

type Route
  = HomeRoute
  | SignupRoute
  | LoginRoute
  | NotFoundRoute

type alias Model
  =
    {
      location: Location,
      route: Route
    }

type Action
  = ApplyRoute ( Route, Location )
  | HopAction ()
  | NavigateTo String