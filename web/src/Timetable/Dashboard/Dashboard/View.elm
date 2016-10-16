module Timetable.Dashboard.Dashboard.View where

import Html exposing (Html, div, h3, text, img, br)
import Html.Attributes exposing (class, src)
import Signal
import Timetable.Dashboard.Types exposing(Model, Action)
import Timetable.Common.ViewHelpers exposing (showTitle, showContent)

showDashboard : Signal.Address Action -> Model -> Html
showDashboard address model =
  div[] [
    showTitle "Dashboard",
    showContent [
      div [ class "row" ] [
        showIcon "Agenda" "assets/img/icons/clock-icon.png",
        showIcon "Gerenciar Especialidades" "assets/img/icons/favourite-2-icon.png",
        showIcon "Gerenciar Salas" "assets/img/icons/phonebook-icon.png",
        showIcon "Gerenciar Profissionais" "assets/img/icons/contact-icon.png",
        showIcon "Configurações" "assets/img/icons/settings-3-icon.png"
      ]
    ]
  ]

showIcon : String -> String -> Html
showIcon name image =
  div [ class "col-md-4"] [
    div [ class "row" ] [
      div [ class "col-md-3" ] [],
      div [ class "col-md-6 text-center" ] [
        img [ src image, class "img-responsive" ] [],
        h3 [] [ text name ],
        br [] [],
        br [] []
      ],
      div [ class "col-md-3" ] []
    ]
  ]
