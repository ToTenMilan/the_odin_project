def merge(left, right, new_array = [])
  while not (left.empty? || right.empty?)
    if left.first < right.first
      new_array << left.shift
    else
      new_array << right.shift
    end
  end
  new_array += left + right
end
	
def merge_sort(nums)
  return nums if nums.length < 2
  numshalf = nums.length / 2
  leftnums = nums[0, numshalf]
  rightnums = nums[numshalf, nums.length - 1]
  left_sorted = merge_sort(leftnums)
  right_sorted = merge_sort(rightnums)
  merge(left_sorted, right_sorted)
  
end

p merge_sort([2,4,6,3,5,7,1,8])
p merge_sort([2,9,4,6,3,5,7,1,8])
p merge_sort([4,2,6,3])
p merge_sort([8,4,6,3,55])
p merge_sort([2,6,4])