class SmallPawn
  attr_reader :small_pawn_row, :colors
  def initialize
    @small_pawn_row = Array.new()
    @colors = ["X", "O", " "] # X - on place, O - present, not in place, " " - not present
  end
  
  def check(goal, input)
    # temp arrays for calculating check pawns
    temp_goal = Array.new(goal)
    temp_input = Array.new(input)
    if input == goal
      puts <<-EOB
      +-----------------------------------+
      |                                   |
      |          YOU GUESSED IT!          |
      |                                   |
      |       The code is \"#{goal.join(" ")}\"       |
      |                                   |
      +-----------------------------------+
      EOB
      exit
    end
    @small_pawn_row = []
    # p "----- small pawns row-------"
    # calculate well placed pawns
    if input[3] == temp_goal[3]
      temp_goal.delete_at(3)
      temp_input.delete_at(3)
      @small_pawn_row << "X"
    end
    if input[2] == goal[2]
      temp_goal.delete_at(2)
      temp_input.delete_at(2)
      @small_pawn_row << "X"
    end
    if input[1] == goal[1]
      temp_goal.delete_at(1)
      temp_input.delete_at(1)
      @small_pawn_row << "X"
    end
    if input[0] == goal[0]
      temp_goal.delete_at(0)
      temp_input.delete_at(0)
      @small_pawn_row << "X"
    end
    # print "--- temp goal -------: "
    # p temp_goal
    # print "--------- temp input --------: "
    # p temp_input
    # calculate guessed but not in place pawns
    pawns_not_in_place = (temp_input.count - (temp_input - temp_goal).count)
    pawns_not_in_place.times { @small_pawn_row << "O" }
    # calculate missed pawns
    missed_pawns = temp_input.count - pawns_not_in_place
    missed_pawns.times { @small_pawn_row << " " }
    # p "----- small pawns row-------"
  end
  @small_pawn_row
end