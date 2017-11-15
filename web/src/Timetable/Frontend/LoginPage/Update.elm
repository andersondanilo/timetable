module Timetable.Frontend.LoginPage.Update exposing (..)

import Timetable.Frontend.LoginPage.Model exposing(Model)
import Timetable.Frontend.Model as AppModel

type Msg
  = ChangeUsername String
  | ChangePassword String

update : Msg -> Model -> AppModel.Model -> (Model, AppModel.Model, Cmd msg)
update msg model appModel =
  (model, appModel, Cmd.none)