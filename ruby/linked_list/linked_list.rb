require './node'

class LinkedList
  attr_reader :head
  def initialize
    # @head = Node.new
    @head = Node.new("Head node")
    p @head
    # @list[0] = @head
  end
  
  def append(node)
    # p self.next_node
    # p self
    self.next_node = node
    # @prev_node = @list[-1]
    # @node = Node.new(string)
    # @list.push(@node)
    # @prev_node.next_node = @node
  end
  
  def prepend(node)
    @node = Node.new
    @node.next_node = node
    # @list.unshift(@node)
  end
  
  # def size
  #   @list.size
  # end
  
  # def head
  #   @list.first
  # end
  
  # def tail
  #   @list.last
  # end
  
  # def at(index)
  #   @list[index]
  # end
  
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


list = LinkedList.new
# p list
# node1 = Node.new("node1")
# p node1
list.append(Node.new("node1"))
p list.next_node
# node_one = Node.new
# node_one.value = "Hello"
# p node_one
# list.append_to("Hello", head)



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

