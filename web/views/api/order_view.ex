defmodule ContaComigo.Api.OrderView do
  use ContaComigo.Web, :view

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, ContaComigo.Api.OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, ContaComigo.Api.OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      customer: render_one(
        order.customer, ContaComigo.Api.CustomerView, "customer.json"
      ),
      items: render_many(
        order.line_items, ContaComigo.Api.LineItemView, "line_item.json"
      )
    }
  end
end
