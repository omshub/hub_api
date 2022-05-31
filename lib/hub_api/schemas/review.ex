defmodule HubApi.Schema.Review do
  use Ecto.Schema

  @derive {Jason.Encoder,
           only: [
             :course_offering_id,
             :overall_rating,
             :difficulty,
             :workload_hours,
             :comment,
             :semester
           ]}

  schema "reviews" do
    field :course_offering_id, :string
    field :overall_rating, :integer
    field :difficulty, :integer
    field :workload_hours, :string
    field :comment, :string
    field :semester, :string
    timestamps()
  end
end
