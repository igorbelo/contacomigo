defmodule ContaComigo.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :phone, :string

      timestamps()
    end

  end
end
