defmodule Timetable.UserView do
  use Timetable.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name, :email, :inserted_at]
end
