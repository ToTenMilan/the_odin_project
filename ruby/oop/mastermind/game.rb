#!/usr/bin/env ruby

# Mastermind game by ToTenMilan
# Design inspired by TicTacToe game made by John Phelps ---> https://github.com/jphelps413/odin-ruby/tree/master/oop-games/tic-tac-toe

require './board'
require './big_pawn_row'
require './small_pawn'

class Game
  def initialize
    @board = Board.new
    @big_pawn_row = BigPawnRow.new
    @small_pawn = SmallPawn.new
    @all_colors = ["R", "A", "G", "Y", "B", "W", "M", "O"]
    @small_pawn_row = ["X", "O", " "]
  end
  
  def play
    p @board.show
    p @board
    @board.goal = @all_colors.shuffle.first(4)
    p @board.goal
    counter = 0
    3.times do
      
      puts "Please pick colors that will fill the next block and separate them by space (like this C C C C): "
      input = gets.chomp.upcase.split(" ")
      @big_pawn_row = input
      @board.fill(@big_pawn_row, counter)
      @board.show
      CHECK METHOD
      # p @board.slots[0][counter] = @big_pawn_row
      counter += 1
    end
    
    # p @big_pawn.colors
    # p @small_pawn.colors
  end
end

Game.new.play