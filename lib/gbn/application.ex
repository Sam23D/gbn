defmodule Gbn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GbnWeb.Telemetry,
      # Start the Ecto repository
      Gbn.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gbn.PubSub},
      # Start Finch
      {Finch, name: Gbn.Finch},
      # Start the Endpoint (http/https)
      GbnWeb.Endpoint
      # Start a worker by calling: Gbn.Worker.start_link(arg)
      # {Gbn.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gbn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GbnWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
