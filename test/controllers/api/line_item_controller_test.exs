defmodule ContaComigo.Api.LineItemControllerTest do
  use ContaComigo.ConnCase

  alias ContaComigo.LineItem
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, line_item_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    line_item = Repo.insert! %LineItem{}
    conn = get conn, line_item_path(conn, :show, line_item)
    assert json_response(conn, 200)["data"] == %{"id" => line_item.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, line_item_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, line_item_path(conn, :create), line_item: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(LineItem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, line_item_path(conn, :create), line_item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    line_item = Repo.insert! %LineItem{}
    conn = put conn, line_item_path(conn, :update, line_item), line_item: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(LineItem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    line_item = Repo.insert! %LineItem{}
    conn = put conn, line_item_path(conn, :update, line_item), line_item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    line_item = Repo.insert! %LineItem{}
    conn = delete conn, line_item_path(conn, :delete, line_item)
    assert response(conn, 204)
    refute Repo.get(LineItem, line_item.id)
  end
end
