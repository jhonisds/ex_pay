defmodule ExPayWeb.AccountsController do
  @moduledoc """
  Module controller `Accounts`
  """
  use ExPayWeb, :controller

  alias ExPay.Account
  alias ExPay.Accounts.Transactions.Response

  action_fallback ExPayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- ExPay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- ExPay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    task = Task.async(fn -> ExPay.transaction(params) end)

    with {:ok, %Response{} = transaction} <- Task.await(task) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
