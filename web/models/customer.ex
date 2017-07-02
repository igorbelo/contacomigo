defmodule ContaComigo.Customer do
  use ContaComigo.Web, :model

  schema "customers" do
    field :name, :string
    field :email, :string
    field :phone, :string
    has_many :addresses, ContaComigo.Address
    belongs_to :store, ContaComigo.Store
    has_many :orders, ContaComigo.Order

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :phone, :store_id])
    |> validate_required([:name, :email, :phone, :store_id])
  end
end
