module Enumerable
  def my_each
    c = 0
    until c == length
      yield(self[c])
      c += 1
    end
    self
  end
  
  def my_each_with_index
    c = 0
    until c == length
      yield(self[c], c)
      c += 1
    end
    self
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
          # p "------- I no: #{c.to_s} -------"
          # p "acc: " + acc.to_s
          # p "iter: " + iter.to_s
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
  
      # my_map method is modified below to accept procs or blocks
      # def my_map
      #   mapped = []
      #   self.my_each { |item| mapped << yield(item) }
      #   mapped
      # end
  
  def my_map(*procedure)
    mapped = []
        # p procedure
      if procedure.first != nil
            # begin
            #   rescue "Error from if"
            # p "---------------"
            # p procedure
            # p procedure.first
            # p self
            # p "hey from if"
            # p "---------------"
          self.my_each do |item|
                # p item.to_s
                # p item.to_s.call
                # p "hey from proc block"
            mapped << procedure.first.call(item)
          end
            # end
            # procedure.first.call(self)
      
      elsif block_given?
        self.my_each { |item| mapped << yield(item) }
      end
          # puts "return: "
    mapped
  end
  
end


###### old tests ############################3
# names = ["mo", "bo", "joe", "zoe","jim", "kelly", "kirk"]
# nums = [1,6,0,-4,44]
# fruits = {apple: "refreshing", banana: "satiating", orange: "healthy" }
# floats = [1.4, 3.6, 6.221, 9.0]

# my_proc = Proc.new do
#   |n| n * 2
# end

# puts "original map range proc: "
# p [2,3,4].map(&my_proc) # {|sum, n| sum * n}
# puts "original map range block: "
# p [2,3,4].map {|n| n * 2}
# puts "original map names: "
# p names.map { |name| name + "ay" }
# puts "original map nums: "
# p nums.map { |num| num + 10 }

# puts "nums with proc: "
# p [2,3,4].my_map(my_proc) # {|sum, n| sum * n}
# puts "nums with block: "
# p [2,3,4].my_map {|n| n * 2}
# puts "names: "
# p names.my_map { |name| name + "ay" }
# puts "nums: "
# p nums.my_map { |num| num + 10 }


      # puts "original inject names: "
      # p names.inject { |memo, word| memo.length > word.length ? memo : word }
      # puts "original inject nums: "
      # p nums.inject(1, :*)
# puts "original inject range: "
# p nums.inject(0) {|sum, n| sum + n}
# puts "original inject range: "
# p floats.inject(0) {|sum, n| sum + n}
      # puts "original inject range 2: "
      # p [2,3,4].inject {|sum, n| sum * n}
      
      # puts "names: "
      # p names.my_inject { |memo, word| memo.length > word.length ? memo : word }
      # puts "nums: "
      # p nums.my_inject(1, :*)
# puts "range: "
# p nums.my_inject(0) {|sum, n| sum + n}
# puts "range: "
# p floats.my_inject(0) {|sum, n| sum + n}
      # puts "range2: "
      # p [2,3,4].my_inject {|sum, n| sum * n}
      
      

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

# puts "original each names: "
# names.each{ |name| puts name }
# puts "names: "
# names.my_each { |name| puts name }

# puts "original each_with_index names: "
# names.each_with_index { |name, index| puts name, index }
# puts "my_each_with_index names: "
# names.my_each_with_index { |name, index| puts name, index }


# puts "original select names: "
# p names.select { |name| name[0] == "j" }
# puts "original select nums: "
# p nums.select { |num| num > 4 }
#       # puts "original select fruits: "
#       # p fruits.select { |fruit, taste| fruit == :banana }

# puts "names: "
# p names.my_select { |name| name[0] == "j" }
# puts "nums: "
# p nums.my_select { |num| num > 4 }
# puts "fruits: "
#       # puts fruits.keys
#       # p fruits.my_select { |fruit, taste| fruit == :banana }



