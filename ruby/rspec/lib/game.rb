require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :players
  def initialize
    @board = Board.new
    @players = Array.new
    @players[0] = Player.new("y")
    @players[1] = Player.new("r")
  end
  
  def play
    player_color = @players[0].color
    3.times do # max 42 turns
      @board.show
      begin
        puts "Select row from 1 to 7 to drop your coin"
        input = gets.chomp
        
        raise InputError if input.to_i > 7
      rescue InputError
        puts "Input Error. Type only a number from range 1 to 7"
        retry
      end
      @board.drop_coin(input, player_color)
      @board.won?(player_color)
      p @board
    end
  end
  
end

# Game.new.play
# game = Game.new
# p game.board
# p game.players

