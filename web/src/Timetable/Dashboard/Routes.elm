module Timetable.Dashboard.Routes where

import Timetable.Dashboard.Types exposing (
  Route(NotFoundRoute, HomeRoute),
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