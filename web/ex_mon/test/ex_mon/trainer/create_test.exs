defmodule ExMon.Trainer.CreateTest do
  use ExMon.DataCase

  alias ExMon.{Repo, Trainer}
  alias ExMon.Trainer.Create

  describe "call/1" do
    test "when all params valid, creates a trainer" do
      params = %{name: "Smith", password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)
      assert {:ok, %Trainer{name: "Smith"}} = response
      assert count_after > count_before
    end

    test "when there are invalid params, returns the error" do
      params = %{password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:error, changeset} = response
      assert count_after == count_before
      assert errors_on(changeset) == %{name: ["can't be blank"]}
    end
  end
end
