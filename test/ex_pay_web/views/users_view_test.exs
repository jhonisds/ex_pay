defmodule ExPayWeb.UsersViewTest do
  use ExPayWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  alias ExPay.{Account, User}
  alias ExPay.Users.Create
  alias ExPayWeb.UsersView

  @valid_attrs %{
    name: "Notorious",
    password: "123456",
    nickname: "Big",
    email: "notorious@gmail.com",
    age: 27
  }

  test "renders create.json" do
    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Create.call(@valid_attrs)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{balance: Decimal.new("0.00"), id: account_id},
        email: "notorious@gmail.com",
        id: user_id,
        name: "Notorious",
        nickname: "Big"
      }
    }

    assert response == expected_response
  end
end
