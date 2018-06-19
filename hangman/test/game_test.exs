defmodule HangmanTest.GameTest do
  use ExUnit.Case
  alias Hangman.Game

  test "new_game returns proper struct" do
    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == :initializing
    refute game.letters == []
    Enum.each(game.letters, fn x ->
      assert ?x >= 97 and ?x <= 122
    end)
  end

  test "state isn't modified for game won" do
    game = Game.new_game
    game = Map.put(game, :game_state, :won)
    assert ^game = Game.make_move(game, "x")
  end

  test "first occurence state not :already used" do
    game = Game.new_game()
    new_game = Game.make_move(game, "x")
    assert new_game.game_state != :already_used
  end

  test "second occurence state :already used" do
    game = Game.new_game()
    game = Game.make_move(game, "x")
    assert game.game_state != :already_used

    new_game = Game.make_move(game, "x")
    assert new_game.game_state == :already_used
  end

  test "a good guess is recognized" do
    game = Game.new_game("wibble")
    game = Game.make_move(game, "w")
    assert game.game_state == :good_guess
    game = Game.make_move(game, "i")
    assert game.game_state == :good_guess
    game = Game.make_move(game, "b")
    assert game.game_state == :good_guess
    game = Game.make_move(game, "l")
    assert game.game_state == :good_guess
    game = Game.make_move(game, "e")
    assert game.game_state == :won
  end

  test "bad guess is recognized" do
    game = Game.new_game("wibble")
    new_game = Game.make_move(game, "x")
    assert new_game.game_state == :bad_guess
    assert new_game.turns_left == game.turns_left - 1
  end
end
