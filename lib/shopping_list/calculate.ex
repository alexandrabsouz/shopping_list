defmodule ShoppingList.Calculate do
  @moduledoc """
    Calculate the values, sum and division functions
  """

  @doc """
    iex: sum_values([["maçã", 10, 200], ["pizza", 5, 40000], ["carne", 5, 4000]])
    {:ok, 223000}
  """

  def sum_values(items) when is_list(items) do
    total =
      items
      |> Enum.map(fn [_item, quantity, value] -> quantity * value end)
      |> Enum.sum()

    {:ok, total}
  end

  def split_bill(total, count_emails, emails) do
    value_per_email = div(total, count_emails)
    rest = rem(total, count_emails)

    emails
    |> set_value_in_emails(value_per_email)
    |> maybe_increase_rest(rest)
  end

  defp set_value_in_emails(emails, value_per_email) do
    Enum.map(emails, fn email -> %{email | value: value_per_email} end)
  end

  defp maybe_increase_rest(emails, 0), do: emails

  defp maybe_increase_rest(emails, rest) do
    0..(rest - 1)
    |> Enum.reduce(emails, fn pos, acc ->
      List.update_at(acc, pos, fn email -> %{email | value: email.value + 1} end)
    end)
  end
end
