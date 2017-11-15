module Timetable.Frontend.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Timetable.Frontend.Model exposing (Model)
import Timetable.Frontend.Update exposing (Msg)
import Timetable.Frontend.HomePage.View as HomeView
import Timetable.Frontend.LoginPage.View as LoginView
import Timetable.Frontend.SignupPage.View as SignupView
import Timetable.Common.ViewHelpers exposing (viewContent, viewTitle)
import Timetable.Common.Layout exposing (footerwrap)
import Timetable.Frontend.Common.ViewHelpers exposing(clickTo)
import Timetable.Frontend.Common.Router exposing(Route(..))

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
      HomeView.view model

    SignupRoute ->
      SignupView.view model.signupPage model

    LoginRoute ->
      LoginView.view model.loginPage model

    NotFoundRoute ->
      div [] [
        viewTitle "Página não encontrada",
        viewContent [ text "A página que você procura não foi encontrada"]
      ]

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
        a ([ class "navbar-brand" ] ++ clickTo "/") [ text "TIMETABLE" ]
      ],
      div [ class "navbar-collapse collapse navbar-right" ] [
        ul [ class "nav navbar-nav" ] [
          li [] [
            a (clickTo "login") [ text "ENTRAR" ]
          ]
        ]
      ]
    ]
  ]