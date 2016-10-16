module Timetable.Frontend.Views.SignupView where

import Html exposing (Html, div, text, form, label, input, p, a, button)
import Html.Attributes exposing (class, name, type')
import Html
import Timetable.Common.ViewHelpers exposing (showTitle, showContent, showSectionTitle )


import Timetable.Frontend.Types exposing (Model)

showSignup : Html
showSignup =
  div [] [
    showTitle "Cadastre-se",
    showContent [
      div [ class "row" ] [
        div [ class "col-md-6" ] showRegisterForm
      ]
    ]
  ]

showRegisterForm : List Html
showRegisterForm = 
  [
    showSectionTitle "Cadastre-se",
    p [] [ text "Digite as informações abaixo para efetuar o seu cadastro" ],
    form [] [
      formInput "Nome" "name",
      formInput "E-mail" "email",
      formInput "Senha" "password",
      formInput "Repita a Senha" "repeat_password",
      button [ class "btn btn-primary", type' "submit" ] [ text "Cadastrar" ]
    ]
  ]

formInput : String -> String -> Html
formInput labelText nameText = 
  div [ class "form-group" ] [
    label [] [ text labelText ],
    input [ name nameText, class "form-control" ]  []
  ]