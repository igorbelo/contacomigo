defmodule ContaComigo.Repo.Migrations.AddDateToOrders do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :date, :date
    end
  end
end
