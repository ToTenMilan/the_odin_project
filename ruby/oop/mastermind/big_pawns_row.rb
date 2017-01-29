class BigPawnsRow
  attr_accessor :row
  # attr_reader :colors
  def initialize
    @row = Array.new(4, " ")
    # @colors = ["R", "A", "G", "Y", "B", "W", "M", "O"]
  end
  
  # def colors
  #   @colors
  # end
end