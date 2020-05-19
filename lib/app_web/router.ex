defmodule AppWeb.Router do
  use AppWeb, :router

  pipeline :any do
    plug :accepts, ~w(html json)
    plug :negotiate
  end

  defp negotiate(conn, []) do
    if AppWeb.QuotesController.get_accept_header(conn) =~ "json" do
      conn
    else
      conn
      |> fetch_session([])
      |> fetch_flash([])
      |> protect_from_forgery([])
      |> put_secure_browser_headers([])
    end
  end

  scope "/", AppWeb do
    pipe_through :any

    resources "/", QuotesController
  end

end
