defmodule AppWeb.PageControllerTest do
  use AppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "text/html")
      |> get(conn, "/")
      
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
