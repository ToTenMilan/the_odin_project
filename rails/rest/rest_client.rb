require 'rest-client'

resource = RestClient.get 'http://www.bing.com/search', params: {q: 'cats+dogs'}

puts "--------------------------------"
puts "Code:"
puts resource.code
puts "--------------------------------"
puts "Cookies:"
puts resource.cookies
puts "--------------------------------"
puts "Headers:"
puts resource.headers
puts "--------------------------------"
puts "Body:"
puts resource.body
puts "--------------------------------"
