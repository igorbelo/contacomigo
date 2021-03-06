# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :conta_comigo,
  ecto_repos: [ContaComigo.Repo]

# Configures the endpoint
config :conta_comigo, ContaComigo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6QBAJ6cH4KywjWz9+yNzfkWu8AM6JcqG5woPMDcyLjrPFwJvZ0tkJcoCI8NVK9/Z",
  render_errors: [view: ContaComigo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ContaComigo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: ContaComigo.User,
  repo: ContaComigo.Repo,
  module: ContaComigo,
  logged_out_url: "/",
  opts: [:registerable, :authenticatable]
# %% End Coherence Configuration %%

config :ex_admin,
  repo: ContaComigo.Repo,
  module: ContaComigo,
  modules: [
    ContaComigo.ExAdmin.Dashboard,
    ContaComigo.ExAdmin.Product,
    ContaComigo.ExAdmin.Customer,
    ContaComigo.ExAdmin.Order,
    ContaComigo.ExAdmin.LineItem
  ]

config :xain, :after_callback, {Phoenix.HTML, :raw}
