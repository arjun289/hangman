defmodule TextClient.Interact do
  @moduledoc """
  Domain functions for TextClient

  Exposes a set of functions which consume the supplied
  `params` and perform the logic for the `text_client` interaction
  with `user`.
  """
  alias TextClient.{State, Player}

  @doc """
  Starts a new hangman game.
  """
  def start do
    Hangman.new_game()
    |> setup_state()
    |> Player.play()
  end

  def setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman.Game.tally(game)
    }
  end

end
