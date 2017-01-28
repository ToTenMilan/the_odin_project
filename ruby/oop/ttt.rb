class WrongTile < Exception
end

class Tile
  attr_accessor :position, :type
  def initialize(position, type)
    @position = position
    @type = type
  end
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
  sleep 0.5
    puts "Player #{mark}! type one of these fields:
    tl|tc|tr
    cl|cc|cr
    bl|bc|br"
    move = gets.chomp.downcase.to_sym
    raise WrongTile unless [:tl, :tc, :tr, :cl, :cc, :cr, :bl, :bc, :br].include?(move)
  rescue WrongTile
    puts "Wrong tile name. Try again"
    sleep 0.5
    retry
  end

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

  # draw board after player's move
  puts "      | #{tl.type ||= " " } | #{tc.type ||= " " } | #{tr.type ||= " " } |
      | #{cl.type ||= " " } | #{cc.type ||= " " } | #{cr.type ||= " " } |
      | #{bl.type ||= " " } | #{bc.type ||= " " } | #{br.type ||= " " } |"
  
  # check win cases
  case
  when
    (tc.type == tl.type && tc.type == tr.type) && tc.type != " " # top hor. line
    p "#{tc.type} has won!"
    exit
  when
    (cc.type == cl.type && cc.type == cr.type) && cc.type != " " # middle hor. line
    p "#{cc.type} has won!"
    exit
  when
    (bc.type == bl.type && bc.type == br.type) && bc.type != " " # bottom hor. line
    p "#{bc.type} has won!"
    exit
  when
    (cl.type == tl.type && cl.type == bl.type) && cl.type != " " # left vert. line
    p "#{cl.type} has won!"
    exit
  when
    (cc.type == tc.type && cc.type == bc.type) && cc.type != " " # middle vert. line
    p "#{cc.type} has won!"
    exit
  when
    (cr.type == tr.type && cr.type == br.type) && cr.type != " " # right vert. line
    p "#{cr.type} has won!"
    exit
  when
    (cc.type == bl.type && cc.type == tr.type) && cc.type != " " # diagonal line from top left
    p "#{cc.type} has won!"
    exit
  when
    (cc.type == tl.type && cc.type == br.type) && cc.type != " " # diagonal line from bottom left
    p "#{cc.type} has won!"
    exit
  else
    sleep 0.5
    p "Next player"
    sleep 0.5
  end
  # change turn to other player
  turn += 1
end