class SmallPawn
  attr_reader :small_pawn_row, :colors
  def initialize
    @small_pawn_row = Array.new()
    @colors = ["X", "O", " "] # X - on place, O - present, not in place, " " - not present
  end
  
  def check(goal, input)
    if input == goal
      return "You won! HajlaBajla!"
    end
    if input[0] == goal[0]
      @small_pawn_row << "X"
    end
    if input[1] == goal[1]
      @small_pawn_row << "X"
    end
    if input[2] == goal[2]
      @small_pawn_row << "X"
    end
    if input[3] == goal[3]
      @small_pawn_row << "X"
    end
  end
  @small_pawn_row
end