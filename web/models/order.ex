defmodule ContaComigo.Order do
  use ContaComigo.Web, :model
  alias ContaComigo.LineItem
  alias ContaComigo.Repo

  schema "orders" do
    has_many :line_items, ContaComigo.LineItem
    belongs_to :customer, ContaComigo.Customer
    belongs_to :store, ContaComigo.Store
    field :paid, :boolean
    field :date, Ecto.Date

    timestamps()
  end

  def total(order) do
    items = from(i in LineItem, where: i.order_id == ^order.id)
    |> Repo.all()
    |> Repo.preload([:product, :order])
    x = if length(items) > 0 do
      Enum.reduce(items, fn(item, acc) -> 1 + acc end)
    else
      0
    end
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:customer_id, :store_id, :paid, :date])
    |> validate_required([:customer_id, :store_id, :date])
  end
end
