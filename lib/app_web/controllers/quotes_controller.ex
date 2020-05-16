defmodule AppWeb.QuotesController do
  use AppWeb, :controller

  # transform map with keys as strings into keys as atoms!
  # https://stackoverflow.com/questions/31990134
  def transform_string_keys_to_atoms(map) do
    for {key, val} <- map, into: %{}, do: {String.to_existing_atom(key), val}
  end

  def index(conn, _params) do
    IO.inspect(conn.params["format"], label: "format")
    q = Quotes.random() |> transform_string_keys_to_atoms
    {"accept", accept} = List.keyfind(conn.req_headers, "accept", 0)

    if accept =~ "json" do
      json(conn, q)
    else
      render(conn, "index.html", quote: q)
    end
  end
end
