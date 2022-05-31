defmodule HubApi.Schema.Review do
  use Ecto.Schema

  @derive {Jason.Encoder,
           only: [
             :semester_id,
             :rating,
             :difficulty,
             :workload,
             :body,
             :course_id,
             :created
           ]}

  schema "legacy_reviews" do
    field :semester_id, :string
    field :rating, :integer
    field :difficulty, :integer
    field :workload, :string
    field :body, :string
    field :course_id, :string
    field :created, :string
  end
end
