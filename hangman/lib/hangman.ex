defmodule Hangman do
  @moduledoc """
  Documentation for Hangman.
  """

  alias Hangman.Game
  @char_check_list ?a..?z
    |> Enum.to_list
    |> List.to_string
    |> String.codepoints

  defdelegate new_game,    to: Game
  defdelegate tally(game), to: Game

  def make_move(game, guess) do
    verify_guess(game, guess)
  end

  defp verify_guess(game, guess) when guess in @char_check_list do
    game = Game.make_move(game, guess)
    {game, Game.tally(game)}
  end

  defp verify_guess(_, _) do
    {:error, "enter a guess in lower case"}
  end
end
