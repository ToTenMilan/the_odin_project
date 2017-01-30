class SmallPawn
  attr_reader :small_pawn_row, :colors
  def initialize
    @small_pawn_row = Array.new()
    @colors = ["X", "O", " "] # X - on place, O - present, not in place, " " - not present
  end
  
  def check(goal, input)
    temp_goal = Array.new(goal)
    temp_input = Array.new(input)
            # temp_goal = goal
            # print "GOAL: "
            # p goal
            # print "TEMP GOAL: "
            # p temp_goal
    if input == goal
      p "You won! HajlaBajla!"
      puts "the code is \"#{goal.join(" ")}\""
      exit
    end
    @small_pawn_row = []
    p "----- small pawns row-------"
    
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
    print "--- temp goal -------: "
    p temp_goal
    print "--------- temp input --------: "
    p temp_input
    pawns_not_in_place = (temp_input.count - (temp_input - temp_goal).count)
    pawns_not_in_place.times { @small_pawn_row << "O" }
    missed_pawns = temp_input.count - pawns_not_in_place
    missed_pawns.times { @small_pawn_row << " " }
    # print "remains: "
    # p remains
    # if remains > 0
    #   remains.times { @small_pawn_row << " " }
    # end
    # if @small_pawn_row.count < 4
    #   @small_pawn_row.count.times { @small_pawn_row << "O" }
    # end
            # print "GOAL: "
            # p goal
            # print "TEMP GOAL: "
            # p temp_goal
            # # goal = temp_goal
            # print "GOAL: "
            # p goal
            # print "TEMP GOAL: "
            # p temp_goal
    
    # if p input[0] == goal[0]
    #   @small_pawn_row << "X"
    # # elsif goal.include?(input[0])
    # #   (goal - input).count.times { @small_pawn_row << "O" }
    #   # @small_pawn_row << "O"
    # # else
    # #   @small_pawn_row << " "
    # end
    
    # if p input[1] == goal[1]
    #   @small_pawn_row << "X"
    # # elsif goal.include?(input[1])
    # #   (goal - input).count.times { @small_pawn_row << "O" }
    # # else
    # #   @small_pawn_row << " "
    # end
    
    # if p input[2] == goal[2]
    #   @small_pawn_row << "X"
    # # elsif goal.include?(input[2])
    # #   (goal - input).count.times { @small_pawn_row << "O" }
    # # else
    # #   @small_pawn_row << " "
    # end
    
    # if p input[3] == goal[3]
    #   @small_pawn_row << "X"
    # # elsif goal.include?(input[3])
    # #   (goal - input).count.times { @small_pawn_row << "O" }
    # # else
    # #   @small_pawn_row << " "
    # end
    # spotted_pawns = @small_pawns_row.count
    # p spotted_pawns
    # if (goal - input).count < spotted_pawns
    # end
    p "----- small pawns row-------"
  end
  @small_pawn_row
end