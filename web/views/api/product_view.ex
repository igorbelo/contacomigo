defmodule ContaComigo.Api.ProductView do
  use ContaComigo.Web, :view

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ContaComigo.Api.ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ContaComigo.Api.ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id, name: product.name, price: product.price}
  end
end
