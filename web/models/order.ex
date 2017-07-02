defmodule ContaComigo.Order do
  use ContaComigo.Web, :model

  schema "orders" do
    has_many :line_items, ContaComigo.LineItem
    belongs_to :customer, ContaComigo.Customer
    belongs_to :store, ContaComigo.Store
    field :paid, :boolean

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:customer_id, :store_id, :paid])
    |> validate_required([:customer_id, :store_id])
  end
end
