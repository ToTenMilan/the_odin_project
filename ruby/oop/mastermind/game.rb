#!/usr/bin/env ruby

# Mastermind game by ToTenMilan
# Design inspired by TicTacToe game made by John Phelps ---> https://github.com/jphelps413/odin-ruby/tree/master/oop-games/tic-tac-toe

require './board'
require './big_pawns_row'
require './small_pawn'
require './wrong_color'

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
    p "----- GOAL FOR DEBUGGING -----"
    p @board.goal
    p "----- GOAL FOR DEBUGGING -----"
    counter = 0
    3.times do
      begin
        puts "Please pick colors that will fill the next block and separate them by space (like this C C C C): "
        input = gets.chomp.upcase.split(" ")
        # p "---------"
        # p input
        # p @big_pawn_row
        # p @all_colors
        # p "---------"
        raise WrongColor.new if (@all_colors & input).count != 4
      rescue WrongColor
        puts "Wrong color. Please pick some color listed on the board's right"
        retry
      end
      @big_pawns_row = input
      @board.fill(@big_pawns_row, counter)
      @board.show
      @small_pawn_row.check(@board.goal, @big_pawns_row)
      p @small_pawn_row
      # p @board.slots[0][counter] = @big_pawn_row
      counter += 1
    end
    
    # p @big_pawn.colors
    # p @small_pawn.colors
  end
end

Game.new.play