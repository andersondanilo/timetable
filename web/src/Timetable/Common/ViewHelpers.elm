module Timetable.Common.ViewHelpers where

import Html exposing (Html, div, text, h3, h4)
import Html.Attributes exposing (id, class)

showTitle : String -> Html
showTitle title =
  div [ id "blue" ] [
    div [ class "container" ] [
      h3 [] [ text title ]
    ]
  ]

showContent : List Html -> Html
showContent contentBody =
  div [ class "container mtb" ] contentBody

showSectionTitle : String -> Html
showSectionTitle title =
  div [] [
    h4 [] [ text title ],
    div [ class "hline" ] [ ]
  ]