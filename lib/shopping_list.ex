defmodule ShoppingList do
  alias ShoppingList.Calculate

  @moduledoc """
  Documentation for `ShoppingList`.
  """

  @doc """
  Receives a list of items and a list of emails,
  handles and returns the division of values ​​for each email

  ## Examples

      iex> ShoppingList.fetch_lists(@items, @emails)
      [
        %{email: "alexandra@email.com", value: 74334},
        %{email: "pedro@email.com", value: 74333},
        %{email: "paulo@email.com", value: 74333}
      ]

  """

  @emails ["alexandra@email.com", "pedro@email.com", "paulo@email.com"]
  @items [["maçã", 10, 300], ["pizza", 5, 40000], ["carne", 5, 4000]]

  def fetch_lists(items \\ @items, emails \\ @emails) do
    with {:ok, total} <- Calculate.sum_values(items),
         uniq_emails <- Enum.uniq(emails),
         count_emails <- Enum.count(uniq_emails),
         map_emails <- Enum.map(uniq_emails, fn email -> %{email: email, value: nil} end) do
      Calculate.split_bill(total, count_emails, map_emails)
    end
  end
end
