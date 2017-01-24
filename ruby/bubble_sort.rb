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