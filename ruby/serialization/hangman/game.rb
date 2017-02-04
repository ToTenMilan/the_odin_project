require './password'

class Game
  
  def initialize
    @password = Password.new
  end
  
  def play
    @password.filter('filtered_dictionary.txt')
    p @password.pick_password
  end
  
end

Game.new.play