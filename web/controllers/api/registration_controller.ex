defmodule ContaComigo.Api.RegistrationController do
  use ContaComigo.Web, :controller
  alias ContaComigo.Repo
  alias ContaComigo.User
  alias ContaComigo.Store

  def create(conn, params) do
    u = User.changeset(%User{token: Ecto.UUID.generate()}, params)
    case Repo.insert(u) do
      {:ok, user} ->
        s = Store.changeset(%Store{user_id: Map.get(user, :id)}, params["store"])
        Repo.insert(s)
        render(conn, "user.json", user)
      {:error, changeset} ->
        conn
        |> put_status(400)
        |> render("error.json", changeset: changeset)
    end
  end
end
