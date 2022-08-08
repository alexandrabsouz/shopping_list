defmodule ShoppingList do
  @moduledoc """
  Documentation for `ShoppingList`.
  """
  alias ShoppingList.Calculate

  @doc """
  Receives a list of items and a list of emails,
  handles and returns the division of values ​​for each email

  ## Examples

      iex> items = [["maçã", 10, 300], ["pizza", 5, 10], ["carne", 5, 4000]]
      iex> emails = ["alexandra@email.com", "pedro@email.com", "paulo@email.com"]
      iex> ShoppingList.fetch_lists(items, emails)
      [
        %{email: "alexandra@email.com", value: 7684},
        %{email: "pedro@email.com", value: 7683},
        %{email: "paulo@email.com", value: 7683}
      ]

  """

  def fetch_lists([], _emails), do: {:error, :empty_item_list}

  def fetch_lists(_items, []), do: {:error, :empty_email_list}

  def fetch_lists(items, emails) do
    with {:ok, total} <- Calculate.sum_values(items),
         uniq_emails <- Enum.uniq(emails),
         count_emails <- Enum.count(uniq_emails),
         map_emails <- Enum.map(uniq_emails, fn email -> %{email: email, value: nil} end) do
      Calculate.split_bill(total, count_emails, map_emails)
    end
  end
end
