defmodule ExPayWeb.FallbackController do
  @moduledoc """
  Controller `Fallback`
  """
  use ExPayWeb, :controller

  def call(conn, {:error, result}) do
    IO.inspect("call fallback", label: "FallbackController")

    conn
    |> put_status(:bad_request)
    |> put_view(ExPayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
