defmodule TextClient.Summary do
  @moduledoc """
  Displays the summary of the game.
  """

  def display(game = %{tally: tally}) do
    IO.puts [
      "\n",
      "Word so Far: #{Enum.join(tally.letters_used, " ")}\n",
      "Guesses left: #{tally.turns_left}\n"
    ]
    game
  end

end
