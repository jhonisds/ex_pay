defmodule ExPayWeb.AccountsController do
  @moduledoc """
  Module controller `Accounts`
  """
  use ExPayWeb, :controller

  alias ExPay.Account

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
end
