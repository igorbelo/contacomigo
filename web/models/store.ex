defmodule ContaComigo.Store do
  use ContaComigo.Web, :model

  schema "stores" do
    field :name, :string
    belongs_to :user, ContaComigo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
