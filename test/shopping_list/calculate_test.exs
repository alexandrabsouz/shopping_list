defmodule ShoppingList.CalculateTest do
  use ExUnit.Case
  doctest ShoppingList.Calculate

  alias ShoppingList.Calculate

  describe "split_bill/3" do
    test "when string in value, returns a error" do
      response = Calculate.split_bill("4444000", 4, ["email@email.com"])

      expected_response =  "4444000"

      assert response == expected_response
    end
  end

  test "when rest div is == 0, returns a igual value for all persons" do
    response = Calculate.split_bill(44, 2, [%{email: "email@email.com", value: nil}, %{email: "email2@email.com", value: nil}])

    expected_response =  [%{email: "email@email.com", value: 22}, %{email: "email2@email.com", value: 22}]

    assert response == expected_response
  end
end
