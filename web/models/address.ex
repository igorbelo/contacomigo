defmodule ContaComigo.Address do
  use ContaComigo.Web, :model

  schema "addresses" do
    field :state, :string
    field :city, :string
    field :zip_code, :string
    field :line1, :string
    belongs_to :customer, ContaComigo.Customer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:state, :city, :zip_code, :line1])
    |> validate_required([:state, :city, :zip_code, :line1])
  end
end
