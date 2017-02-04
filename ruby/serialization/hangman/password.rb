class Password
  
  def initialize
    @password = String.new
  end
  
  def filter(dictionary)
    unless File.exist?('filtered_dictionary.txt')
      file = File.new('filtered_dictionary.txt', 'w')
      File.foreach(dictionary) do |word|
        if (6..13).include?(word.length)
          file.write(word)
        end
      end
    end
  end
  
  def pick_password
    random_number = rand(1..52453)
    lines = File.readlines('filtered_dictionary.txt')
    lines.each_with_index do |line, index|
      if index == random_number
        @password = line.chomp.split('')
      end
    end
    @password
  end
  
end

# password = ""
# random_number = rand(1..52453)
# lines = File.readlines('filtered_dictionary.txt')
# lines.each_with_index do |line, index|
#   if index == random_number
#     password = line
#   end
#   p password.chomp
# end
# p line
# p password.chomp