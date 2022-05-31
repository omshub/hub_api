defmodule HubApi.Repo.Migrations.Semesters do
  use Ecto.Migration

  def change do
    create table("semesters") do
      add :semester_name, :string
    end
  end
end
