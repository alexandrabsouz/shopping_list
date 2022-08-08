defmodule ShoppingList.Calculate do

  @items [["maçã", 10, 200], ["pizza", 5, 40000], ["carne", 5, 4000]]

  def multiplicate_values do
    @items
    |> Enum.map(fn [item, quantity, value] -> [item, quantity * value] end)
  end
end
