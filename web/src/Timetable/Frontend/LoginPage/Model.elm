module Timetable.Frontend.LoginPage.Model exposing (..)

type alias Model =
  { username : String
  , password: String
  }

initialModel : Model
initialModel = 
  { username = ""
  , password = ""
  }
