defmodule ExPayWeb.AccountsControllerTest do
  use ExPayWeb.ConnCase, async: true

  alias ExPay.{Account, User}

  @valid_user %{
    name: "Notorious",
    password: "123456",
    nickname: "Big",
    email: "notorious@gmail.com",
    age: 27
  }

  @valid_attrs %{"value" => "10.00"}

  @invalid_attrs %{"value" => "pastel"}

  describe "deposit/2" do
    setup %{conn: conn} do
      {:ok, %User{account: %Account{id: account_id}}} = ExPay.create_user(@valid_user)
      conn = put_req_header(conn, "authorization", "Basic cGFzdGVsOmNhcm5l")
      {:ok, conn: conn, account_id: account_id}
    end

    test "with valid params do deposit", %{conn: conn, account_id: account_id} do
      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, @valid_attrs))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "10.00", "id" => _id},
               "message" => "Operation successfuly"
             } = response
    end

    test "with invalid params returns an error", %{conn: conn, account_id: account_id} do
      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, @invalid_attrs))
        |> json_response(:bad_request)

      expected_response = %{"message" => "invalid deposit value"}

      assert response == expected_response
    end
  end
end
