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
        puts "Choose next letter: "
        input = gets.chomp.downcase
        raise InputError unless input =~ /^[A-Za-z]$/ || SAVE_OR_LOAD.include?(input)# match exactly one letter
      rescue InputError
        puts "Type exactly one letter, without spaces, special characters etc."
        retry
      end
      
      if SAVE_OR_LOAD.include?(input)
        
        case
        when input == "save"
          serialized_password = @password.serialize
          puts "Please name your saved game: "
          filename = gets.chomp.downcase
          filename = "saved_games/" + filename + ".txt"
          File.open(filename, "w") do |file|
            file.puts(serialized_password)
          end
          
        when input == "load"
          puts "Choose the game which you want to load: "
          all_saved_games = Dir.entries('saved_games')
          puts all_saved_games
          game_to_load = gets.chomp.downcase
          game_to_load = "saved_games/" + game_to_load
          file = File.new(game_to_load, 'r')
          serialized_object = file.gets # @password = file
          @password.unserialize(serialized_object)
          
          
          
          # puts "------------------------serialized object: "
          # p serialized_object #=> {\"@password\":[\"p\",\"r\",\"o\",\"f\",\"u\",\"s\",\"e\",\"l\",\"y\"],\"@password_checked\":[\"_\",\"_\",\"_\",\"_\",\"u\",\"_\",\"_\",\"_\",\"_\"],\"@chances\":8,\"@picked_letters\":[\"u\",\"a\"]}\n"
          # puts "-------------------------------------------\n\n"
          # puts "------------password before unserializing: "
          # p @password
          # p @password.class #=> Password
          # # puts @password.password
          # # puts @password.password_checked
          # # puts @password.chances
          # # puts @password.picked_letters
          # puts "-------------------------------------------\n\n"
          # puts "----------------------unserialized_hash: "
          # p unserialized_hash = unserialize(serialized_object)
          # puts "-------------------------------------------\n\n"
          # puts "----------------------------hash_values: "
          # p unserialized_hash["@password"]
          # puts "-------------------------------------------\n\n"
          # # @password.password = unserialized_hash["@password"]
          # # @password.password_checked = unserialized_hash["@password_checked"]
          # # @password.chances = unserialized_hash["@chances"]
          # # @password.picked_letters = unserialized_hash["@picked_letters"]
          # # puts "-------------------------------------------"
          # puts "-------------password after unserializing: "
          # p @password
          # puts "-------------------------------------------\n\n"
          # p @password.class #=> Array
          
          
          
          # puts @password.password
          # puts @password.password_checked
          # puts @password.chances
          # puts @password.picked_letters
          file.close
          # unserialized_password = @password.unserialize(@password.serialize)
          # puts "unserialized password"
          # p @password
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