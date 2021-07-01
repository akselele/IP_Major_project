use Mix.Config

# Configure your database
config :ip_project_akselele, IpProjectAkselele.Repo,
  username: "root",
  password: "root",
  database: "ip_project_akselele_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ip_project_akselele, IpProjectAkseleleWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
