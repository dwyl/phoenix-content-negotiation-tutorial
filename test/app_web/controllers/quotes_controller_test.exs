defmodule AppWeb.QuotesControllerTest do
  use AppWeb.ConnCase

  alias App.Context

  @create_attrs %{author: "some author", source: "some source", tags: "some tags", text: "some text"}
  @update_attrs %{author: "some updated author", source: "some updated source", tags: "some updated tags", text: "some updated text"}
  @invalid_attrs %{author: nil, source: nil, tags: nil, text: nil}

  def fixture(:quotes) do
    {:ok, quotes} = Context.create_quotes(@create_attrs)
    quotes
  end

  describe "index" do
    test "lists all quotes", %{conn: conn} do
      conn = get(conn, Routes.quotes_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Quotes"
    end
  end

  describe "new quotes" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.quotes_path(conn, :new))
      assert html_response(conn, 200) =~ "New Quotes"
    end
  end

  describe "create quotes" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.quotes_path(conn, :create), quotes: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.quotes_path(conn, :show, id)

      conn = get(conn, Routes.quotes_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Quotes"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.quotes_path(conn, :create), quotes: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Quotes"
    end
  end

  describe "edit quotes" do
    setup [:create_quotes]

    test "renders form for editing chosen quotes", %{conn: conn, quotes: quotes} do
      conn = get(conn, Routes.quotes_path(conn, :edit, quotes))
      assert html_response(conn, 200) =~ "Edit Quotes"
    end
  end

  describe "update quotes" do
    setup [:create_quotes]

    test "redirects when data is valid", %{conn: conn, quotes: quotes} do
      conn = put(conn, Routes.quotes_path(conn, :update, quotes), quotes: @update_attrs)
      assert redirected_to(conn) == Routes.quotes_path(conn, :show, quotes)

      conn = get(conn, Routes.quotes_path(conn, :show, quotes))
      assert html_response(conn, 200) =~ "some updated author"
    end

    test "renders errors when data is invalid", %{conn: conn, quotes: quotes} do
      conn = put(conn, Routes.quotes_path(conn, :update, quotes), quotes: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Quotes"
    end
  end

  describe "delete quotes" do
    setup [:create_quotes]

    test "deletes chosen quotes", %{conn: conn, quotes: quotes} do
      conn = delete(conn, Routes.quotes_path(conn, :delete, quotes))
      assert redirected_to(conn) == Routes.quotes_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.quotes_path(conn, :show, quotes))
      end
    end
  end

  defp create_quotes(_) do
    quotes = fixture(:quotes)
    %{quotes: quotes}
  end
end
