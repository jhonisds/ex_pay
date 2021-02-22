defmodule ExPay.Repo do
  use Ecto.Repo,
    otp_app: :ex_pay,
    adapter: Ecto.Adapters.Postgres
end
