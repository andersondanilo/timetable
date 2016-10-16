module Timetable.Frontend.Routes where

import Timetable.Frontend.Types exposing (
  Route(NotFoundRoute, SignupRoute, HomeRoute, LoginRoute),
  Action(ApplyRoute))
import Hop
import Hop.Types exposing (Config, Router, PathMatcher)
import Hop.Matchers exposing (match1)

taggedRouterSignal : Signal Action
taggedRouterSignal =
  Signal.map ApplyRoute router.signal

matchers : List (PathMatcher Route)
matchers =
  [ match1 HomeRoute ""
  , match1 SignupRoute "/signup"
  , match1 LoginRoute "/login"
  ]

routerConfig : Config Route
routerConfig =
  { hash = True
  , basePath = ""
  , matchers = matchers
  , notFound = NotFoundRoute
  }

router : Router Route
router =
  Hop.new routerConfig