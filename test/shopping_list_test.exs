defmodule ShoppingListTest do
  use ExUnit.Case
  doctest ShoppingList

  alias ShoppingList

  @emails ["alexandra@email.com", "pedro@email.com", "paulo@email.com"]
  @duplicated_emails ["alexandra@email.com", "pedro@email.com", "paulo@email.com", "paulo@email.com"]

  @items [["maçã", 10, 300], ["pizza", 5, 10], ["carne", 5, 4000]]
  @items_inválid_quantity [["maçã", 0, 300], ["pizza", 5, 10], ["carne", 5, 4000]]
  @items_inválid_value [["maçã", 4, 300], ["pizza", 5, 0], ["carne", 5, 4000]]

  describe "fetch_lists/2" do
    test "when all params is valid, returns split bill" do
      response = ShoppingList.fetch_lists(@items, @emails)

      expected_response = [
        %{email: "alexandra@email.com", value: 7684},
        %{email: "pedro@email.com", value: 7683},
        %{email: "paulo@email.com", value: 7683}
      ]

      assert response == expected_response
    end

    test "when duplicate email, count just one person" do
      response = ShoppingList.fetch_lists(@items, @duplicated_emails)

      total_email
        = response
        |> Enum.count()

      refute total_email == Enum.count(@duplicated_emails)
    end


    test "when empty email, returns an error" do
      response = ShoppingList.fetch_lists(@items, [])

      expected_response =  {:error, :empty_email_list}

      assert ^response = expected_response
    end
  end
end
