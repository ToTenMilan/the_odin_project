require './password'

class Game
  
  def initialize
    @password = Password.new
  end
  
  def play
    @password.filter('filtered_dictionary.txt')
    p @password.pick_password
    loop do
      puts "Choose next letter: "
      input = gets.chomp.downcase
      @password.check(input)
      @password.show
      @password.game_over?
    end
  end
  
end

Game.new.play