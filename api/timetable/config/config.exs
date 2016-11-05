# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :timetable,
  ecto_repos: [Timetable.Repo]

# Configures the endpoint
config :timetable, Timetable.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7ZpsvLDD52tIuQRyYgdJqfXRKvzbNeRZT9vdsJWGEjDtH8KvqrQ5SlrAXZpLO9+Z",
  render_errors: [view: Timetable.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Timetable.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"],
  "application/json" => ["json-api"]
} 

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
