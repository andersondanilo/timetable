module Timetable.Common.Layout exposing (..)

import Html exposing (text, div, a, p, i, br, h4, Html)
import Html.Attributes exposing (href, class, id)

footerwrap : Html msg
footerwrap =
  div [ id "footerwrap" ] [
    div [ class "container" ] [
      div [ class "row" ] [
        div [ class "col-lg-4" ] [
          h4 [] [ text "Sobre" ],
          div [ class "hline-w" ] [],
          p [] [ text "Somos um sistema de gerenciamento de horário pronto para atender as necessidades da sua empresa." ]
        ],
        div [ class "col-lg-4" ] [
          h4 [] [ text "Redes sociais" ],
          div [ class "hline-w" ] [],
          p [] [
            a [ href "#" ] [ i [ class "fa fa-facebook" ] [] ],
            a [ href "#" ] [ i [ class "fa fa-twitter" ] [] ],
            a [ href "#" ] [ i [ class "fa fa-instagram" ] [] ],
            a [ href "#" ] [ i [ class "fa fa-tumblr" ] [] ]
          ]
        ],
        div [ class "col-lg-4" ] [
          h4 [] [ text "Contato" ],
          div [ class "hline-w" ] [],
          p [] [
            text "contato@xxxxxxx.com.br",
            br [] [],
            text "(11) XXXX-XXXX"
          ]
        ]
      ]
    ]
  ]
