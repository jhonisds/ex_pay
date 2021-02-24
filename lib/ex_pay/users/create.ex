defmodule ExPay.Users.Create do
  @moduledoc """
  Module `Create` users.
  """
  alias ExPay.{Repo, User}

  def call(attrs) do
    attrs
    |> User.changeset()
    |> Repo.insert()
  end
end
