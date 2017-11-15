module Timetable.Frontend.LoginPage.View exposing (..)

import Html exposing (Html, div, text, form, label, input, p, a, button)
import Html.Attributes exposing (class, name, type_, href)
import Html
import Timetable.Common.ViewHelpers exposing (viewTitle, viewContent, viewSectionTitle)
import Timetable.Frontend.Common.ViewHelpers exposing (clickTo)
import Timetable.Frontend.Model as AppModel
import Timetable.Frontend.Update as AppUpdate
import Timetable.Frontend.LoginPage.Model exposing(Model)


view : Model -> AppModel.Model -> Html AppUpdate.Msg
view model appModel =
  div [] [
    viewTitle "Entrar",
    viewContent [
      div [ class "row" ] [
        div [ class "col-md-6" ] viewEnterForm,
        div [ class "col-md-6" ] viewRegisterForm
      ]
    ]
  ]

viewEnterForm : List ( Html AppUpdate.Msg )
viewEnterForm = 
  [
    viewSectionTitle "Entrar",
    p [] [ text "Se você já está cadastrado, entre através do formulário abaixo" ],
    form [] [
      formInput "E-mail" "email",
      formInput "Senha" "senha",
      button [ class "btn btn-primary", type_ "submit" ] [ text "Entrar" ]
    ]
  ]

viewRegisterForm : List ( Html AppUpdate.Msg )
viewRegisterForm =
  [
    viewSectionTitle "Cadastre-se",
    p [] [ text "Se você ainda não possui um cadastro" ],
    a ([ class "btn btn-lg btn-primary" ] ++ clickTo "signup") [ text "Começe agora" ]
  ]

formInput : String -> String -> Html AppUpdate.Msg
formInput labelText nameText = 
  div [ class "form-group" ] [
    label [] [ text labelText ],
    input [ name nameText, class "form-control" ]  []
  ]