defmodule HubApi.Schema.Class do
  use Ecto.Schema

  @derive {Jason.Encoder,
           only: [
             :number,
             :aliases,
             :course_id,
             :deprecated,
             :link,
             :department,
             :name
           ]}

  schema "classes" do
    field :number, :string
    field :aliases, :string
    field :course_id, :string
    field :deprecated, :string
    field :link, :string
    field :department, :string
    field :name, :string
    timestamps()
  end
end
