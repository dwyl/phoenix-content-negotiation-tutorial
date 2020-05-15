defmodule AppWeb.QuotesControllerTest do
  use AppWeb.ConnCase

  describe "/quotes" do
    test "shows a random quote", %{conn: conn} do
      # IO.inspect(conn)
      # IO.inspect(get(conn, Routes.quotes_path(conn, :index)))
      conn =
        conn
        |> put_req_header("accept", "text/html")
        |> get(Routes.quotes_path(conn, :index))
        
      assert html_response(conn, 200) =~ "Quote"
    end


  end

end
