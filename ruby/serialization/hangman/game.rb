require './password'
require './input_error'

class Game
  
  def initialize
    @password = Password.new
  end
  
  def play
    @password.filter('filtered_dictionary.txt')
    @password.pick_password
    greeting
    @password.show
    loop do
      
      begin
        puts "Choose next letter: "
        input = gets.chomp.downcase
        raise InputError unless input =~ /^[A-Za-z]$/ # match exactly one letter
      rescue InputError
        puts "Type exactly one letter, without spaces, special characters etc."
        retry
      end
      
      @password.check(input)
      @password.add_to_picked(input)
      @password.show
      @password.game_over?
    end
  end
  
  private
    def greeting
      puts <<-EOB
      
      +----------------------------------------+
      |                                        |
      |                 Hello                  |
      |                                        |
      |       This is the game of hangman.     |
      |   Play by typing letters one by one    |
      |         and find the password.         |
      |           You have 9 chances.          |
      |                                        |
      |               Good luck!               |
      |                                        |
      +----------------------------------------+
      
      EOB
      sleep 2
    end
end

Game.new.play