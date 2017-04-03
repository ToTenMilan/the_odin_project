class Board
  attr_accessor :goal, :check_slots, :slots
  def initialize
    @slots = Array.new(12, Array.new(4, " "))
    @goal = Array.new(4, " ")
    # @goal = set_goal
    @check_slots = Array.new(12, Array.new(4, " "))
  end

  def set_goal
    # all_colors.shuffle.first(4)
    all_colors = ["R", "A", "G", "Y", "B", "W", "M", "O"]
    goal = []
    4.times do |n|
      goal[n] = all_colors[rand(8)]
    end
    @goal = goal
  end

  def show
    puts <<-EOB
    |-G-|-O-|-A-|-L-| <-is-HIDDEN                               :-]-<--<):
    +---+---+---+---+              +---+---+---+---+
    | #{@slots[11][0]} | #{@slots[11][1]} | #{@slots[11][2]} | #{@slots[11][3]} | ---CHECK---> | #{@check_slots[11][0]} | #{@check_slots[11][1]} | #{@check_slots[11][2]} | #{@check_slots[11][3]} |      COLORS AVAILABLE:
    +---+---+---+---+              +---+---+---+---+
    | #{@slots[10][0]} | #{@slots[10][1]} | #{@slots[10][2]} | #{@slots[10][3]} | ---CHECK---> | #{@check_slots[10][0]} | #{@check_slots[10][1]} | #{@check_slots[10][2]} | #{@check_slots[10][3]} |      R - Red
    +---+---+---+---+              +---+---+---+---+      A - Azure
    | #{@slots[9][0]} | #{@slots[9][1]} | #{@slots[9][2]} | #{@slots[9][3]} | ---CHECK---> | #{@check_slots[9][0]} | #{@check_slots[9][1]} | #{@check_slots[9][2]} | #{@check_slots[9][3]} |      G - Green
    +---+---+---+---+              +---+---+---+---+      Y - Yellow
    | #{@slots[8][0]} | #{@slots[8][1]} | #{@slots[8][2]} | #{@slots[8][3]} | ---CHECK---> | #{@check_slots[8][0]} | #{@check_slots[8][1]} | #{@check_slots[8][2]} | #{@check_slots[8][3]} |      B - Black
    +---+---+---+---+              +---+---+---+---+      W - White
    | #{@slots[7][0]} | #{@slots[7][1]} | #{@slots[7][2]} | #{@slots[7][3]} | ---CHECK---> | #{@check_slots[7][0]} | #{@check_slots[7][1]} | #{@check_slots[7][2]} | #{@check_slots[7][3]} |      M - Magenta
    +---+---+---+---+              +---+---+---+---+      O - Orange
    | #{@slots[6][0]} | #{@slots[6][1]} | #{@slots[6][2]} | #{@slots[6][3]} | ---CHECK---> | #{@check_slots[6][0]} | #{@check_slots[6][1]} | #{@check_slots[6][2]} | #{@check_slots[6][3]} |
    +---+---+---+---+              +---+---+---+---+      LEGEND:
    | #{@slots[5][0]} | #{@slots[5][1]} | #{@slots[5][2]} | #{@slots[5][3]} | ---CHECK---> | #{@check_slots[5][0]} | #{@check_slots[5][1]} | #{@check_slots[5][2]} | #{@check_slots[5][3]} |
    +---+---+---+---+              +---+---+---+---+      X - Right pawn, at right spot
    | #{@slots[4][0]} | #{@slots[4][1]} | #{@slots[4][2]} | #{@slots[4][3]} | ---CHECK---> | #{@check_slots[4][0]} | #{@check_slots[4][1]} | #{@check_slots[4][2]} | #{@check_slots[4][3]} |      O - Pawn is present, but spot is mismatched
    +---+---+---+---+              +---+---+---+---+      " "(empty) - There is no such pawn in 'goal'
    | #{@slots[3][0]} | #{@slots[3][1]} | #{@slots[3][2]} | #{@slots[3][3]} | ---CHECK---> | #{@check_slots[3][0]} | #{@check_slots[3][1]} | #{@check_slots[3][2]} | #{@check_slots[3][3]} |
    +---+---+---+---+              +---+---+---+---+
    | #{@slots[2][0]} | #{@slots[2][1]} | #{@slots[2][2]} | #{@slots[2][3]} | ---CHECK---> | #{@check_slots[2][0]} | #{@check_slots[2][1]} | #{@check_slots[2][2]} | #{@check_slots[2][3]} |
    +---+---+---+---+              +---+---+---+---+
    | #{@slots[1][0]} | #{@slots[1][1]} | #{@slots[1][2]} | #{@slots[1][3]} | ---CHECK---> | #{@check_slots[1][0]} | #{@check_slots[1][1]} | #{@check_slots[1][2]} | #{@check_slots[1][3]} |
    +---+---+---+---+              +---+---+---+---+
    | #{@slots[0][0]} | #{@slots[0][1]} | #{@slots[0][2]} | #{@slots[0][3]} | ---CHECK---> | #{@check_slots[0][0]} | #{@check_slots[0][1]} | #{@check_slots[0][2]} | #{@check_slots[0][3]} |
    +---+---+---+---+              +---+---+---+---+

    EOB
  end

  def fill_guess_slots(block, counter)
    @slots[counter] = block
  end

  def fill_check_slots(block, counter)
    @check_slots[counter] = block
  end

end
