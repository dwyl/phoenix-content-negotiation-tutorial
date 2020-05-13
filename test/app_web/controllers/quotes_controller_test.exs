defmodule AppWeb.QuotesControllerTest do
  use AppWeb.ConnCase

  describe "index" do
    test "lists all quotes", %{conn: conn} do
      conn = get(conn, Routes.quotes_path(conn, :index))
      assert html_response(conn, 200) =~ "Quotes"
    end
  end

end
