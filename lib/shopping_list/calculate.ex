defmodule ShoppingList.Calculate do
  @moduledoc """
    Calculate the values, sum and division functions
  """

  @doc """
    Validate if integer is positive

   ## Examples
    iex> import ShoppingList.Calculate
    iex> is_positive_integer(-10)
    false
    iex> is_positive_integer(10)
    true
  """
  defguard is_positive_integer(value) when is_integer(value) and value > 0

  @doc """
    Sum the values

    ## Examples
      iex> ShoppingList.Calculate.sum_values([["maçã", 10, 200], ["pizza", 5, 40000], ["carne", 5, 4000]])
      {:ok, 222000}
  """

  def sum_values(items) when is_list(items) do
    total =
      items
      |> Enum.reduce_while(0, fn
        [_item, quantity, item_value], acc
        when is_positive_integer(quantity) and is_positive_integer(item_value) ->
          {:cont, quantity * item_value + acc}

        [item, quantity, item_value], _acc
        when is_positive_integer(quantity) and not is_positive_integer(item_value) ->
          {:halt, %{item: "#{item}", error: :invalid_value}}

        [item, quantity, item_value], _acc
        when not is_positive_integer(quantity) and is_positive_integer(item_value) ->
          {:halt, %{item: "#{item}", error: :invalid_quantity}}

        [item, _quantity, _item_value], _acc ->
          {:halt, %{item: "#{item}", error: :invalid_quantity_and_value}}
      end)

    {:ok, total}
  end

  def split_bill(total, count_emails, emails) when is_integer(total) do
    value_per_email = div(total, count_emails)
    rest = rem(total, count_emails)

    emails
    |> set_value_in_emails(value_per_email)
    |> maybe_increase_rest(rest)
  end

  def split_bill(error, _count_emails, _emails), do: error

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
