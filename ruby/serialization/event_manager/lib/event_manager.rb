require 'csv'
puts "EventManager initialized"

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  
  # if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than 5 digits, truncate it to the first 5 digits
  if zipcode.nil?
    zipcode = "00000"
  elsif zipcode.length > 5
    zipcode = zipcode.slice(0..4)
  # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits
  elsif zipcode.length < 5
    zipcode = zipcode.rjust(5, "0")
  end
  
  puts "#{name} #{zipcode}"
end

###### ITERATION 1 ######
# lines = File.readlines('event_attendees.csv')
# lines.each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(',')
#   name = columns[2]
#   # p columns
#   puts name
# end

# if File.exist?('event_attendees.csv')
#   contents = File.read('event_attendees.csv')
#   puts contents
# end

