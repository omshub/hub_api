defmodule HubApi.Schema.Semester do
  use Ecto.Schema

  @derive {Jason.Encoder,
           only: [
             :semester_name
           ]}

  schema "semesters" do
    field :semester_name, :string
  end
end
