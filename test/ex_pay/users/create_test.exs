defmodule ExPay.CreateTest do
  use ExPay.DataCase

  alias ExPay.User
  alias ExPay.Users.Create

  @valid_attrs %{
    name: "Notorious",
    password: "123456",
    nickname: "Big",
    email: "notorious@gmail.com",
    age: 27
  }

  @invalid_attrs %{
    name: "Notorious",
    nickname: "Big",
    email: "notorious@gmail.com",
    age: 15
  }

  describe "call/1" do
    test "when all params are valid returns an user" do
      {:ok, %User{id: user_id}} = Create.call(@valid_attrs)
      user = Repo.get(User, user_id)

      assert %User{name: "Notorious", age: 27, id: ^user_id} = user
    end

    test "with invalid params returns an error" do
      {:error, changeset} = Create.call(@invalid_attrs)

      expected = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected
    end
  end
end
