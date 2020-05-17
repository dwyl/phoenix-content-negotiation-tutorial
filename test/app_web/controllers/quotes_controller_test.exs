defmodule AppWeb.QuotesControllerTest do
  use AppWeb.ConnCase

  describe "/quotes" do
    test "GET /quotes (HTML) shows a random quote", %{conn: conn} do
      conn = get(conn, Routes.quotes_path(conn, :index))
      assert html_response(conn, 200) =~ "~"
    end

    test "GET /quotes (JSON)", %{conn: conn} do
      conn =
        conn
        |> put_req_header("accept", "application/json")
        |> get(Routes.quotes_path(conn, :index))

      {:ok, json} = Jason.decode(conn.resp_body)
      %{ "author" => author, "text" => text } = json
      assert String.length(author) > 2
      assert String.length(text) > 10
    end
  end
end
