defmodule HubApi.Repo.Migrations.Review do
  use Ecto.Migration

  def change do
    create table("reviews") do
      add :course_offering_id, :string
      add :overall_rating, :integer
      add :difficulty, :integer
      add :workload_hours, :integer
      add :comment, :text
      add :semester, :string
      timestamps()
    end
  end
end
