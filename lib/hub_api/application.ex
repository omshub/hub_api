defmodule HubApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HubApi.Repo,
      # Start the Telemetry supervisor
      HubApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HubApi.PubSub},
      # Start the Endpoint (http/https)
      HubApiWeb.Endpoint,
      # Start a worker by calling: HubApi.Worker.start_link(arg)
      # {HubApi.Worker, arg}
      HubApi.DataEngine
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HubApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HubApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
