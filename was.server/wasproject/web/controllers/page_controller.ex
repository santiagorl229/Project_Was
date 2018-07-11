defmodule Wasproject.PageController do
  use Wasproject.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
