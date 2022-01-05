defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message(%{status: :started} = info) do
    IO.puts("\n====== The Game is started! ======\n")
    IO.inspect(info)
    IO.puts("\n----------------------------------\n")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n====== It's #{player} turn! ======\n")
    IO.inspect(info)
    IO.puts("\n----------------------------------\n")
  end

  def print_round_message(%{status: :gameover, turn: player} = info) do
    IO.puts("\n====== The Game is over! ======\n")
    IO.inspect(info)
    IO.puts("\n----------------------------------\n")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n====== Invalid move: #{move}. ======\n")
  end

  def print_move_message(:computer, :attack, damage ) do
    IO.puts("\n====== The Player attacked the computer dealing #{damage} damage. ======\n")
  end

  def print_move_message(:player, :attack, damage ) do
    IO.puts("\n====== The Computer attacked the player dealing #{damage} damage. ======\n")
  end

  def print_move_message(:computer, :heal, heal) do
    IO.puts("\n====== The Computer healing life #{heal} heal. ======\n")
  end

  def print_move_message(:player, :heal, heal) do
    IO.puts("\n====== The Player healing life #{heal} heal. ======\n")
  end
end
