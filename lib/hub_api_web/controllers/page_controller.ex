defmodule HubApiWeb.PageController do
  use HubApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
