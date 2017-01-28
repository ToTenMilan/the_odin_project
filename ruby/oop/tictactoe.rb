class TicTacToe
  1.times do
    puts "What's your move (X or O): "
    type = gets.chomp
    puts "What's your move: \n
      tl |tc |tr
      ___|___|___
      cl | c |cr
      ___|___|___
         |   |
      bl | bc|br "
    position = gets.chomp
    m = Marker.new(position, type)
  end
  
  @@moves = []
  def new_move
    
    @@moves << @position
    move = moves.last
    puts "Current board: \n
      #{move == "tl" ? move : "tl"} |#{move == "tc" ? move : "tc"} |#{move == "tr" ? move : "tr"} 
      ___|___|___
      cl | c |cr
      ___|___|___
         |   |
      bl | bc|br "
  end
  
  class Marker
    attr_reader :position, :type
    def initialize(position, type)
      @position = position
      @type = type
    end
  end
  
  
end







