# frozen_string_literal: true

require 'test/unit'
require_relative './game'

# GameTest is a test case class for testing the Game class.
# It includes test methods to verify the behavior of the Game class methods.
class GameTest < Test::Unit::TestCase
  def setup
    @rock_beats_scissors = Game.new.determine_winner('rock', 'scissors')
    @rock_beats_lizard = Game.new.determine_winner('rock', 'lizard')
    @paper_beats_rock = Game.new.determine_winner('paper', 'rock')
    @paper_beats_spock = Game.new.determine_winner('paper', 'spock')
    @scissors_beats_paper = Game.new.determine_winner('scissors', 'paper')
    @scissors_beats_lizard = Game.new.determine_winner('scissors', 'lizard')
    @lizard_beats_paper = Game.new.determine_winner('lizard', 'paper')
    @lizard_beats_spock = Game.new.determine_winner('lizard', 'spock')
    @spock_beats_scissors = Game.new.determine_winner('spock', 'scissors')
    @spock_beats_rock = Game.new.determine_winner('spock', 'rock')
  end

  def test_rock_beats_scissors
    assert_equal('Player', @rock_beats_scissors)
  end

  def test_rock_beats_lizard
    assert_equal('Player', @rock_beats_lizard)
  end

  def test_paper_beats_rock
    assert_equal('Player', @paper_beats_rock)
  end

  def test_paper_beats_spock
    assert_equal('Player', @paper_beats_spock)
  end

  def test_scissors_beats_paper
    assert_equal('Player', @scissors_beats_paper)
  end

  def test_scissors_beats_lizard
    assert_equal('Player', @scissors_beats_lizard)
  end

  def test_lizard_beats_paper
    assert_equal('Player', @lizard_beats_paper)
  end

  def test_lizard_beats_spock
    assert_equal('Player', @lizard_beats_spock)
  end

  def test_spock_beats_scissors
    assert_equal('Player', @spock_beats_scissors)
  end

  def test_spock_beats_rock
    assert_equal('Player', @spock_beats_rock)
  end

  def test_select_opponent
    name = Game.new.select_opponent

    assert_equal('Snickerdoodle McFizz', name)
  end

  def test_add_one_player_win
    add_point = Game.new.add_one_player_win

    assert_equal(1, add_point)
  end

  def test_add_one_opponent_win
    add_point = Game.new.add_one_opponent_win

    assert_equal(1, add_point)
  end

  def test_next_round
    next_round = Game.new.next_round

    assert_equal(2, next_round)
  end

  def test_next_opponent
    new_opponent = Game.new.next_opponent

    assert_equal('Noodle Noodleman', new_opponent)
  end
end
