defmodule ContaComigo.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :state, :string
      add :city, :string
      add :zip_code, :string
      add :line1, :string
      add :customer_id, references(:customers, on_delete: :nothing)

      timestamps()
    end
    create index(:addresses, [:customer_id])

  end
end
