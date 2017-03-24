defmodule ContaComigo.Api.LineItemController do
  use ContaComigo.Web, :controller

  alias ContaComigo.LineItem

  def index(conn, _params) do
    line_items = Repo.all(LineItem)
    render(conn, "index.json", line_items: line_items)
  end

  def create(conn, %{"line_item" => line_item_params}) do
    changeset = LineItem.changeset(%LineItem{}, line_item_params)

    case Repo.insert(changeset) do
      {:ok, line_item} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", line_item_path(conn, :show, line_item))
        |> render("show.json", line_item: line_item)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ContaComigo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    line_item = Repo.get!(LineItem, id)
    render(conn, "show.json", line_item: line_item)
  end

  def update(conn, %{"id" => id, "line_item" => line_item_params}) do
    line_item = Repo.get!(LineItem, id)
    changeset = LineItem.changeset(line_item, line_item_params)

    case Repo.update(changeset) do
      {:ok, line_item} ->
        render(conn, "show.json", line_item: line_item)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ContaComigo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    line_item = Repo.get!(LineItem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(line_item)

    send_resp(conn, :no_content, "")
  end
end
