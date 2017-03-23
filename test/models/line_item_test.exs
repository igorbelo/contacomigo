defmodule ContaComigo.LineItemTest do
  use ContaComigo.ModelCase

  alias ContaComigo.LineItem

  @valid_attrs %{quantity: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LineItem.changeset(%LineItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LineItem.changeset(%LineItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
