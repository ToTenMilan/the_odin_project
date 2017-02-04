class Game
  # attr_accessor :password
  
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
  
end

Game.new.filter('dictionary.txt')

  


# rand(0)