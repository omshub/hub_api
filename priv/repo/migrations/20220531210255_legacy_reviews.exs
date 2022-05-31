defmodule HubApi.Repo.Migrations.LegacyReviews do
  use Ecto.Migration

  def change do
    create table("legacy_reviews") do
      add :semester_id, :string
      add :rating, :integer
      add :difficulty, :integer
      add :workload, :string
      add :body, :text
      add :course_id, :string
      add :created, :string
      add :is_legacy, :boolean
    end
  end
end
