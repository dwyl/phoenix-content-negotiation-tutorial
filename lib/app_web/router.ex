defmodule AppWeb.Router do
  use AppWeb, :router

  pipeline :any do
    plug :accepts, ~w(html json)
    plug Content, %{html_plugs: [
      &fetch_session/2,
      &fetch_flash/2,
      &protect_from_forgery/2,
      &put_secure_browser_headers/2
    ]}
  end

  scope "/", AppWeb do
    pipe_through :any

    resources "/", QuotesController
  end

end
