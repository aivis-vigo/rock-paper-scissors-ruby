# frozen_string_literal: true

# Game class represents a game of Rock, Paper, Scissors, Lizard, Spock.
# It allows the player to play against different opponents and keeps track of wins.
class Game
  def initialize
    @player_wins = 0
    @opponent_wins = 0
    @number = 0
    @round = 1

    @opponents = [
      'Snickerdoodle McFizz',
      'Noodle Noodleman',
      'Bumble Bopkins'
    ]

    @elements = %w[rock paper scissors lizard spock]

    @winning_elements = {
      'rock' => %w[scissors lizard],
      'paper' => %w[rock spock],
      'scissors' => %w[paper lizard],
      'lizard' => %w[paper spock],
      'spock' => %w[scissors rock]
    }
  end

  def run
    display_game_title

    while @round < 4
      opponent_name = select_opponent
      opponent_choice = @elements.sample

      display_score(opponent_name)

      player_choice = nil

      until @winning_elements.key?(player_choice)
        player_choice = player_input
        puts "Element '#{player_choice}' doesn't exist!" unless @winning_elements.key?(player_choice)
      end

      message = "You: #{player_choice} vs #{select_opponent}: #{opponent_choice}"
      exchange_winner = determine_winner(player_choice, opponent_choice)

      case exchange_winner
      when 'Player'
        puts "#{message}. You won!"
        add_one_player_win
      when 'Opponent'
        puts "#{message}. Opponent won!"
        add_one_opponent_win
      else
        puts "#{message}. Draw!"
        'Draw'
      end

      puts '===================================='

      if @round == @opponents.length && @player_wins == 3
        puts 'You are Rock-Paper-Scissors-Lizard-Spock Champion!'
        puts '===================================='
        break
      end

      if @player_wins == 3
        next_round
        reset_scores
        next_opponent
        puts '===================================='
        puts "Round: #{@round}"
        puts '===================================='
      end

      next unless @opponent_wins == 3

      @round = 4
      puts "#{opponent_name} won! You lose!"
      puts '===================================='
    end
  end

  def display_game_title
    puts '===================================='
    puts 'Rock, Paper, Scissors, Lizard, Spock'
    puts '===================================='
  end

  def display_score(opponent_name)
    puts "You: #{@player_wins} vs #{opponent_name}: #{@opponent_wins}"
  end

  def select_opponent
    @opponents[@number]
  end

  def player_input
    print 'Your choice: '
    gets.chomp.downcase
  end

  def determine_winner(player_choice, opponent_choice)
    player_element = @winning_elements[player_choice]
    opponent_element = @winning_elements[opponent_choice]

    if player_element.include?(opponent_choice)
      'Player'
    elsif opponent_element.include?(player_choice)
      'Opponent'
    else
      'Draw'
    end
  end

  def add_one_player_win
    @player_wins += 1
  end

  def add_one_opponent_win
    @opponent_wins += 1
  end

  def next_round
    @round += 1
  end

  def reset_scores
    @player_wins = 0
    @opponent_wins = 0
  end

  def next_opponent
    @number += 1
    @opponents[@number]
  end
end
