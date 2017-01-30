#!/usr/bin/env ruby

# Mastermind game by ToTenMilan
# Design inspired by TicTacToe game made by John Phelps ---> https://github.com/jphelps413/odin-ruby/tree/master/oop-games/tic-tac-toe

require './board'
require './code_pegs_row'
require './key_pegs_row'
require './input_error'
require './colors'

class Game
  def initialize
    @board = Board.new
    @code_pegs = CodePegsRow.new
    @key_pegs = KeyPegsRow.new
    @all_colors = ["R", "A", "G", "Y", "B", "W", "M", "O"]
    # @key_pegs = ["X", "O", " "]
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
      @code_pegs = input
      @board.fill_guess_slots(@code_pegs, counter)
      @board.show
      @key_pegs.check(@board.goal, @code_pegs)
      # p @key_pegs
      @board.fill_check_slots(@key_pegs.row, counter)
      @board.show
      # p @board.slots[0][counter] = @big_pawn_row
      counter += 1
      # puts "RED THING".red
    end
    
    @key_pegs.lose(@board.goal)
    
    # p @big_pawn.colors
    # p @small_pawn.colors
  end
end

Game.new.play