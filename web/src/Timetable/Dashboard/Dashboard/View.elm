module Timetable.Dashboard.Dashboard.View exposing (..)

import Html exposing (Html, div, h3, text, img, br)
import Html.Attributes exposing (class, src)
import Timetable.Dashboard.Types exposing(Model, Msg)
import Timetable.Common.ViewHelpers exposing (viewTitle, viewContent)

viewDashboard : Model -> Html Msg
viewDashboard model =
  div[] [
    viewTitle "Dashboard",
    viewContent [
      div [ class "row" ] [
        viewIcon "Agenda" "assets/img/icons/clock-icon.png",
        viewIcon "Gerenciar Especialidades" "assets/img/icons/favourite-2-icon.png",
        viewIcon "Gerenciar Salas" "assets/img/icons/phonebook-icon.png",
        viewIcon "Gerenciar Profissionais" "assets/img/icons/contact-icon.png",
        viewIcon "Configurações" "assets/img/icons/settings-3-icon.png"
      ]
    ]
  ]

viewIcon : String -> String -> Html Msg
viewIcon name image =
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
