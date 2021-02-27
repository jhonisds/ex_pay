defmodule ExPay.Accounts.Operation do
  @moduledoc """
  Module `Operation`.
  """
  alias Ecto.Multi
  alias ExPay.Account

  def call(%{"id" => id, "value" => value}, operation) do
    operation_type = operation_name(operation)

    Multi.new()
    |> Multi.run(operation_type, fn repo, _changes ->
      get_account(repo, id)
    end)
    |> Multi.run(operation, fn repo, changes ->
      account = Map.get(changes, operation_type)
      update_balance(repo, account, value, operation)
    end)

    # |> Multi.run(operation, &update_balance(&1, &2.account, value, operation))
  end

  defp get_account(repo, id) do
    case repo.get(Account, id) do
      nil -> {:error, "Account not found"}
      account -> {:ok, account}
    end
  end

  defp update_balance(repo, account, value, operation) do
    account
    |> operation(value, operation)
    |> update_account(repo, account)
  end

  defp operation(%Account{balance: balance}, value, operation) do
    value
    |> Decimal.cast()
    |> handle_cast(balance, operation)
  end

  defp handle_cast({:ok, value}, balance, :deposit), do: Decimal.add(balance, value)
  defp handle_cast({:ok, value}, balance, :withdraw), do: Decimal.sub(balance, value)
  defp handle_cast(:error, _reason, operation), do: {:error, "invalid #{operation} value"}

  defp update_account({:error, _reason} = error, _repo, _account), do: error

  defp update_account(value, repo, account) do
    params = %{balance: value}

    account
    |> Account.changeset(params)
    |> repo.update()
  end

  defp operation_name(operation) do
    "account_#{Atom.to_string(operation)}" |> String.to_atom()
  end
end
