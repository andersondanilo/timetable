defmodule Timetable.Router do
  use Timetable.Web, :router

  pipeline :api do
    plug :accepts, ["json-api"]
  end

  scope "/", Timetable do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
