module Timetable.Frontend.Views.LoginView where

import Html exposing (Html, div, text, form, label, input, p, a, button)
import Html.Attributes exposing (class, name, type', href)
import Html
import Timetable.Common.ViewHelpers exposing (showTitle, showContent, showSectionTitle )


import Timetable.Frontend.Types exposing (Model)

showLogin : Html
showLogin =
  div [] [
    showTitle "Entrar",
    showContent [
      div [ class "row" ] [
        div [ class "col-md-6" ] showEnterForm,
        div [ class "col-md-6" ] showRegisterForm
      ]
    ]
  ]

showEnterForm : List Html
showEnterForm = 
  [
    showSectionTitle "Entrar",
    p [] [ text "Se você já está cadastrado, entre através do formulário abaixo" ],
    form [] [
      formInput "E-mail" "email",
      formInput "Senha" "senha",
      -- button [ class "btn btn-primary", type' "submit" ] [ text "Entrar" ]
      a [ href "dashboard.html", class "btn btn-primary" ] [ text "Entrar" ]
    ]
  ]

showRegisterForm : List Html
showRegisterForm =
  [
    showSectionTitle "Cadastre-se",
    p [] [ text "Se você ainda não possui um cadastro" ],
    a [ class "btn btn-lg btn-primary", href "#signup" ] [ text "Começe agora" ]
  ]

formInput : String -> String -> Html
formInput labelText nameText = 
  div [ class "form-group" ] [
    label [] [ text labelText ],
    input [ name nameText, class "form-control" ]  []
  ]