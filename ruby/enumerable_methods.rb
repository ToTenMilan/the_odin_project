module Enumerable
  def my_each
    c = 0
    until c == length
      yield(self[c])
      c += 1
    end
    self
    # self.length.times { yield }
  end
  
  def my_each_with_index
    c = 0
    until c == length
      yield(self[c], c)
      c += 1
    end
    self
    # self.length.times { yield }
  end
  
  # my_select working only with arrays
  def my_select
    result = []
    c = 0
    self.my_each do |item|
      if true == yield(item)
        result << self[c]
      end
      c += 1
    end
    result
  end
  
  def my_all?
    self.my_each do |item|
      if yield(item) == false
        return false
      end
    end
    return true
  end
  
  def my_any?
    self.my_each do |item|
      if yield(item) == true
        return true
      end
    end
    return false
  end
  
  def my_none?
    self.my_each do |item|
      if yield(item) == true
        return false
      end
    end
    return true
  end
  
  def my_count
    c = 0
    self.my_each do |item|
      if block_given?
        if yield(item) == true
          c += 1
        end
      else
        c += 1
      end
    end
    c
  end
  
  def my_map
    mapped = []
    self.my_each { |item| mapped << yield(item) }
    mapped
  end
  
  
  # my_inject method not worjk with ranges, and only with one integer argument
  def my_inject(dose)
    c = 0
    # dose[0] = 0 if dose == nil
    # injected = false
    acc = dose
    # acc = 1 if acc.nil? 
    # acc = 0
    self.my_each do |iter|
      c += 1
      p "------- I no: #{c.to_s} -------"
      p "acc: " + acc.to_s
      p "iter: " + iter.to_s
      acc = yield(acc, iter)
      # if injected == false
      #   acc = dose
      #   injected = true
      # end
      
      # p "------- I no: #{c.to_s} -------"
      # p "dose: " + dose.to_s
      # # p "injected: " + injected.to_s
      # p "iter: " + iter.to_s
      
      # p "acc: " + acc.to_s
      # p "result: " + result.to_s
      # acc += iter
      # result = acc
    end
    acc
  end
  
  def multiply_els(elements)
    my_inject(elements)
  end
end

# cd the_odin_project/ruby

names = ["mo", "bo", "joe", "zoe","jim", "kelly", "kirk"]
nums = [1,6,2,6,7,4,7,3,4,4,44 ]
fruits = {apple: "refreshing", banana: "satiating", orange: "healthy" }

# puts "original inject names: "
# p names.inject { |memo, word| memo.length > word.length ? memo : word }
# puts "original inject nums: "
# p nums.inject(1, :*)
puts "original inject range: "
p [2,3,4].inject(1) {|sum, n| sum * n}
# puts "original inject range 2: "
# p [2,3,4].inject {|sum, n| sum * n}

# puts "names: "
# p names.my_inject { |memo, word| memo.length > word.length ? memo : word }
# puts "nums: "
# p nums.my_inject(1, :*)
puts "range: "
p [2,3,4].my_inject(1) {|sum, n| sum * n}
# puts "range2: "
# p [2,3,4].my_inject {|sum, n| sum * n}


# puts "original map names: "
# p names.map { |name| name + "ay" }
# puts "original map nums: "
# p nums.map { |num| num + 10 }

# puts "names: "
# p names.my_map { |name| name + "ay" }
# puts "nums: "
# p nums.my_map { |num| num + 10 }


# puts "original count names: "
# p names.count { |name| name[1] == "o" }
# puts "original count nums: "
# p nums.count { |num| num > 6 }

# puts "names: "
# p names.my_count { |name| name[1] == "o" }
# puts "nums: "
# p nums.my_count { |num| num > 6 }


# puts "original none? names: "
# p names.none? { |name| name[0] == "m" }
# puts "original none? nums: "
# p nums.none? { |num| num == 5 }

# puts "names: "
# p names.my_none? { |name| name[0] == "m" }
# puts "nums: "
# p nums.my_none? { |num| num == 5 }


# puts "original any? names: "
# p names.any? { |name| name[0] == "m" }
# puts "original any? nums: "
# p nums.any? { |num| num == 5 }

# puts "names: "
# p names.my_any? { |name| name[0] == "m" }
# puts "nums: "
# p nums.my_any? { |num| num == 5 }


# puts "original all? names: "
# p names.all? { |name| name[1] == "o" }
# puts "original all? nums: "
# p nums.all? { |num| num >= 1 }

# puts "names: "
# p names.my_all? { |name| name[1] == "o" }
# puts "nums: "
# p nums.my_all? { |num| num >= 1 }


# names.each{ |name| puts name }

# names.my_each { |name| puts name }


# names.each_with_index { |name, index| puts name, index }

# names.my_each_with_index { |name, index| puts name, index }


# puts "original select names: "
# p names.select { |name| name[0] == "j" }
# puts "original select nums: "
# p nums.select { |num| num > 4 }
# puts "original select fruits: "
# p fruits.select { |fruit, taste| fruit == :banana }

# puts "names: "
# p names.my_select { |name| name[0] == "j" }
# puts "nums: "
# p nums.my_select { |num| num > 4 }
# puts "fruits: "
# puts fruits.keys
# p fruits.my_select { |fruit, taste| fruit == :banana }



