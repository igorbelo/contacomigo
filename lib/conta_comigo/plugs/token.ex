defmodule ContaComigo.Plugs.Token do
  import Plug.Conn
  alias ContaComigo.User
  alias ContaComigo.Repo

  def init(default), do: default

  def call(conn, _default) do
    token = conn
    |> get_req_header("authorization")
    |> Enum.at(0)
    |> String.split("Bearer ")
    |> Enum.at(-1)
    case Repo.get_by(User, token: token) do
      nil -> conn |> put_status(:forbidden)
      user -> conn |> assign(:user_id, user.id)
    end
  end
end
