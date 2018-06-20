defmodule TextClient.Player do

  alias TextClient.{State, Summary, Prompter, Mover}

  def play(%State{tally: %{game_state: :won}}) do
    exit_with_message("You Won!! :)")
  end

  def play(%State{tally: %{game_state: :lost}}) do
    exit_with_message("Sorry, you lost :(")
  end

  def play(game = %State{tally: %{game_state: :good_guess}}) do
    continue_with_message("Good Guess", game)
  end

  def play(game = %State{tally: %{game_state: :bad_guess}}) do
    continue_with_message("Sorry, bad guess.", game)
  end

  def play(game = %State{tally: %{game_state: :already_used}}) do
    continue_with_message("Already used the word.", game)
  end

  def play(game) do
    continue(game)
  end

  def continue_with_message(message, game) do
    IO.puts message
    continue(game)
  end

  def continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end

  def make_move(game) do
    game
  end

  defp exit_with_message(message) do
    IO.puts(message)
    exit(:normal)
  end
end
