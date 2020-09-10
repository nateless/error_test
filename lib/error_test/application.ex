defmodule ErrorTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ErrorTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ErrorTest.PubSub},
      # Start the Endpoint (http/https)
      ErrorTestWeb.Endpoint
      # Start a worker by calling: ErrorTest.Worker.start_link(arg)
      # {ErrorTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ErrorTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ErrorTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
