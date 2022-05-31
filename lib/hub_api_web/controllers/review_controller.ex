defmodule HubApiWeb.ReviewController do
  use HubApiWeb, :controller
  alias HubApi.Repo
  alias HubApi.Schema.LegacyReview

  import Ecto.Query

  def show(conn, params) do
    course_id = params["id"]
    query =
      from(LegacyReview,
        where: [course_id: ^course_id],
        order_by: :created,
        select: [:semester_id, :rating, :difficulty, :workload, :body, :course_id, :created]
      )

    res = Repo.all(query)
    json(conn, res)
  end
end
