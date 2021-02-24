defmodule ExPayWeb.UsersView do
  use ExPayWeb, :view

  alias ExPay.{Account, User}

  def render("create.json", %{
        user: %User{
          id: id,
          name: name,
          nickname: nickname,
          email: email,
          account: %Account{} = account
        }
      }) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        email: email,
        account: %{
          balance: account.balance,
          id: account.id
        }
      }
    }
  end
end
