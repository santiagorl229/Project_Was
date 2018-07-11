defmodule Wasproject.Repo.Migrations.CreateRol do
  use Ecto.Migration

  def change do
    alter table(:roles, primary_key: true) do
      add :nombre, :string

      timestamps()
    end
  end
end
