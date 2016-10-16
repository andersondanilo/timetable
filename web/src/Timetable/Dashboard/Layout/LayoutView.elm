module Timetable.Dashboard.Layout.LayoutView where

import Html exposing (text, div, ul, li, button, node, a, span, h1, p, i, br, h3, h4, img, Html)
import Html.Attributes exposing (rel, href, class, id, src )
import Html.Events exposing (onClick)
import Signal
import Timetable.Dashboard.Types exposing (
  Model,
  Action(NavigateTo),
  Route(HomeRoute, NotFoundRoute))
import Timetable.Dashboard.Dashboard.View exposing (showDashboard)
import Timetable.Common.ViewHelpers exposing (showContent, showTitle)
import Timetable.Common.Layout exposing (footerwrap)

-- Create an css file node
css path =
  node "link" [ rel "stylesheet", href path ] []

index : Signal.Address Action -> Model -> Html
index address model = 
  div [] [
    header address model,
    showCurrentPage address model,
    footerwrap
  ]

showCurrentPage : Signal.Address Action -> Model -> Html
showCurrentPage address model =
  case model.route of
    HomeRoute ->
      showDashboard address model

    NotFoundRoute ->
      div [] [
        showTitle "Página não encontrada",
        showContent [ text "A página que você procura não foi encontrada"]
      ]

-- Show html header
header address model = 
  div [ class "navbar navbar-default navbar-fixed-top" ] [
    div [ class "container" ] [
      div [ class "navbar-header" ] [
        button [ class "navbar-toggle" ] [
          span [ class "sr-only" ] [ text "Toggle navigation" ],
          span [ class "icon-bar" ] [],
          span [ class "icon-bar" ] [],
          span [ class "icon-bar" ] []
        ],
        a [ class "navbar-brand", onClick address (NavigateTo "") ] [ text "TIMETABLE" ]
      ],
      div [ class "navbar-collapse collapse navbar-right" ] [
        ul [ class "nav navbar-nav" ] [
          li [] [
            
          ]
        ]
      ]
    ]
  ]