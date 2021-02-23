defmodule ExPay.Numbers do
  @moduledoc """
  Module `Numbers` defines the logical to sum numbers.
  """
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Stream.map(&String.to_integer(&1))
      |> Enum.reduce(0, &(&1 + &2))

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "File not found"}}
end
