# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# application specific configuration
config :checker_mal,
  # seconds, as an integer
  mal_wait_time: 10,
  mal_error_wait_time: :timer.minutes(1)

config :checker_mal,
  ecto_repos: [CheckerMal.Repo]

# Configures the endpoint
config :checker_mal, CheckerMalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IYcT26juWUyS5Vx0ptI3GHZOA3qA8Bhgy39YMeqEoJLBfvJqZF1ZDldXsPCqcIhW",
  render_errors: [view: CheckerMalWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CheckerMal.PubSub,
  live_view: [signing_salt: "5ClqTJQe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
