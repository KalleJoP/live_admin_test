defmodule LiveAdminTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveAdminTestWeb.Telemetry,
      # Start the Ecto repository
      LiveAdminTest.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveAdminTest.PubSub},
      # Start Finch
      {Finch, name: LiveAdminTest.Finch},
      # Start the Endpoint (http/https)
      LiveAdminTestWeb.Endpoint
      # Start a worker by calling: LiveAdminTest.Worker.start_link(arg)
      # {LiveAdminTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveAdminTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveAdminTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
