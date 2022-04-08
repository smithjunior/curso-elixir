defmodule ExMon.Trainer.Pokemon.Delete do
  alias ExMon.Trainer.Pokemon, as: Pokemon
  alias ExMon.Repo
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "pokemon not found!"}
      trainer -> Repo.delete(trainer)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Pokemon, uuid)
end
