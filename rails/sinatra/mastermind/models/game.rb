#!/usr/bin/env ruby

# Mastermind game by ToTenMilan
# Design inspired by TicTacToe game made by John Phelps ---> https://github.com/jphelps413/odin-ruby/tree/master/oop-games/tic-tac-toe

require_relative 'board'
require_relative 'code_pegs_row'
require_relative 'key_pegs_row'
require_relative 'input_error'

class Game
  attr_accessor :board, :code_pegs, :key_pegs

  def initialize
    @board = Board.new
    @code_pegs = CodePegsRow.new
    @key_pegs = KeyPegsRow.new
    @@turn_counter = 0
  end

  def move(input)
    @code_pegs = input.split(" ")
    @board.fill_guess_slots(@code_pegs, @@turn_counter)
    @key_pegs.check(@board.goal, @code_pegs)
    @board.fill_check_slots(@key_pegs.row, @@turn_counter)
    @@turn_counter += 1
  end

  # def play(input)
  #   @board.goal = @board.set_goal(@all_colors)

  #   # @key_pegs.lose(@board.goal)
  # end
end

############## turn off for tests | turn on to play #########
# Game.new.play
