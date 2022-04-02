defmodule ExMonWeb.TrainersController do
  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMon.create_trainer
    |> handle_response(conn, "created.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExMon.delete
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ExMon.fetch_trainer()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({:ok, trainer}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

  defp handle_delete({:ok , _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error , _changeset} = error, conn), do: error
end
