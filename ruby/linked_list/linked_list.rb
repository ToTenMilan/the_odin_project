class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :node
  @@size = 0
  
  def initialize(head_value = nil)
    @head = Node.new(head_value)
  end
  
  def append(data)
    if @head.next_node.nil?
      self.head.next_node = Node.new(data)
    else
      last = ObjectSpace.each_object(Node).find do |object|
          object.instance_variable_get(:@next_node) == nil
        end
      last.next_node = Node.new(data)
    end
    @@size += 1
  end
  
  def prepend(data)
    current_head = @head
    @head = Node.new(data)
    @head.next_node = current_head
    @@size += 1
  end
  
  def size
    @@size
  end
  
  # head method defined at top
  
  def tail
    ObjectSpace.each_object(Node).find do |object|
      object.instance_variable_get(:@next_node) == nil
    end
  end
  
  def at(index)
    
  end
  
  # def pop
  #   @list.pop
  # end
  
  # def contains?(input)
  #   @list.any? { |n| n.value == input }
  # end
  
  # def find(data)
  #   @list.find { |n| n.value == data }
  # end
  
  # def to_s
  #   @list.each { |n| puts "( #{n} | #{n.value} | #{n.next_node} ) -> " }
  # end
  
end

list = LinkedList.new("head node")

list.append("node1")

list.append("node2")
list.append("node3")
p list
p "prepending: "
list.prepend("prepended node")
p list
p list.size
p list.head
p list.tail


# # p list.at(0)
# # p list.at(1)
# # list.prepend
# list.append("second append")
# list.append("third append")
# list.pop
# list.to_s


# p list.find("prepended")
# p list.find("non existent value")
# p list.contains?("appended")

# p list.at(1)
# p list.head
# p list.tail
# p list.size
# p list

# def contains?(input)
#     c = 0
#     self.each do |n|
#       p c
#       p input
#       p n
#       return true if n == input
#       c += 1
#     end
#   end

# arr = [1,2,3,"appended",4,6,7]
# p arr.contains?("appended")

