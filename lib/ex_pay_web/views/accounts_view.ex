defmodule ExPayWeb.AccountsView do
  use ExPayWeb, :view

  alias ExPay.Account

  def render("update.json", %{account: %Account{} = account}) do
    %{
      message: "Operation successfuly",
      account: %{
        balance: account.balance,
        id: account.id
      }
    }
  end
end
