defmodule Wasproject.Rol do
  use Wasproject.Web, :model

  schema "roles" do
    field :nombre, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre])
    |> validate_required([:nombre])
  end
end
