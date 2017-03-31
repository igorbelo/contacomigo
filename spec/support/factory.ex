defmodule ContaComigo.Factory do
  use ExMachina.Ecto, repo: ContaComigo.Repo
  alias ContaComigo.Product
  alias ContaComigo.Customer
  alias ContaComigo.Order
  alias ContaComigo.LineItem
  alias ContaComigo.Address

  def product_factory do
    %Product{
      name: "Test Product",
      price: 15.99
    }
  end

  def customer_factory do
    %Customer{
      first_name: "Paulo",
      last_name: "Junior",
      email: "fakemail@fakedomain.faketld",
      phone: "99999999999"
    }
  end

  def order_factory do
    %Order{
      customer: build(:customer)
    }
  end

  def line_item_factory do
    %LineItem{
      order: build(:order),
      product: build(:product),
      quantity: 1
    }
  end

  def address_factory do
    %Address{
      customer: build(:customer),
      state: "StateName",
      city: "CityName",
      zip_code: "29000000",
      line1: "Line1"
    }
  end
end
