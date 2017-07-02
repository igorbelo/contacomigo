defmodule ContaComigo.Repo.Migrations.AddPaidToOrders do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :paid, :boolean, default: false
    end
  end
end
