def swap(outer, inner)
  outer, inner = inner, outer
end

def bubble_sort(array)
  # length = array.length
  flag = -1
  array.each_with_index do |outer, o|
    array.each_with_index do |inner, i|
      flag = 0 if flag != 0
      if array[o] < array[i]
        swap(array[o], array[i])
        # array[o], array[i] = array[i], array[o]
        flag += 1
      end
    end
  end
end

p bubble_sort([4,3,78,2,0,2,6,8,2,45,32,12,1,0,111,123,112,140])

# void sort(int values[], int n)
#     int i, j, temp;
#     int swapCtr = -1;
#     for (i = 0; i < n; i++)
#         for (j = 0; j < n; j++)
#             if (swapCtr != 0)
#             swapCtr = 0;
#             if (values[i] < values[j])
#                 temp = values[i];
#                 values[i] = values[j];
#                 values[j] = temp;
#                 swapCtr++;
#     return;
# }

# array.each do |outer|
  #   array.each do |inner|
      
  #     if outer > inner
  #       p temp = inner
  #       p inner = outer
  #       p outer = temp
  #     # elsif outer == inner
  #     #   next
    
  #     end
  #   end
  # end

