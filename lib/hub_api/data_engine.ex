defmodule HubApi.DataEngine do
  use Ecto.Schema
  use GenServer
  alias HubApi.Repo
  alias HubApi.Schema.{Class, LegacyReview}

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: :data_engine)
  end

  @impl true
  def init(_options) do
    IO.inspect("Running data operations")

    load_readonly_data("https://omshub-data.s3.amazonaws.com/data/omscentral_courses.json")
    |> Jason.decode!()
    |> Enum.map(fn class ->
      data = Repo.get_by(Class, course_id: class["id"])

      if data == nil do
        Repo.insert!(%Class{
          number: class["number"],
          aliases: class["aliases"],
          course_id: class["id"],
          deprecated: class["deprecated"],
          link: class["link"],
          department: class["department"],
          name: class["name"]
        })
      end
    end)

    load_readonly_data("https://omshub-data.s3.amazonaws.com/data/omscentral_reviews.json")
    |> Jason.decode!()
    |> Enum.map(fn review ->
      data = Repo.get_by(Review, created: review["created"])
      rating = if review["rating"], do: String.to_integer(review["rating"]), else: 0
      difficulty = if review["difficulty"], do: String.to_integer(review["difficulty"]), else: 0

      if is_nil(data) do
        Repo.insert!(%LegacyReview{
          semester_id: review["semester_id"],
          rating: rating,
          difficulty: difficulty,
          workload: review["workload"],
          body: review["body"],
          course_id: review["course_id"],
          created: review["created"]
        })
      end
    end)

    {:ok, nil}
  end

  def load_readonly_data(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.inspect("Data not found")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end
end
