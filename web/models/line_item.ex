defmodule ContaComigo.LineItem do
  use ContaComigo.Web, :model

  schema "line_items" do
    field :quantity, :integer
    belongs_to :order, ContaComigo.Order
    belongs_to :product, ContaComigo.Product

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:order_id, :product_id, :quantity])
    |> validate_required([:order_id, :product_id, :quantity])
  end
end
