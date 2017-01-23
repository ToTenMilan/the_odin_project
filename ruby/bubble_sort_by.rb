def swap(outer, inner)
  outer, inner = inner, outer
end

def bubble_sort_by(array)
  # length = array.length
  flag = -1
  array.each_with_index do |left, outer|
    array.each_with_index do |right, inner|
      flag = 0 if flag != 0
      if yield(left, right) > 0
        swap(left, right)
        # array[o], array[i] = array[i], array[o]
        flag += 1
      end
    end
  end
end

# def bubble_sort_by(array)
#   array.each do |left|
#     p "left from loop: #{left}"
#     array.each do |right|
#       p "right from loop: #{right}"
#       if yield(left, right) > 0
#       # process here what block has returned
#         p "left: #{left}"
#         p "right: #{right}"
#         left, right = right, left
#         p "left: #{left}"
#         p "right: #{right}"
#         print "array: "; p array
#         puts "\n---new iteration---\n"
#       end
#     end
#   end
#   array
# end
  
bubble_sort_by(["hi","hello","hey"]) do |left,right|
  # p "left: " + left
  # p "right: " + right
  left.length - right.length
  # puts "end iteration\n"
end