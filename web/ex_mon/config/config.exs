# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_mon,
  ecto_repos: [ExMon.Repo]

# Configures the endpoint
config :ex_mon, ExMonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QQH/Xz/Wtxw1VX/XUT+3TCZtL3E/71p+Lf9jeay6dlT7hDmv/tmuRUGvy9MpE3hI",
  render_errors: [view: ExMonWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExMon.PubSub,
  live_view: [signing_salt: "FXqpfWDL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ex_mon, ExMonWeb.Auth.Guardian,
  issuer: "ex_mon",
  secret_key: "i8MSYHjFjqgllbUxNm72vN42BcxlQFINvD53ZKo6dknIzz+0YWBNY0d8k9ICJA4J"

# "Secret key. You can use `mix guardian.gen.secret` to get one"
config :ex_mon, ExMonWeb.Auth.Pipeline,
  module: ExMonWeb.Auth.Guardian,
  error_handler: ExMonWeb.Auth.ErrorHandler
