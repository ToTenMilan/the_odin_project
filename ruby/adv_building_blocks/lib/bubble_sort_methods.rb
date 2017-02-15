# bubble_sort

def bubble_sort(array)
  flag = -1
  array.each_with_index do |outer, o|
    array.each_with_index do |inner, i|
      flag = 0 if flag != 0
      if array[o] < array[i]
        array[o], array[i] = array[i], array[o]
        flag += 1
      end
    end
  end
end

p bubble_sort([323,4,3,78,2,0,2,6,8,2,45,32,12,1,0,111,123,112,140,0])

# Bubble_sort_by method 

def bubble_sort_by(array)
  array.each_with_index do |outer, outer_index|
    array.each_with_index do |inner, inner_index|
      if yield(outer, inner) > 0
        if outer_index < inner_index
              # p "outer after if: " + outer        # for debugging, indented for clarity
              # p "inner after if: " + inner        # for debugging
          outer, inner = inner, outer
              # p "outer after swap: " + outer      # for debugging
              # p "inner after swap: " + inner      # for debugging

          # change value array item
          array[inner_index] = inner
          array[outer_index] = outer
        end
      end
    end
  end
  p array
end
  
bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end


bubble_sort_by(["hi","hello","hey", "helloween", "hi", "hitchhiking"]) do |left,right|
  left.length - right.length
end

bubble_sort_by(["hahlamahlabhlalaba", "hi","hello","hey", "helloween", "hi", "hola", "hitchhiking", "h"]) do |left,right|
  left.length - right.length
end