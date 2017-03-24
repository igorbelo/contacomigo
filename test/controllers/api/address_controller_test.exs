defmodule ContaComigo.Api.AddressControllerTest do
  use ContaComigo.ConnCase

  alias ContaComigo.Api.Address
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, address_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    address = Repo.insert! %Address{}
    conn = get conn, address_path(conn, :show, address)
    assert json_response(conn, 200)["data"] == %{"id" => address.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, address_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, address_path(conn, :create), address: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Address, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, address_path(conn, :create), address: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    address = Repo.insert! %Address{}
    conn = put conn, address_path(conn, :update, address), address: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Address, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    address = Repo.insert! %Address{}
    conn = put conn, address_path(conn, :update, address), address: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    address = Repo.insert! %Address{}
    conn = delete conn, address_path(conn, :delete, address)
    assert response(conn, 204)
    refute Repo.get(Address, address.id)
  end
end
