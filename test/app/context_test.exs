defmodule App.ContextTest do
  use App.DataCase

  alias App.Context

  describe "quotes" do
    alias App.Context.Quotes

    @valid_attrs %{author: "some author", source: "some source", tags: "some tags", text: "some text"}
    @update_attrs %{author: "some updated author", source: "some updated source", tags: "some updated tags", text: "some updated text"}
    @invalid_attrs %{author: nil, source: nil, tags: nil, text: nil}

    def quotes_fixture(attrs \\ %{}) do
      {:ok, quotes} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Context.create_quotes()

      quotes
    end

    test "list_quotes/0 returns all quotes" do
      quotes = quotes_fixture()
      assert Context.list_quotes() == [quotes]
    end

    test "get_quotes!/1 returns the quotes with given id" do
      quotes = quotes_fixture()
      assert Context.get_quotes!(quotes.id) == quotes
    end

    test "create_quotes/1 with valid data creates a quotes" do
      assert {:ok, %Quotes{} = quotes} = Context.create_quotes(@valid_attrs)
      assert quotes.author == "some author"
      assert quotes.source == "some source"
      assert quotes.tags == "some tags"
      assert quotes.text == "some text"
    end

    test "create_quotes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Context.create_quotes(@invalid_attrs)
    end

    test "update_quotes/2 with valid data updates the quotes" do
      quotes = quotes_fixture()
      assert {:ok, %Quotes{} = quotes} = Context.update_quotes(quotes, @update_attrs)
      assert quotes.author == "some updated author"
      assert quotes.source == "some updated source"
      assert quotes.tags == "some updated tags"
      assert quotes.text == "some updated text"
    end

    test "update_quotes/2 with invalid data returns error changeset" do
      quotes = quotes_fixture()
      assert {:error, %Ecto.Changeset{}} = Context.update_quotes(quotes, @invalid_attrs)
      assert quotes == Context.get_quotes!(quotes.id)
    end

    test "delete_quotes/1 deletes the quotes" do
      quotes = quotes_fixture()
      assert {:ok, %Quotes{}} = Context.delete_quotes(quotes)
      assert_raise Ecto.NoResultsError, fn -> Context.get_quotes!(quotes.id) end
    end

    test "change_quotes/1 returns a quotes changeset" do
      quotes = quotes_fixture()
      assert %Ecto.Changeset{} = Context.change_quotes(quotes)
    end
  end
end
