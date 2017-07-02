defmodule ContaComigo.Api.CustomerView do
  use ContaComigo.Web, :view

  def render("index.json", %{customers: customers}) do
    %{data: render_many(customers, ContaComigo.Api.CustomerView, "customer.json")}
  end

  def render("show.json", %{customer: customer}) do
    %{data: render_one(customer, ContaComigo.Api.CustomerView, "customer.json")}
  end

  def render("customer.json", %{customer: customer}) do
    %{
      id: customer.id,
      name: customer.name,
      email: customer.email,
      phone: customer.phone,
      orders: render_many(customer.orders, ContaComigo.Api.OrderView, "customer_order.json")
    }
  end

  def render("order_customer.json", %{customer: customer}) do
    %{
      id: customer.id,
      name: customer.name,
      email: customer.email,
      phone: customer.phone
    }
  end
end
