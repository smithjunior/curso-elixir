defmodule ExMonWeb.TrainerPokemonsView do
  use ExMonWeb, :view
  alias ExMon.Trainer.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nickname: nickname,
          types: type,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon created!",
      pokemon: %Pokemon{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: type,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nickname: nickname,
          types: type,
          trainer: %{id: trainer_id, name: trainer_name},
          weight: weight
        }
      }) do
    %{
      pokemon: %Pokemon{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: type,
        trainer: %{trainer_id: trainer_id, name: trainer_name},
        weight: weight
      }
    }
  end

  def render("update.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nickname: nickname,
          types: type,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon updated!",
      pokemon: %Pokemon{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: type,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end
end
