defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/1" do
    test "returns a player" do
      expected_response = %Player{life: 100, moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco}, name: "Smith"}
      assert expected_response == ExMon.create_player("Smith", :chute, :cura, :soco)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = Player.build("Smith", :chute, :cura, :soco)
      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "====== The Game is started! ======"
      assert messages =~ "name: \"Robotinik\""
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end
end
