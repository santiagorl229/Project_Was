defmodule Wasproject.RolController do
  use Wasproject.Web, :controller

  alias Wasproject.Rol

  def index(conn, _params) do
    roles = Repo.all(Rol)
    render(conn, "index.json", roles: roles)
  end

  def create(conn, %{"rol" => rol_params}) do
    changeset = Rol.changeset(%Rol{}, rol_params)

    case Repo.insert(changeset) do
      {:ok, rol} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", rol_path(conn, :show, rol))
        |> render("show.json", rol: rol)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Wasproject.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    rol = Repo.get!(Rol, id)
    render(conn, "show.json", rol: rol)
  end

  def update(conn, %{"id" => id, "rol" => rol_params}) do
    rol = Repo.get!(Rol, id)
    changeset = Rol.changeset(rol, rol_params)

    case Repo.update(changeset) do
      {:ok, rol} ->
        render(conn, "show.json", rol: rol)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Wasproject.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    rol = Repo.get!(Rol, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(rol)

    send_resp(conn, :no_content, "")
  end


  def carga_rol(conn, _params) do
    query= from r in Wasproject.Rol,
                select: %{id: r.id, nombre: r.nombre}
    roles= Repo.all(query)
   # IO.inspect(roles)
    render conn, "rol.json", roles: roles
  end
  
end 