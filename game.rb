require './players.rb'
require './turn_manager.rb'

class Game

  attr_accessor :num1, :num2, :current_answer, :players
  def initialize
    player1 = Player.new('David')
    player2 = Player.new('RoboCop')
    @players = [player1, player2]
    @turn_manager = TurnManager.new(@players)
    @current_answer = 0;
    @num1 = 0;
    @num2 = 0;
  end

  def play
    while not game_over?

      current_player = @turn_manager.current_player
      puts "It is #{current_player.name}'s turn"
      create_question
      puts "What is #{@num1} + #{@num2}?"
      answer = gets.chomp
        puts "your answer is #{answer} and the current answer is #{current_answer}"

      if answer.to_i == @current_answer
        puts "You are correct"
      else
        puts "ouch, lost a life"
        current_player.lose_a_life
      end
      swap_players
      game_over?
   end
  end

  def create_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @current_answer = @num1 + @num2
    puts @current_answer
  end

  def game_over?
    @players.any? { |r| r.dead? }
  end

  def swap_players
    @turn_manager.next
  end


 end