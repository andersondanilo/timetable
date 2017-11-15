module Timetable.Api.Client exposing(..)

import Http
import Json

baseUrl = "http://localhost:4000/"

apiUrlWithParams : String -> List String -> String
apiUrlWithParams path params =
  Http.url (apiUrl path) params

apiUrl : String -> String
apiUrl path =
  (baseUrl ++ path)
