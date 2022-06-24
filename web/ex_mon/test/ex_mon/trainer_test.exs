defmodule ExMon.TrainerTest do
  use ExMon.DataCase

  alias ExMon.Trainer

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Smith", password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               action: nil,
               changes: %{
                 name: "Smith",
                 password: "123456"
               },
               errors: [],
               data: %ExMon.Trainer{},
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{password: "123456"}
      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               action: nil,
               changes: %{
                 password: "123456"
               },
               errors: [name: {"can't be blank", [validation: :required]}],
               data: %ExMon.Trainer{},
               valid?: false
             } = response

      assert %{name: ["can't be blank"]} == errors_on(response)
    end
  end

  describe "build/1" do
    test "when all params is valid, return a trainer struct" do
      params = %{name: "Smith", password: "123456"}
      response = Trainer.build(params)

      assert {:ok,
              %Trainer{
                id: nil,
                inserted_at: nil,
                name: "Smith",
                password: "123456",
                password_hash: _,
                pokemons: _,
                updated_at: nil
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{password: "123456"}
      {:error, response} = Trainer.build(params)

      assert %Ecto.Changeset{
               action: :insert,
               changes: %{
                 password: "123456"
               },
               errors: [name: {"can't be blank", [validation: :required]}],
               data: %ExMon.Trainer{},
               valid?: false
             } = response

      assert %{name: ["can't be blank"]} == errors_on(response)
    end
  end
end
