defmodule ContaComigo.Factory do
  use ExMachina.Ecto, repo: ContaComigo.Repo
  alias ContaComigo.Product

  def product_factory do
    %Product{
      name: "Test Product",
      price: 15.99
    }
  end
end
