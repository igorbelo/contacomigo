defmodule ContaComigo.Api.LineItemView do
  use ContaComigo.Web, :view

  def render("index.json", %{line_items: line_items}) do
    %{data: render_many(line_items, ContaComigo.Api.LineItemView, "line_item.json")}
  end

  def render("show.json", %{line_item: line_item}) do
    %{data: render_one(line_item, ContaComigo.Api.LineItemView, "line_item.json")}
  end

  def render("line_item.json", %{line_item: line_item}) do
    %{id: line_item.id}
  end
end
