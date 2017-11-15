module Timetable.Frontend.HomePage.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Timetable.Frontend.Model exposing(Model)
import Timetable.Frontend.Update exposing(Msg)
import Timetable.Frontend.Common.ViewHelpers exposing(clickTo)

view : Model -> Html Msg
view model =
  div [] [
    headerwrap model,
    services
  ]

headerwrap : Model -> Html Msg
headerwrap model =
  div [ id "headerwrap" ] [
    div [ class "container" ] [
      div [ class "row" ] [
        div [ class "col-lg-8 col-lg-offset-2" ] [
          h3 [] [ text "Gerencie o horário de seu hospital ou clínica médica" ],
          h1 [] [ text "Rápido, fácil e intuitivo" ]
        ]
      ],
      div [ class "col-lg-8 col-lg-offset-2" ] [
        a ([ class "btn btn-lg btn-theme" ] ++ clickTo "signup") [ text "Começe agora" ]
      ],
      div [ class "col-lg-8 col-lg-offset-2 himg" ] [
        img [ src "assets/img/browser.png", class "img-responsive" ] []
      ]
    ]
  ]

services : Html Msg
services =
  div [ id "service" ] [
    div [ class "container" ] [
      div [ class "row centered" ] [
        service "Gerencie horários" "clock-o" "Cadastre o horário de determinado profissional em determinada hora, especialidade e quarto.",
        service "Gerencie múltiplas agendas" "calendar" "Visualize e altere a agenda por profissional, especialidade ou quarto.",
        service "Integre com outros sistemas" "link" "O sistema está aberto para integrações com outros sistemas."
      ]
    ]
  ]

service : String -> String -> String -> Html msg
service name icon description =
  div [ class "col-md-4" ] [
    i [ class ("fa fa-" ++ icon) ] [],
    h4 [] [ text name ],
    p [] [ text description ]
  ]