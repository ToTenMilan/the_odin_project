require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :players
  def initialize
    @board = Board.new
    @players = Array.new
    # @player_one = 
    @players[0] = Player.new("○")
    @players[1] = Player.new("●")
  end
  
  def play
    player_color = @players[0].color
    loop do # max 42 turns
      @board.show
      begin
        puts "#{player_color} turn. Select row from 1 to 7 to drop your coin"
        input = gets.chomp
        
        raise InputError if input.to_i > 7
      rescue InputError
        puts "Input Error. Type only a number from range 1 to 7"
        retry
      end
        
      if @board.drop_coin(input, player_color).nil?
        puts "Input Error. No room in this column. Choose another one."
        next
      end
      
      @board.game_over(player_color) if @board.won?(player_color) == true
      player_color == "○" ? player_color = "●" : player_color = "○"
    end
  end
  
end

Game.new.play

