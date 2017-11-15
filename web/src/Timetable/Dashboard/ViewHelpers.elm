module Timetable.Dashboard.ViewHelpers exposing (..)

import Html exposing (Attribute)
import Timetable.Dashboard.Types exposing(Model, Msg(NavigateTo))
import Timetable.Common.ViewHelpers exposing (..)

clickTo : String -> List (Attribute Msg)
clickTo path =
  commonClickTo NavigateTo path