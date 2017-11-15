module Timetable.Dashboard.Views.LayoutView exposing (..)

import Html exposing (text, div, ul, li, button, node, a, span, h1, p, i, br, h3, h4, img, Html)
import Html.Attributes exposing (rel, href, class, id, src )
import Timetable.Dashboard.Types exposing (Model, Msg, Route(..))
import Timetable.Dashboard.Dashboard.View exposing (viewDashboard)
import Timetable.Common.ViewHelpers exposing (viewContent, viewTitle)
import Timetable.Dashboard.ViewHelpers exposing (clickTo)
import Timetable.Common.Layout exposing (footerwrap)

-- Create an css file node
css path =
  node "link" [ rel "stylesheet", href path ] []

view : Model -> Html Msg
view model = 
  div [] [
    header model,
    viewCurrentPage model,
    footerwrap
  ]

viewCurrentPage : Model -> Html Msg
viewCurrentPage model =
  case model.currentRoute of
    IndexRoute ->
      viewDashboard model

    NotFoundRoute ->
      div [] [
        viewTitle "Página não encontrada",
        viewContent [ text "A página que você procura não foi encontrada"]
      ]

-- Show html header
header : Model -> Html Msg
header model = 
  div [ class "navbar navbar-default navbar-fixed-top" ] [
    div [ class "container" ] [
      div [ class "navbar-header" ] [
        button [ class "navbar-toggle" ] [
          span [ class "sr-only" ] [ text "Toggle navigation" ],
          span [ class "icon-bar" ] [],
          span [ class "icon-bar" ] [],
          span [ class "icon-bar" ] []
        ],
        a ([ class "navbar-brand" ] ++ clickTo "/dashboard") [ text "TIMETABLE" ]
      ],
      div [ class "navbar-collapse collapse navbar-right" ] [
        ul [ class "nav navbar-nav" ] [
          li [] [
            
          ]
        ]
      ]
    ]
  ]