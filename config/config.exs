# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_pay,
  ecto_repos: [ExPay.Repo]

# Configures the endpoint
config :ex_pay, ExPayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XRpKjxi4afxgsWAtxTT94n8YKmQj9EbtbCHWnK/KWhTjhq9iuU52sRpTKW5R790H",
  render_errors: [view: ExPayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExPay.PubSub,
  live_view: [signing_salt: "JCjk5bEA"]

# Configures binary id
config :ex_pay, ExPay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures authentication
config :ex_pay, :basic_auth,
  username: "pastel",
  password: "carne"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
