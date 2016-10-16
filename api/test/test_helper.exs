ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Timetable.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Timetable.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Timetable.Repo)

