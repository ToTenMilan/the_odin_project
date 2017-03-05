class InputError < StandardError
end

class Board
  attr_accessor :board
  def initialize
    @board = Array.new(7) { Array.new(6, " ") } #, Array.new(6, " "))
  end
  
  def show
    puts <<-EOB

  | #{board[0][5]} | #{board[1][5]} | #{board[2][5]} | #{board[3][5]} | #{board[4][5]} | #{board[5][5]} | #{board[6][5]} |
  | #{board[0][4]} | #{board[1][4]} | #{board[2][4]} | #{board[3][4]} | #{board[4][4]} | #{board[5][4]} | #{board[6][4]} |
  | #{board[0][3]} | #{board[1][3]} | #{board[2][3]} | #{board[3][3]} | #{board[4][3]} | #{board[5][3]} | #{board[6][3]} |
  | #{board[0][2]} | #{board[1][2]} | #{board[2][2]} | #{board[3][2]} | #{board[4][2]} | #{board[5][2]} | #{board[6][2]} |
  | #{board[0][1]} | #{board[1][1]} | #{board[2][1]} | #{board[3][1]} | #{board[4][1]} | #{board[5][1]} | #{board[6][1]} |
  | #{board[0][0]} | #{board[1][0]} | #{board[2][0]} | #{board[3][0]} | #{board[4][0]} | #{board[5][0]} | #{board[6][0]} |
  +---+---+---+---+---+---+---+
  | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
  
    EOB
  end
  
  def drop_coin(input, player_color)
    chosen_row = input.to_i - 1
    next_slot = @board[chosen_row].find_index(" ") #do |slot|
    return if next_slot.nil?
    @board[chosen_row][next_slot] = player_color
  end
  
  def won?(player_color)
    @board.each_with_index do |row, r_index|
      row.each_with_index do |column, c_index|
        case
        # horizontal
        when (player_color == @board[r_index][c_index] && 
              player_color == @board[r_index][c_index + 1] &&
              player_color == @board[r_index][c_index + 2] &&
              player_color == @board[r_index][c_index + 3])
          return true
        # vertical
        when (player_color == @board[r_index][c_index] && 
              player_color == @board[r_index + 1][c_index] &&
              player_color == @board[r_index + 2][c_index] &&
              player_color == @board[r_index + 3][c_index])
          return true
        # diagonal slope
        when (player_color == @board[r_index][c_index] && 
              player_color == @board[r_index + 1][c_index - 1] &&
              player_color == @board[r_index + 2][c_index - 2] &&
              player_color == @board[r_index + 3][c_index - 3])
          return true
        # diagonal slope
        when (player_color == @board[r_index][c_index] && 
              player_color == @board[r_index + 1][c_index + 1] &&
              player_color == @board[r_index + 2][c_index + 2] &&
              player_color == @board[r_index + 3][c_index + 3])
          return true
        end
      end
    end
  end
  
  def game_over(winner)
    show
    puts <<-EOB
    +-----------------------------------+
    |                                   |
    |  player '#{winner}' won the game!         |
    |                                   |
    +-----------------------------------+
    EOB
  exit
  end
end

