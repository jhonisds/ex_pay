defmodule ExPay.Accounts.Deposit do
  @moduledoc """
  Module `Deposit`.
  """

  alias ExPay.Accounts.Operation
  alias ExPay.Repo

  def call(params) do
    params
    |> Operation.call(:deposit)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{deposit: account}} -> {:ok, account}
    end
  end
end
