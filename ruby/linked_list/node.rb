class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
  
  def next_node
    @next_node
  end
  
  def next_node=(next_node)
    @next_node = next_node
  end
end

# Node = Struct.new(:value, :next_node)
