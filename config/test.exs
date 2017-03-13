use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :conta_comigo, ContaComigo.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :conta_comigo, ContaComigo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "igorbelo",
  password: "icb14cl43",
  database: "conta_comigo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :junit_formatter,
  report_file: "results.xml",
  print_report_file: true
