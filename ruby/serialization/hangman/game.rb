require 'yaml'
require 'json'
require 'msgpack'
require './password'
require './input_error'
require './basic_serializable'

class Game
  include BasicSerializable
  
  SAVE_OR_LOAD = ["save", "load"]
  
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
        puts "Type 'save' to save current game or 'load' to load previously saved game."
        puts "Choose next letter: \n"
        input = gets.chomp.downcase
        raise InputError unless input =~ /^[A-Za-z]$/ || SAVE_OR_LOAD.include?(input)# match exactly one letter
      rescue InputError
        puts "Type exactly one letter, without spaces, special characters etc."
        retry
      end
      
      if SAVE_OR_LOAD.include?(input)
        
        case
        when input == "save"
          save_game
        when input == "load"
          load_game
        end
        
      else
        @password.check(input)
        @password.add_to_picked(input)
        @password.show
        @password.game_over?
      end
      
    end
  end
  
  private
    
    def save_game
      serialized_password = @password.serialize
      puts "Please name your saved game: "
      filename = gets.chomp.downcase
      filename = "saved_games/" + filename + ".txt"
      File.open(filename, "w") do |file|
        file.puts(serialized_password)
      end
      @password.show
    end
    
    def load_game
      puts "\nChoose the game which you want to load: \n(type the whole name here)\n"
      all_saved_games = Dir.entries('saved_games')
      puts all_saved_games
      game_to_load = gets.chomp.downcase
      game_to_load = "saved_games/" + game_to_load
      file = File.new(game_to_load, 'r')
      serialized_object = file.gets # @password = file
      @password.unserialize(serialized_object)
      @password.show
      file.close
    end
  
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
      sleep 1.2
    end
end

Game.new.play