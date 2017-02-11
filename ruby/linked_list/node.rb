class Node
  attr_accessor :value, :next_node, :index
  def initialize(value = nil, next_node = nil, index = 0)
    @value = value
    @index = index
    @next_node = next_node
  end
end

# Node = Struct.new(:value, :next_node)
