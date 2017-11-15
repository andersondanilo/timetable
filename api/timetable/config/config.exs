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

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Timetable",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: %{
    "crv" => "P-521",
    "d" => "WY1xl9YaGCJQpOpjFE3-Cof0itfb9tcYfq1OjGGMQMXqGIAknPujr93sB_UVyB1YxMj-CTXquBC0ofR87b1wBPo",
    "kty" => "EC",
    "x" => "AW53zftlge7jJJvbtmiD792YWdgW9lnrWuP13YTl8FJeylyK-RcdVFmIBC6aFAfSVArY48FRCdnaRT2WxIr1FKzv",
    "y" => "AOREMRoO7QnOK3PiTuRGrxagQRLCDnjJhimyOXCYj14cCmWVFhQF6TcOlsCiMG47LyUUfz0qg3KH4cENig2MD3nL"
  },
  serializer: Timetable.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
