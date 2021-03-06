defmodule ContaComigo.Api.SessionController do
  use ContaComigo.Web, :controller
  alias ContaComigo.Repo
  alias ContaComigo.User

  def create(conn, params) do
    case Repo.get_by(User, email: params["email"]) do
      nil -> conn |> put_status(:not_found) |> render("not_found.json", params)
      user ->
        case User.checkpw(params["password"], Map.get(user, :password_hash)) do
          false -> conn |> put_status(:not_found) |> render("not_found.json", params)
          true -> render(conn, "user.json", user)
        end
    end
  end
end
