module Timetable.Api.JsonApi.Decoder exposing(..)

import Json.Decoder exposing(..)
import Timetable.Api.JsonApi.Document exposing(..)

decoder : (Dict String Decoder) -> Decoder Document
decoder =
