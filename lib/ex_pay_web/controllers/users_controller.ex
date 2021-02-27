defmodule ExPayWeb.UsersController do
  @moduledoc """
  Controller `Users`.
  """
  use ExPayWeb, :controller

  alias ExPay.User

  action_fallback ExPayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- ExPay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
