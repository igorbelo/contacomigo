# defimpl Poison.Encoder, for: Any do
#   def encode(%{__struct__: _} = struct, options) do
#     map = struct
#           |> Map.from_struct
#           |> sanitize_map
#     Poison.Encoder.Map.encode(map, options)
#   end

#   defp sanitize_map(map) do
#     Map.drop(map, [:__meta__, :__struct__])
#   end
# end

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

  def render("customer_order.json", %{order: order}) do
    %{
      id: order.id,
      items: render_many(
        order.line_items, ContaComigo.Api.LineItemView, "line_item.json"
      )
    }
  end
end
