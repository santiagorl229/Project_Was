defmodule Wasproject.RolControllerTest do
  use Wasproject.ConnCase

  alias Wasproject.Rol
  @valid_attrs %{nombre: "some nombre"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, rol_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    rol = Repo.insert! %Rol{}
    conn = get conn, rol_path(conn, :show, rol)
    assert json_response(conn, 200)["data"] == %{"id" => rol.id,
      "nombre" => rol.nombre}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, rol_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, rol_path(conn, :create), rol: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Rol, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, rol_path(conn, :create), rol: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    rol = Repo.insert! %Rol{}
    conn = put conn, rol_path(conn, :update, rol), rol: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Rol, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    rol = Repo.insert! %Rol{}
    conn = put conn, rol_path(conn, :update, rol), rol: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    rol = Repo.insert! %Rol{}
    conn = delete conn, rol_path(conn, :delete, rol)
    assert response(conn, 204)
    refute Repo.get(Rol, rol.id)
  end
end
