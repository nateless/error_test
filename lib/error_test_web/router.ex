defmodule ErrorTestWeb.Router do
  use ErrorTestWeb, :router
  use Plug.ErrorHandler

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ErrorTestWeb do
    pipe_through :api

    get "/", PageController, :index
  end
end
