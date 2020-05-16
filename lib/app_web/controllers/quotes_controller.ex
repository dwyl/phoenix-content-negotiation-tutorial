defmodule AppWeb.QuotesController do
  use AppWeb, :controller

  # transform map with keys as strings into keys as atoms!
  # https://stackoverflow.com/questions/31990134
  def transform_string_keys_to_atoms(map) do
    for {key, val} <- map, into: %{}, do: {String.to_existing_atom(key), val}
  end

  def index(conn, _params) do
    q = Quotes.random() |> transform_string_keys_to_atoms

    if get_accept_header(conn) =~ "json" do
      json(conn, q)
    else
      render(conn, "index.html", quote: q)
    end
  end

  @doc """
  `get_accept_header/2` gets the "accept" header from req_headers.
  Defaults to "text/html" if no header is set.
  """
  def get_accept_header(conn) do
    case List.keyfind(conn.req_headers, "accept", 0) do
      {"accept", accept} ->
        accept

      nil ->
        "tex/html"
    end
  end
end
