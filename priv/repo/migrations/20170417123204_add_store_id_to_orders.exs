defmodule ContaComigo.Repo.Migrations.AddStoreIdToOrders do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :store_id, references(:stores, on_delete: :nothing)
    end
    create index(:orders, [:store_id])
  end
end
