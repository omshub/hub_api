defmodule HubApi.Repo.Migrations.Classes do
  use Ecto.Migration

  def change do
    create table("classes") do
      add :number, :string
      add :aliases, :string
      add :course_id, :string
      add :deprecated, :string
      add :link, :string
      add :department, :string
      add :name, :string
      timestamps()
    end
  end
end
