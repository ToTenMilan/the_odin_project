class Password
  
  def initialize
    @password = Array.new
    @password_checked = nil # for brevity
    @chances = 9
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
    @password_checked = Array.new(@password.length, "_")
    @password
  end
  
  def show
    puts <<-EOB
    
    PASSWORD: #{@password_checked[0]} #{@password_checked[1]} #{@password_checked[2]} #{@password_checked[3]} #{@password_checked[4]} #{@password_checked[5]} #{@password_checked[6]} #{@password_checked[7]} #{@password_checked[8]} #{@password_checked[9]} #{@password_checked[10]} #{@password_checked[11]}
    
    CHANCES: #{@chances}
    
    EOB
  end
  
  def check(input)
    @password.each_with_index do |letter, index|
      if letter == input
        @password_checked[index] = letter
      end
    end
    
    unless @password.include?(input)
      @chances -= 1
    end
  end
  
  def game_over?
    if @password == @password_checked
      puts "Congratulations! You found the password!"
      exit
    elsif @chances == 0
      puts "Sorry, you are out of chances. You lost."
      exit
    end
  end
  
end