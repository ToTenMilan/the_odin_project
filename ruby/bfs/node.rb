class Node
  attr_accessor :value, :parent_node, :child_nodes
  def initialize(value)
    @value = value
    @parent_node = nil
    @child_nodes = []
  end
  
  def build_tree(list)
    # TODO in future
  end
  
end

n = Node.new("hey")
n2 = Node.new("daj klej")
n.child_nodes << n2
n2.parent_node = n
p n
p n2