module Timetable.Dashboard.Main where

import Timetable.Dashboard.App exposing (startApp)
import Timetable.Dashboard.Routes exposing (router)
import Timetable.Dashboard.Types exposing (Model)
import Signal
import Effects exposing (Never)
import StartApp
import Task exposing (Task)
import Html exposing(Html)

app : StartApp.App Model
app =
  startApp

main : Signal Html
main =
  app.html

port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks

port routeRunTask : Task () ()
port routeRunTask =
  router.run