defmodule Wasproject.RolView do
  use Wasproject.Web, :view

  def render("index.json", %{roles: roles}) do
    %{data: render_many(roles, Wasproject.RolView, "rol.json")}
  end

  def render("show.json", %{rol: rol}) do
    %{data: render_one(rol, Wasproject.RolView, "rol.json")}
  end
  

  def render("rol.json", %{roles: roles}) do

    %{
      roles: Enum.map(roles, fn(rol) -> %{id: rol.id, nombre: rol.nombre} end)
     }
  end


end  
