# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ip_project_akselele,
  ecto_repos: [IpProjectAkselele.Repo]

# Configures the endpoint
config :ip_project_akselele, IpProjectAkseleleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/QfSuL113vwyjwU+pMlV0gGCYkw5eOjJ7zCVip8OUEinlVjaDA24lycSxOMkQlXo",
  render_errors: [view: IpProjectAkseleleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IpProjectAkselele.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "THrhKi51"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ip_project_akselele, IpProjectAkseleleWeb.Guardian,
  issuer: "ip_project_akselele",
  secret_key: "9qZ7nKQTgR17jEycovYZJD0GKDxrwAtizJjKTQrTbnpz9MZy7uNWYKJvF6/ksPG0" # paste input here

config :ip_project_akselele, IpProjectAkseleleWeb.Gettext,
  locales: ~w(en ja nl),
  default_locale: "ja"  

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
