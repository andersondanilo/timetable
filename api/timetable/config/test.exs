use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :timetable, Timetable.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :timetable, Timetable.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "timetable_user",
  password: "timetable@password",
  database: "timetable_db",
  hostname: "database_test",
  pool: Ecto.Adapters.SQL.Sandbox
