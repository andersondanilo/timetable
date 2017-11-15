module Timetable.Frontend.Model exposing (..)

import Timetable.Frontend.Common.Router exposing (Route)
import Timetable.Frontend.SignupPage.Model as SignupPageModel
import Timetable.Frontend.LoginPage.Model as LoginPageModel
import Timetable.Frontend.Common.Router exposing (toRoute)
import Navigation

type alias Model =
  { currentRoute : Route
  , signupPage : SignupPageModel.Model
  , loginPage : LoginPageModel.Model
  }

initialModel : Navigation.Location -> Model
initialModel location = 
  { currentRoute = toRoute(location)
  , signupPage = SignupPageModel.initialModel
  , loginPage = LoginPageModel.initialModel
  }