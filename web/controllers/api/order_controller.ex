defmodule ContaComigo.Api.OrderController do
  use ContaComigo.Web, :controller

  alias ContaComigo.Order
  alias ContaComigo.LineItem
  alias ContaComigo.Store

  def index(conn, _params) do
    orders = Repo.all(Order) |> Repo.preload([:customer, line_items: :product])
    render(conn, "index.json", orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    store = Repo.get_by(Store, user_id: conn.assigns[:user_id])
    changeset = Order.changeset(%Order{store_id: store.id}, order_params)

    case Repo.insert(changeset) do
      {:ok, order} ->
        order = Repo.preload(order, [:customer, :line_items])
        Enum.each(order_params["items"], fn(item) ->
          item_changeset = LineItem.changeset(%LineItem{order_id: order.id}, item)
          Repo.insert(item_changeset)
        end)
        order = Repo.get_by(Order, id: order.id) |> Repo.preload([:customer, line_items: :product])
        conn
        |> put_status(:created)
        |> put_resp_header("location", order_path(conn, :show, order))
        |> render("show.json", order: order)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ContaComigo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Repo.get!(Order, id) |> Repo.preload([:customer, :line_items])
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Repo.get!(Order, id)
    changeset = Order.changeset(order, order_params)

    case Repo.update(changeset) do
      {:ok, order} ->
        render(conn, "show.json", order: order)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ContaComigo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Repo.get!(Order, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(order)

    send_resp(conn, :no_content, "")
  end
end
