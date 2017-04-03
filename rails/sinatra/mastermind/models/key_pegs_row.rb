class KeyPegsRow
  attr_reader :row, :colors
  def initialize
    @row = Array.new()
    # @colors = ["X", "O", " "] # X - on place, O - present, not in place, " " - not present
  end

  def check(goal, input)
    # temp arrays for calculating key pegs
    temp_goal = Array.new(goal)
    temp_input = Array.new(input)
    if input == goal
      won?(goal)
    end

    @row = []

    # calculate well placed code pegs
    if input[3] == temp_goal[3]
      temp_goal.delete_at(3)
      temp_input.delete_at(3)
      @row << "X"
    end
    if input[2] == goal[2]
      temp_goal.delete_at(2)
      temp_input.delete_at(2)
      @row << "X"
    end
    if input[1] == goal[1]
      temp_goal.delete_at(1)
      temp_input.delete_at(1)
      @row << "X"
    end
    if input[0] == goal[0]
      temp_goal.delete_at(0)
      temp_input.delete_at(0)
      @row << "X"
    end
    # calculate guessed but not in place pawns
    pawns_not_in_place = (temp_input.count - (temp_input - temp_goal).count)
    pawns_not_in_place.times { @row << "O" }
    # calculate missed pawns
    missed_pawns = temp_input.count - pawns_not_in_place
    missed_pawns.times { @row << " " }
    # p "----- small pawns row-------"
    @row
  end

  def lose?(goal)
    true
  end

  private

    def won?(goal)
      true
    end
end
