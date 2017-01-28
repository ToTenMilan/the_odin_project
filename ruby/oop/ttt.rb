class Tile
  attr_accessor :position, :type
  def initialize(position, type)
    @position = position
    @type = type
  end
end

class WrongTile < Exception
end


tl = Tile.new(:tl, mark = false)
tc = Tile.new(:tc, mark = false)
tr = Tile.new(:tr, mark = false)
cl = Tile.new(:cl, mark = false)
cc = Tile.new(:cc, mark = false)
cr = Tile.new(:cr, mark = false)
bl = Tile.new(:bl, mark = false)
bc = Tile.new(:bc, mark = false)
br = Tile.new(:br, mark = false)

turn = 0
9.times do
  turn % 2 == 0 ? mark = "x" : mark = "o"
  p "#{mark}'s turn"
  begin
  sleep 0.7
    puts "Player #{mark}! type one of those fields:
    tl|tc|tr
    cl|cc|cr
    bl|bc|br"
    move = gets.chomp.downcase.to_sym
    raise WrongTile unless [:tl, :tc, :tr, :cl, :cc, :cr, :bl, :bc, :br].include?(move)
  rescue WrongTile
    # if move != :tl || move != :cc
      puts "Wrong tile name. Try again"
      sleep 0.7
      retry
    # end
  end
  # unless move.include?(%w{tl tc tr cl cc cr bl bc br})
      # retry
    
  # puts "Wrong tile name. Try again." unless move.include?(%w{tl tc tr cl cc cr bl bc br})
  
  #   puts "Wrong tile name. Try again."
  
  case
  when move == :tl
    tl.type = mark
  when move == :tc
    tc.type = mark
  when move == :tr
    tr.type = mark
  when move == :cl
    cl.type = mark
  when move == :cc
    cc.type = mark
  when move == :cr
    cr.type = mark
  when move == :bl
    bl.type = mark
  when move == :bc
    bc.type = mark
  when move == :br
    br.type = mark
  else
    p "thats incorrect"
  end
  puts "      |#{tl.type ||= " " }|#{tc.type ||= " " }|#{tr.type ||= " " }|
      |#{cl.type ||= " " }|#{cc.type ||= " " }|#{cr.type ||= " " }|
      |#{bl.type ||= " " }|#{bc.type ||= " " }|#{br.type ||= " " }|"
  case
  when
    (tc.type == tl.type && tc.type == tr.type) && tc.type != " "
    p "#{tc.type} has won!"
    exit
  when
    (cc.type == cl.type && cc.type == cr.type) && tc.type != " "
    p "#{cc.type} has won!"
    exit
  when
    (bc.type == bl.type && bc.type == br.type) && tc.type != " "
    p "--------- #{bc.type} has won! ----------"
    exit
  when
    (cl.type == tl.type && cl.type == bl.type) && tc.type != " "
    p "#{cl.type} has won!"
    exit
  when
    (cc.type == tc.type && cc.type == bc.type) && tc.type != " "
    p "#{cc.type} has won!"
    exit
  when
    (cr.type == tr.type && cr.type == br.type) && tc.type != " "
    p "#{cr.type} has won!"
    exit
  when
    (cc.type == bl.type && cc.type == tr.type) && tc.type != " "
    p "#{cc.type} has won!"
    exit
  when
    (cc.type == tl.type && cc.type == br.type) && tc.type != " "
    p "#{cc.type} has won!"
    exit
  else
    sleep 0.5
    p "Next player"
    sleep 0.5
  end
  turn += 1
end

# puts "|#{tl.type ||= " " }|#{tc.type ||= " " }|#{tr.type ||= " " }|
# |#{cl.type ||= " " }|#{c.type ||= " " }|#{cr.type ||= " " }|
# |#{bl.type ||= " " }|#{bc.type ||= " " }|#{br.type ||= " " }|"

# p tl.type
# p tl.type
# p tl.position


# def new_move
#   p "your type: "
#   type = gets.chomp.to_s
#   p "your move: "
#   move = gets.chomp.to_sym
# end