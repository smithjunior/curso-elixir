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

  describe "make_move/1" do
    setup do
      player = Player.build("Smith", :chute, :cura, :soco)
      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
      # {:ok, player: player}
    end

    test "when the move is valid, do the move and the computer makes a move" do
#    test "when the move is valid, do the move and the computer makes a move", %{player: player} do
      messages =
        capture_io(fn ->
          ExMon.make_move(:chute)
        end)

      assert messages =~ "The Player attacked the computer dealing"
      assert messages =~ "It's computer turn"
      assert messages =~ "It's player turn"
      assert messages =~ "status: :continue"
    end

    test "when the move is invalid, return s an error message" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:wrong)
        end)

      assert messages =~ "Invalid move: wrong"
    end
  end
end
