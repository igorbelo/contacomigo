defmodule ContaComigo.Api.RegistrationView do
  use ContaComigo.Web, :view

  def render("user.json", user) do
    %{token: Map.get(user, :token)}
  end

  def render("error.json", _changeset) do
    %{error: true}
  end
end
