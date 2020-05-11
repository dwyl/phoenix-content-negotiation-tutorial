defmodule AppWeb.QuotesController do
  use AppWeb, :controller

  alias App.Context
  alias App.Context.Quotes

  def index(conn, _params) do
    quotes = Context.list_quotes()
    render(conn, "index.html", quotes: quotes)
  end

  def new(conn, _params) do
    changeset = Context.change_quotes(%Quotes{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quotes" => quotes_params}) do
    case Context.create_quotes(quotes_params) do
      {:ok, quotes} ->
        conn
        |> put_flash(:info, "Quotes created successfully.")
        |> redirect(to: Routes.quotes_path(conn, :show, quotes))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    quotes = Context.get_quotes!(id)
    render(conn, "show.html", quotes: quotes)
  end

  def edit(conn, %{"id" => id}) do
    quotes = Context.get_quotes!(id)
    changeset = Context.change_quotes(quotes)
    render(conn, "edit.html", quotes: quotes, changeset: changeset)
  end

  def update(conn, %{"id" => id, "quotes" => quotes_params}) do
    quotes = Context.get_quotes!(id)

    case Context.update_quotes(quotes, quotes_params) do
      {:ok, quotes} ->
        conn
        |> put_flash(:info, "Quotes updated successfully.")
        |> redirect(to: Routes.quotes_path(conn, :show, quotes))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", quotes: quotes, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    quotes = Context.get_quotes!(id)
    {:ok, _quotes} = Context.delete_quotes(quotes)

    conn
    |> put_flash(:info, "Quotes deleted successfully.")
    |> redirect(to: Routes.quotes_path(conn, :index))
  end
end
