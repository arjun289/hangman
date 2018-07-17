defmodule Hangman do
  @moduledoc """
  Documentation for Hangman.
  """

  alias Hangman.Server
  alias Hangman.Game
  @char_check_list ?a..?z
    |> Enum.to_list
    |> List.to_string
    |> String.codepoints

  def new_game do
    {:ok, pid} = Supervisor.start_child(Hangman.Supervisor, [])
    pid
  end

  def tally(game_pid) do
    GenServer.call(game_pid, {:tally})
  end

  def make_move(game_pid, guess) do
    GenServer.call(game_pid, {:make_move, guess})
  end

  defp verify_guess(game, guess) when guess in @char_check_list do
    Game.make_move(game, guess)
  end

  defp verify_guess(_, _) do
    {:error, "enter a guess in lower case"}
  end
end
