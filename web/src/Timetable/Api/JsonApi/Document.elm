module Timetable.Api.JsonApi.Document exposing(..)

type alias Document =
  { meta : Attributes
  , data : Data
  , included : List Resource
  }

type Data
  = Resource
  | List Resource

type alias Resource = 
  { type_ : String
  , id : String
  , attributes : Attributes
  }

type alias Attributes = Dict String String