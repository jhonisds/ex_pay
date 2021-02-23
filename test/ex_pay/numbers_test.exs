defmodule ExPay.NumbersTest do
  use ExUnit.Case

  alias ExPay.Numbers

  describe "sum_from_file/1" do
    test "with valid file return success" do
      assert Numbers.sum_from_file("numbers") == {:ok, %{result: 37}}
    end

    test "with invalid file return an error" do
      assert Numbers.sum_from_file("invalid_file") == {:error, %{message: "File not found"}}
    end
  end
end
