require './node'

# Made for practice rather than for performance

class LinkedList
  attr_accessor :head, :node
  @@size = 0
  
  def initialize(head_value = nil)
    @head = Node.new(head_value)
    # index of head is 0
    @head.index = 0
    @@size =+ 1
  end
  
  def append(data)
    if @head.next_node.nil?
      self.head.next_node = Node.new(data, nil, 1)
    else
      last = ObjectSpace.each_object(Node).find do |object|
          object.instance_variable_get(:@next_node) == nil
        end
      # index of new node is the last node + 1
      last.next_node = Node.new(data, nil, last.index + 1)
    end
    @@size += 1
  end
  
  def prepend(data)
    current_head = @head
    @head = Node.new(data)
    @head.next_node = current_head
    ObjectSpace.each_object(Node) do |object|
      object.index = object.instance_variable_get(:@index) + 1
    end
    @head.index = 0
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
    check(index)
    ObjectSpace.each_object(Node).find do |object|
      object.instance_variable_get(:@index) == index
    end
  end
  
  def pop
    # this pop method is only deleting penultimate node's reference to last node
    ObjectSpace.each_object(Node).find do |object|
      if object.instance_variable_get(:@index) == @@size - 2
        object.next_node = nil
      end
    end
    @@size -= 1
  end
  
  def contains?(data)
    ObjectSpace.each_object(Node) do |object|
      puts true if object.instance_variable_get(:@value) == data
    end
  end
  
  def find(data)
    node = ObjectSpace.each_object(Node).find do |object|
      object.instance_variable_get(:@value) == data
    end
    node.nil? ? nil : node.index
  end
  
  def to_s
    0.upto(@@size - 1) do |ctr|
      node = ObjectSpace.each_object(Node).find do |object|
        object.instance_variable_get(:@index) == ctr
      end
      print "( #{node.value} ) => "
    end
    puts "nil"
  end
  
  def insert_at(data=nil, index)
    check(index)
    # find current node and previous node according to inputted index
    current_node = nil
    previous_node = nil
    ObjectSpace.each_object(Node) do |object|
      if object.instance_variable_get(:@index) == index
        current_node = object
      end
      if object.instance_variable_get(:@index) == (index - 1)
        previous_node = object
      end
    end
    
    # increment indexes of nodes equal or greater than input index
    ObjectSpace.each_object(Node) do |object|
      if object.instance_variable_get(:@index) >= index
        object.index += 1
      end
    end
    # insert new node
    new_node = Node.new(data, current_node, index)
    previous_node.next_node = new_node
    @@size += 1
  end
  
  def remove_at(index)
    check(index)
    if index == 0
      remove_head
      return
    end
    next_node = nil
    previous_node = nil
    current_node = nil
    ObjectSpace.each_object(Node) do |object|
      if object.instance_variable_get(:@index) == (index - 1)
        previous_node = object
      end
      if object.instance_variable_get(:@index) == (index + 1)
        next_node = object
      end
      if object.instance_variable_get(:@index) == index
        current_node = object
      end
    end
    # decrement indexes of nodes equal or greater than input index
    ObjectSpace.each_object(Node) do |object|
      if object.instance_variable_get(:@index) >= index
        object.index -= 1
      end
    end
    
    #remove references at inputted index and link adjacent nodes to each other
    current_node.index = -1 # set to less than 0 to not be included in ObjectSpace iterations
    current_node.next_node = nil
    previous_node.next_node = next_node
    @@size -= 1
  end
  
  def remove_head
    # removing only references rather than entire node
    head_node = @head
    second_node = @head.next_node
    @head = second_node
    
    # decrements all indexes by one
    ObjectSpace.each_object(Node) do |object|
      object.index = object.instance_variable_get(:@index) - 1
    end
    head_node.next_node = nil 
    head_node.index = -1 # set to less than 0 to not be included in ObjectSpace iterations
    @@size -= 1
  end
  
  def check(index)
    raise ArgumentError, "Index cant be negative." if index < 0
  end
  
end

list = LinkedList.new("head node")
p "appending three nodes: "
list.append("node appended first")
list.append("node appended second")
list.append("node appended third")
p list
puts ""
p "prepending one node: "
list.prepend("node prepended after three appendings")
p list
puts ""
p "poping last node(appended as third): "
list.pop
p list
puts ""
p "pretty printed values by LinkedList#to_s: "
list.to_s
puts ""
p "Inserting at index 1... "
list.insert_at("inserted value at index 1", 1)
p "Inserting at index 3... "
list.insert_at("inserted value at index 3", 3)
p "Inserting again at index 1... "
list.insert_at("inserted value again at index 1", 1)
p "removing at index 5... "
list.remove_at(5)
p "removing at index 0... "
list.remove_at(0)
p "result: "
p list
puts ""
p "size of the list: "
p list.size
puts ""
p "return value of LinkedList#head method"
p list.head
puts ""
p "return value of LinkedList#tail method"
p list.tail
puts ""
p "extra method LinkedList#remove_head, which in fact is called by calling `remove_at(0)` on `list` object: "
list.remove_head
p list
puts ""
p "removing at index -1(should return ArgumentError: "
list.remove_at(-1)



