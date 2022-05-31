defmodule HubApi.Repo do
  use Ecto.Repo,
    otp_app: :hub_api,
    adapter: Ecto.Adapters.Postgres
end
