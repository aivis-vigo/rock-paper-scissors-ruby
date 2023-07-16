# frozen_string_literal: true

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
    puts '===================================='
    puts 'Rock, Paper, Scissors, Lizard, Spock'
    puts '===================================='

    opponent_name = select_opponent

    while @round < 4
      opponent_choice = @elements.sample

      puts "You: #{@player_wins} vs #{opponent_name}: #{@opponent_wins}"

      player_choice = nil

      until @winning_elements.key?(player_choice)
        player_choice = player_input
        puts "Element '#{player_choice}' doesn't exist!" unless @winning_elements.key?(player_choice)
      end

      puts "You: #{player_choice} vs #{select_opponent}: #{opponent_choice}"

      determine_winner(player_choice, opponent_choice, opponent_name)
    end
  end

  def select_opponent
    @opponents[@number]
  end

  def player_input
    print 'Your choice: '
    gets.chomp.downcase
  end

  def determine_winner(player_choice, opponent_choice, opponent_name)
    player_element = @winning_elements[player_choice]
    opponent_element = @winning_elements[opponent_choice]

    if player_element.include?(opponent_choice)
      @player_wins += 1
      'Player'
    elsif opponent_element.include?(player_choice)
      @opponent_wins += 1
      opponent_name
    else
      'Draw!'
    end
  end
end

Game.new.run