module Timetable.Frontend.Common.ViewHelpers exposing (..)

import Html exposing (Attribute)
import Timetable.Frontend.Model exposing(Model)
import Timetable.Frontend.Update exposing (Msg(NavigateTo))
import Timetable.Common.ViewHelpers exposing (commonClickTo)

clickTo : String -> List (Attribute Msg)
clickTo path =
  commonClickTo NavigateTo path