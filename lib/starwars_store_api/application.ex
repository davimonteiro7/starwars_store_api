defmodule StarwarsStoreApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      StarwarsStoreApi.Repo,
      # Start the Telemetry supervisor
      StarwarsStoreApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: StarwarsStoreApi.PubSub},
      # Start the Endpoint (http/https)
      StarwarsStoreApiWeb.Endpoint
      # Start a worker by calling: StarwarsStoreApi.Worker.start_link(arg)
      # {StarwarsStoreApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StarwarsStoreApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StarwarsStoreApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
