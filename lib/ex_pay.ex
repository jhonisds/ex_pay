defmodule ExPay do
  @moduledoc """
  ExPay keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias ExPay.Users.Create, as: UserCreate
  alias ExPay.Accounts.{Deposit, Withdraw}

  defdelegate create_user(attrs), to: UserCreate, as: :call
  defdelegate deposit(attrs), to: Deposit, as: :call
  defdelegate withdraw(attrs), to: Withdraw, as: :call
end
