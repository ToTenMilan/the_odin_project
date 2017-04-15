require 'rest-client'
puts "What website you want to visit?"
puts "Maybe something like: 'localhost:3000/users'"
url = gets.chomp
#url = "http://localhost:3000/users"
#puts RestClient.get(url)
puts RestClient.post(url, "")
