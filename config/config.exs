# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :starwars_store_api,
  ecto_repos: [StarwarsStoreApi.Repo]

# Configures the endpoint
config :starwars_store_api, StarwarsStoreApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0g8R005DiBTKvhaHQxEV37EvKbw51D0X6uqIO7Ze0BDvu4z/IwuSv+ChSfZ9dUqN",
  render_errors: [view: StarwarsStoreApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: StarwarsStoreApi.PubSub,
  live_view: [signing_salt: "4CTkWowc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
