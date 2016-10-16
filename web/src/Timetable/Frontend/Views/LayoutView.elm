module Timetable.Frontend.Views.LayoutView where

import Html exposing (text, div, ul, li, button, node, a, span, h1, p, i, br, h3, h4, img, Html)
import Html.Attributes exposing (rel, href, class, id, src )
import Html.Events exposing (onClick)
import Signal
import Timetable.Frontend.Types exposing (
  Model,
  Action(NavigateTo),
  Route(HomeRoute, SignupRoute, LoginRoute, NotFoundRoute))
import Timetable.Frontend.Views.IndexView exposing (showIndex)
import Timetable.Frontend.Views.LoginView exposing (showLogin)
import Timetable.Frontend.Views.SignupView exposing (showSignup)
import Timetable.Common.ViewHelpers exposing (showContent, showTitle)
import Timetable.Common.Layout exposing (footerwrap)

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
      showIndex address model

    SignupRoute ->
      showSignup

    LoginRoute ->
      showLogin

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
            a [ href "#login" ] [ text "ENTRAR" ]
          ]
        ]
      ]
    ]
  ]