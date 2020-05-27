defmodule AppWeb.QuotesController do
  use AppWeb, :controller

  # transform map with keys as strings into keys as atoms!
  # https://stackoverflow.com/questions/31990134
  def transform_string_keys_to_atoms(map) do
    for {key, val} <- map, into: %{}, do: {String.to_existing_atom(key), val}
  end

  def index(conn, _params) do
    IO.inspect(conn.request_path, label: "conn.request_path:11")
    q = Quotes.random() |> transform_string_keys_to_atoms

    Content.reply(conn, &render/3, "index.html", &json/2, q)
  end

  def redirect_json(conn, params) do
    route = Enum.filter(AppWeb.Router.__routes__(), fn x -> 
      x.path == conn.request_path
    end) |> List.first
    apply(route.plug, route.plug_opts, [conn, params])
  end
end
