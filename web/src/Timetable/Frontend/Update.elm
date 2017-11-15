module Timetable.Frontend.Update exposing (..)

import Navigation
import Timetable.Frontend.SignupPage.Update as SignupPageUpdate
import Timetable.Frontend.LoginPage.Update as LoginPageUpdate
import Timetable.Frontend.Model exposing(Model)
import Timetable.Frontend.Common.Router exposing(toRoute)

type Msg
  = UrlChange Navigation.Location
  | NavigateTo String
  | MsgForSignupPage SignupPageUpdate.Msg
  | MsgForLoginPage LoginPageUpdate.Msg

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UrlChange location ->
      ( { model | currentRoute = toRoute(location) }
      , Cmd.none
      )

    NavigateTo path ->
      ( model, Navigation.newUrl(path) )

    MsgForSignupPage nestedMsg ->
      handleMsgForSignupPage nestedMsg model

    MsgForLoginPage nestedMsg ->
      handleMsgForLoginPage nestedMsg model

handleMsgForSignupPage : SignupPageUpdate.Msg -> Model -> (Model, Cmd msg)
handleMsgForSignupPage msg model = 
  let
    (newNestedModel, newModel, cmd) =
      SignupPageUpdate.update msg model.signupPage model
  in
    ( { newModel | signupPage = newNestedModel }
    , cmd
    )

handleMsgForLoginPage : LoginPageUpdate.Msg -> Model -> (Model, Cmd msg)
handleMsgForLoginPage msg model = 
  let
    (newNestedModel, newModel, cmd) =
      LoginPageUpdate.update msg model.loginPage model
  in
    ( { newModel | loginPage = newNestedModel }
    , cmd
    )