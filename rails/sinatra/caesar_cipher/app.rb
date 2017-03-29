require 'sinatra'
if development?
  require 'sinatra/reloader'
end

def caesar_cipher(input, key)
  upperascii = (65..90)
  lowerascii = (97..122)
  message = ""

  input.each_byte do |letter|
    if upperascii.include?(letter)
      message += (((letter - 65 + key ) % 26 ) + 65).chr
    elsif lowerascii.include?(letter)
      message += (((letter - 97 + key ) % 26 ) + 97).chr
    else
      message += letter.chr
    end
  end

  message
end

get '/' do
  output = nil
  erb :index, locals: { output: output }
end

post '/' do
  message = params[:message]
  key = params[:key].to_i
  output = caesar_cipher(message, key)
  erb :index, locals: { output: output }
end
