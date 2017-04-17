defmodule ContaComigo.Repo.Migrations.AddStoreIdToCustomers do
  use Ecto.Migration

  def change do
    alter table(:customers) do
      add :store_id, references(:stores, on_delete: :nothing)
    end
    create index(:customers, [:store_id])
  end
end
