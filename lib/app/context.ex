defmodule App.Context do
  @moduledoc """
  The Context context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Context.Quotes

  @doc """
  Returns the list of quotes.

  ## Examples

      iex> list_quotes()
      [%Quotes{}, ...]

  """
  def list_quotes do
    raise "TODO"
  end

  @doc """
  Gets a single quotes.

  Raises if the Quotes does not exist.

  ## Examples

      iex> get_quotes!(123)
      %Quotes{}

  """
  def get_quotes!(id), do: raise "TODO"

  @doc """
  Creates a quotes.

  ## Examples

      iex> create_quotes(%{field: value})
      {:ok, %Quotes{}}

      iex> create_quotes(%{field: bad_value})
      {:error, ...}

  """
  def create_quotes(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a quotes.

  ## Examples

      iex> update_quotes(quotes, %{field: new_value})
      {:ok, %Quotes{}}

      iex> update_quotes(quotes, %{field: bad_value})
      {:error, ...}

  """
  def update_quotes(%Quotes{} = quotes, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Quotes.

  ## Examples

      iex> delete_quotes(quotes)
      {:ok, %Quotes{}}

      iex> delete_quotes(quotes)
      {:error, ...}

  """
  def delete_quotes(%Quotes{} = quotes) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking quotes changes.

  ## Examples

      iex> change_quotes(quotes)
      %Todo{...}

  """
  def change_quotes(%Quotes{} = quotes, _attrs \\ %{}) do
    raise "TODO"
  end
end
