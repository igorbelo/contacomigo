defmodule ContaComigo.Repo.Migrations.AddStoreIdToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :store_id, references(:stores, on_delete: :nothing)
    end
    create index(:products, [:store_id])
  end
end
