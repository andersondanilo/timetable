module Timetable.Frontend.SignupPage.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Timetable.Common.ViewHelpers exposing ( viewTitle, viewContent, viewSectionTitle )
import Timetable.Frontend.Model as AppModel
import Timetable.Frontend.Update as AppUpdate
import Timetable.Frontend.SignupPage.Model exposing(Model)
import Timetable.Frontend.SignupPage.Update exposing(Msg(..), Field(..))

view : Model -> AppModel.Model -> Html AppUpdate.Msg
view model appModel =
  div [] [
    viewTitle "Cadastre-se",
    viewContent [
      div [ class "row" ] [
        div [ class "col-md-6" ] (viewRegisterForm model)
      ]
    ]
  ]

viewRegisterForm : Model -> List (Html AppUpdate.Msg)
viewRegisterForm model = 
  [
    viewSectionTitle "Cadastre-se",
    p [] [ text "Digite as informações abaixo para efetuar o seu cadastro" ],
    Html.form [] [
      formInput "text" "Nome" "name" Name,
      formInput "email" "E-mail" "email" Email,
      formInput "password" "Senha" "password" Password,
      formInput "password" "Repita a Senha" "repeat_password" RepeatPassword,
      button [ class "btn btn-primary", type_ "submit" ] [ text "Cadastrar" ]
    ]
  ]

formInput : String -> String -> String -> Field -> Html AppUpdate.Msg
formInput inputType labelText nameText field = 
  div [ class "form-group" ] [
    label [] [ text labelText ],
    input [
      type_ inputType,
      name nameText,
      class "form-control",
      onInput (changeMsgForField field)
    ] []
  ]

changeMsgForField : Field -> String -> AppUpdate.Msg
changeMsgForField field newValue = 
  AppUpdate.MsgForSignupPage (ChangeField field newValue)