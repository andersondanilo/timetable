module Timetable.Common.ViewHelpers exposing (..)

import Html exposing (Html, Attribute, div, text, h3, h4)
import Html.Attributes exposing (id, class, href)
import Html.Events exposing (onWithOptions)
import Json.Decode

viewTitle : String -> Html msg
viewTitle title =
  div [ id "blue" ] [
    div [ class "container" ] [
      h3 [] [ text title ]
    ]
  ]

viewContent : List ( Html msg ) -> Html msg
viewContent contentBody =
  div [ class "container mtb" ] contentBody

viewSectionTitle : String -> Html msg
viewSectionTitle title =
  div [] [
    h4 [] [ text title ],
    div [ class "hline" ] [ ]
  ]

commonClickTo : (String -> msg) -> String -> List (Attribute msg)
commonClickTo command path =
  [ href path
  , onWithOptions
      "click"
      { stopPropagation = True, preventDefault = True }
      (Json.Decode.map (\_ -> (command path)) Json.Decode.value)
  ]