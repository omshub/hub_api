defmodule HubApiWeb.ClassController do
  use HubApiWeb, :controller
  alias HubApi.Repo
  alias HubApi.Schema.Class

  def index(conn, _params) do
    res = Repo.all(Class)
    json(conn, res)
  end
end
