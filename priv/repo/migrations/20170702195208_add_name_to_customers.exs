defmodule ContaComigo.Repo.Migrations.AddNameToCustomers do
  use Ecto.Migration

  def change do
    alter table(:customers) do
      add :name, :string
      remove :first_name
      remove :last_name
    end
  end
end
