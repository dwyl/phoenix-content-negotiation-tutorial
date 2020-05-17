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

    get "/", PageController, :index
    resources "/quotes", QuotesController
  end


  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :any
      live_dashboard "/dashboard", metrics: AppWeb.Telemetry
    end
  end
end
