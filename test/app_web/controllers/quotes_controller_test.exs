defmodule AppWeb.QuotesControllerTest do
  use AppWeb.ConnCase

  describe "/quotes" do
    test "GET /quotes (HTML) shows a random quote", %{conn: conn} do
      conn = get(conn, Routes.quotes_path(conn, :index))
      assert html_response(conn, 200) =~ "Quote"
    end

    test "GET /quotes (JSON)", %{conn: conn} do
      conn =
        conn
        |> put_req_header("accept", "application/json")
        |> get(Routes.quotes_path(conn, :index))

      {:ok, json} = Jason.decode(conn.resp_body)
      IO.inspect(json, label: "json")
      %{ "author" => author, "text" => text } = json
      IO.inspect(author, label: "author")
      assert String.length(author) > 1
      assert String.length(text) > 2
      # assert html_response(conn, 200) =~ "Welcome to Phoenix!"
    end
  end
end
