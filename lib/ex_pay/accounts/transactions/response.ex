defmodule ExPay.Accounts.Transactions.Response do
  @moduledoc """
  Module `Response` defines strcuture.
  """

  defstruct [:from_account, :to_account]

  alias ExPay.Account

  def build(%Account{} = from_account, %Account{} = to_account) do
    %__MODULE__{
      from_account: from_account,
      to_account: to_account
    }
  end
end
