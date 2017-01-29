class SmallPawn
  attr_reader :small_pawn_row, :colors
  def initialize
    @small_pawn_row = Array.new(4, " ")
    # @colors = ["X", "O", " "] # X - on place, O - present, not in place, " " - not present
  end
end