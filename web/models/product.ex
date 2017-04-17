defmodule ContaComigo.Product do
  use ContaComigo.Web, :model

  schema "products" do
    field :name, :string
    field :price, :decimal
    belongs_to :store, ContaComigo.Store

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :price, :store_id])
    |> validate_required([:name, :price, :store_id])
  end
end
