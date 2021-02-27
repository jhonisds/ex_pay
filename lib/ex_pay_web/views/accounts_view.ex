defmodule ExPayWeb.AccountsView do
  use ExPayWeb, :view

  alias ExPay.Account
  alias ExPay.Accounts.Transactions.Response

  def render("update.json", %{account: %Account{} = account}) do
    %{
      message: "Operation successfuly",
      account: %{
        balance: account.balance,
        id: account.id
      }
    }
  end

  def render("transaction.json", %{
        transaction: %Response{to_account: to_account, from_account: from_account}
      }) do
    %{
      message: "Transaction done successfuly",
      transaction: %{
        from_account: %{
          balance: from_account.balance,
          id: from_account.id
        },
        to_account: %{
          balance: to_account.balance,
          id: to_account.id
        }
      }
    }
  end
end
