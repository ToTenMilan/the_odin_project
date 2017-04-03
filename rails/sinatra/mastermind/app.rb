require 'sinatra'
require_relative './models/game.rb'
require_relative './models/board.rb'
require_relative './models/code_pegs_row.rb'
require_relative './models/key_pegs_row.rb'
require_relative './models/input_error.rb'
if development?
  require 'sinatra/reloader'
end
# cd workspace/the_odin_project/rails/sinatra/mastermind
enable :sessions

get '/' do
  input = nil
  message = nil
  session[:game] = Game.new
  game = session[:game]
  session[:goal] = game.board.set_goal
  goal = session[:goal]
  unless input.nil?
    slots = game.board.slots
  end
  erb :index, locals: {input: input, slots: slots, goal: goal, message: message}
end

post '/' do
  game = session[:game]
  goal = session[:goal]
  input = params[:input].upcase
  # game.move(input)
  # message = nil

  if game.move(input) == true
    message = "YOU WON. Press New Game button to hunt some more unicorns"
  else
    message = nil
  end

  #
  # if game.key_pegs.check(goal, input) == true
  #   message = "YOU WON. Next Game is started"
  #   redirect '/'
  # end
  slots = game.board.slots
  check_slots = game.board.check_slots
  erb :index, locals: {input: input, slots: slots, check_slots: check_slots, goal: goal, message: message}
end
