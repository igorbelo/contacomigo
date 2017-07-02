defmodule ContaComigo.Api.SessionView do
  use ContaComigo.Web, :view

  def render("user.json", user) do
    %{token: Map.get(user, :token)}
  end

  def render("not_found.json", params) do
    %{data: params["email"]}
  end
end
