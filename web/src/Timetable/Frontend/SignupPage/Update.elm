module Timetable.Frontend.SignupPage.Update exposing (..)

import Timetable.Frontend.SignupPage.Model exposing(Model)
import Timetable.Frontend.Model as AppModel

type Msg
  = ChangeField Field String
  | SendForm

type Field
  = Name
  | Email
  | Password
  | RepeatPassword

update : Msg -> Model -> AppModel.Model -> ( Model, AppModel.Model, Cmd msg )
update msg model appModel =
  case msg of
    ChangeField field newValue ->
      processChangeField model appModel field newValue

    SendForm ->
      processSendForm model appModel

    _ ->
      ( model, appModel, Cmd.none )

processChangeField : Model -> AppModel.Model -> Field -> String -> ( Model, AppModel.Model, Cmd msg )
processChangeField model appModel field newValue =
  let
    newModel = changeField model field newValue
  in
    ( newModel, appModel, Cmd.none )

changeField : Model -> Field -> String -> Model
changeField model field newValue =
  case field of
    Name ->
      { model | name = newValue }

    Email ->
      { model | email = newValue }

    Password ->
      { model | password = newValue }

    RepeatPassword ->
      { model | repeatPassword = newValue }

processSendForm : Model -> AppModel.Model -> ( Model, AppModel.Model, Cmd msg )
processSendForm model appModel =

sendFormCmd : Model -> Cmd msg
  let
    url =
      "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic

    request =
      Http.get url decodeGifUrl
  in
    Http.send NewGif request