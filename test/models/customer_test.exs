defmodule ContaComigo.CustomerTest do
  use ContaComigo.ModelCase

  alias ContaComigo.Customer

  @valid_attrs %{email: "some content", first_name: "some content", last_name: "some content", phone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Customer.changeset(%Customer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Customer.changeset(%Customer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
