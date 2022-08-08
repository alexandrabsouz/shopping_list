defmodule ShoppingList.Calculate do

  #@items [["maçã", 10, 200], ["pizza", 5, 40000], ["carne", 5, 4000]]

  def sum_values(items) when is_list(items) do
    total =
      items
      |> Enum.map(fn [_item, quantity, value] -> quantity * value end)
      |> Enum.sum()

    {:ok, total}
  end
end
