defmodule ContaComigo.Api.OrderView do
  use ContaComigo.Web, :view

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, ContaComigo.Api.OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, ContaComigo.Api.OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id}
  end
end
