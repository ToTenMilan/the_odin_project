#!/usr/bin/env ruby

# Mastermind game by ToTenMilan
# Design inspired by TicTacToe game made by John Phelps ---> https://github.com/jphelps413/odin-ruby/tree/master/oop-games/tic-tac-toe

require './board'
require './big_pawns_row'
require './small_pawn'
require './input_error'

class Game
  def initialize
    @board = Board.new
    @big_pawns_row = BigPawnsRow.new
    @small_pawn_row = SmallPawn.new
    @all_colors = ["R", "A", "G", "Y", "B", "W", "M", "O"]
    # @small_pawn_row = ["X", "O", " "]
  end
  
  def play
    @board.show
    # p @board
    @board.goal = @all_colors.shuffle.first(4)
    
    counter = 0
    12.times do
      begin
        puts "Please pick colors that will fill the next block and separate them by space (like this C C C C): "
        # p "----- GOAL FOR DEBUGGING -----"
        # p @board.goal
        # p "----- GOAL FOR DEBUGGING -----"
        input = gets.chomp.upcase
        # p "---------"
        # p input
        # p @big_pawn_row
        # p @all_colors
        # p "---------"
        # raise WrongColorError unless (@all_colors & input).count == 4
        
        raise InputError unless /^[RAGYBWMO]\s[RAGYBWMO]\s[RAGYBWMO]\s[RAGYBWMO]$/ =~ input
      rescue InputError
        puts <<-EOB
        
        +-- Not a critical Error but a small mismatch ----------------------------------------+
        | Wrong input format or wrong color picked. Example of correct input format:R B Y M.  |
        | Available colors list is on the right from the board.                               |
        +-------------------------------------------------------------------------------------+
        
        EOB
        retry
      end
      input = input.split(" ")
      @big_pawns_row = input
      @board.fill_guess_slots(@big_pawns_row, counter)
      @board.show
      @small_pawn_row.check(@board.goal, @big_pawns_row)
      # p @small_pawn_row
      @board.fill_check_slots(@small_pawn_row.small_pawn_row, counter)
      @board.show
      # p @board.slots[0][counter] = @big_pawn_row
      counter += 1
    end
    
    @board.lose
    
    # p @big_pawn.colors
    # p @small_pawn.colors
  end
end

Game.new.play