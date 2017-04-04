require 'sinatra'
require_relative './models/game.rb'
require_relative './models/board.rb'
require_relative './models/code_pegs_row.rb'
require_relative './models/key_pegs_row.rb'
if development?
  require 'sinatra/reloader'
end
# cd workspace/the_odin_project/rails/sinatra/mastermind
enable :sessions

get '/' do
  input = nil
  message = nil
  error = nil
  session[:counter] = 0
  counter = session[:counter]
  session[:game] = Game.new
  game = session[:game]
  session[:goal] = game.board.set_goal
  goal = session[:goal]
  unless input.nil?
    slots = game.board.slots
  end
  erb :index, locals: {input: input, slots: slots, goal: goal, message: message, error: error, counter: counter}
end

post '/' do
  game = session[:game]
  goal = session[:goal]
  input = params[:input].upcase
  session[:error] = nil
  session[:message] = nil
  counter = session[:counter]
  take_input(game, input)

  error = session[:error]
  message = session[:message]
  slots = game.board.slots
  check_slots = game.board.check_slots

  erb :index, locals: {input: input, slots: slots, check_slots: check_slots, goal: goal, message: message, error: error, counter: counter}
end

get '/rules' do
  erb :rules
end

def take_input(game, input)
  unless /^[RAGYBWMO]\s[RAGYBWMO]\s[RAGYBWMO]\s[RAGYBWMO]$/ =~ input
    session[:error] = "Wrong input format.<br>Format your input according to hint below where 'C' is the first letter of a desired color peg<br>Possible pegs are: R, A, G, Y, B, W, M, O<br>Check 'Rules' for more info."
  else
    session[:counter] += 1
    if game.move(input) == true
      session[:message] = "YOU WON. Press New Game button to hunt some more unicorns"
    elsif session[:counter] >= 12
      session[:message] = "YOU LOST. 12 turns reached. Press New Game button to try to hunt some unicorn"
    else
      session[:message] = nil
    end
  end
end
