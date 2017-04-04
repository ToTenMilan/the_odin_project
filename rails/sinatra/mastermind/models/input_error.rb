class InputError < StandardError
end

# begin
#   puts "Please pick colors that will fill the next block and separate them by space (like this C C C C): "
#   # p "----- GOAL FOR DEBUGGING -----"
#   # p @board.goal
#   # p "----- GOAL FOR DEBUGGING -----"
#   input = gets.chomp.upcase
#   # p "---------"
#   # p input
#   # p @big_pawn_row
#   # p @all_colors
#   # p "---------"
#   # raise WrongColorError unless (@all_colors & input).count == 4

#   raise InputError unless /^[RAGYBWMO]\s[RAGYBWMO]\s[RAGYBWMO]\s[RAGYBWMO]$/ =~ input
# rescue InputError
#   puts <<-EOB

#   +-- Not a critical Error but a small mismatch ----------------------------------------+
#   | Wrong input format or wrong color picked. Example of correct input format:R B Y M.  |
#   | Available colors list is on the right from the board.                               |
#   +-------------------------------------------------------------------------------------+

#   EOB
#   retry
# end



