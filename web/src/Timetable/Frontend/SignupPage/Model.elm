module Timetable.Frontend.SignupPage.Model exposing (..)

type alias Model =
  { name : String
  , email : String
  , password : String
  , repeatPassword : String
  , isSending : Bool
  }

initialModel : Model
initialModel =
  { name = ""
  , email = ""
  , password = ""
  , repeatPassword = ""
  , isSending = False
  }
