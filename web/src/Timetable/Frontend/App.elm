module Timetable.Frontend.App where

import Timetable.Frontend.Types exposing (
  Model,
  Action(ApplyRoute, NavigateTo, HopAction),
  Route(HomeRoute))
import Timetable.Frontend.Views.LayoutView exposing (index)
import Timetable.Frontend.Routes exposing (taggedRouterSignal, routerConfig)
import Effects exposing (Effects, Never)
import StartApp
import Hop.Types exposing (newLocation)
import Hop.Navigate exposing (navigateTo)

newModel : Model
newModel =
  { location = newLocation
  , route = HomeRoute
  }

init : ( Model, Effects Action )
init =
  ( newModel, Effects.none )

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    ApplyRoute ( route, location ) ->
      ( { model | route = route, location = location }, Effects.none )

    NavigateTo path ->
      ( model, Effects.map HopAction (navigateTo routerConfig path) )

    HopAction () ->
      ( model, Effects.none )

startApp =
  StartApp.start {
    init = init,
    update = update,
    view = index,
    inputs = [taggedRouterSignal]
  }