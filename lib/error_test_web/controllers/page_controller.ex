defmodule ErrorTestWeb.PageController do
  use ErrorTestWeb, :controller

  def index(conn, _params) do
    Enum.map([1, 2, 3], fn [i, _, _] -> i end)

    conn |> json(%{status: true})
  end
end
