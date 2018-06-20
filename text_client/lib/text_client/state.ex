defmodule TextClient.State do
  @moduledoc false

  @doc """
  Defines the Interaction Struct.

  * `:game_service` - Refers to the game struct received from Hangman.
  * `:tally` - Refers to tally data received from Hangman.
  * `:guessed_letter` - The last letter guesed.
  """
  defstruct(
    game_service: nil,
    tally: nil,
    guess: ""
  )

end
