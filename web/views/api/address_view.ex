defmodule ContaComigo.Api.AddressView do
  use ContaComigo.Web, :view

  def render("index.json", %{addresses: addresses}) do
    %{data: render_many(addresses, ContaComigo.Api.AddressView, "address.json")}
  end

  def render("show.json", %{address: address}) do
    %{data: render_one(address, ContaComigo.Api.AddressView, "address.json")}
  end

  def render("address.json", %{address: address}) do
    %{id: address.id}
  end
end
