defmodule Wasproject.Router do
  use Wasproject.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: "*"
  end

  scope "/", Wasproject do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    #resources "/roles", RolController, except: [:new, :edit]
    

  end

  # Other scopes may use custom stacks.
   scope "/api", Wasproject do
     pipe_through :api
     get "/rol", RolController, :carga_rol
   end
end
