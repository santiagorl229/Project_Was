defmodule Wasproject.RolTest do
  use Wasproject.ModelCase

  alias Wasproject.Rol

  @valid_attrs %{nombre: "some nombre"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Rol.changeset(%Rol{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Rol.changeset(%Rol{}, @invalid_attrs)
    refute changeset.valid?
  end
end
