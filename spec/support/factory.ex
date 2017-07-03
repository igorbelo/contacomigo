defmodule ContaComigo.Factory do
  use ExMachina.Ecto, repo: ContaComigo.Repo
  alias ContaComigo.Product
  alias ContaComigo.Customer
  alias ContaComigo.Order
  alias ContaComigo.LineItem
  alias ContaComigo.Address
  alias ContaComigo.Store
  alias ContaComigo.User

  def user_factory do
    %User{
      name: "Igor",
      email: "#{Ecto.UUID.generate()}@gmail.com",
      token: "test-token"
    }
  end

  def store_factory do
    %Store{
      name: "StoreName",
      user_id: insert(:user).id
    }
  end

  def product_factory do
    %Product{
      store_id: insert(:store).id,
      name: "Test Product",
      price: 15.99
    }
  end

  def customer_factory do
    %Customer{
      store_id: insert(:store).id,
      name: "Paulo Junior",
      email: "fakemail@fakedomain.faketld",
      phone: "99999999999"
    }
  end

  def order_factory do
    %Order{
      store_id: insert(:store).id,
      customer_id: insert(:customer).id,
      date: Ecto.Date.utc
    }
  end

  def line_item_factory do
    %LineItem{
      order_id: insert(:order).id,
      product_id: insert(:product).id,
      quantity: 1
    }
  end

  def address_factory do
    %Address{
      customer_id: insert(:customer).id,
      state: "StateName",
      city: "CityName",
      zip_code: "29000000",
      line1: "Line1"
    }
  end
end
