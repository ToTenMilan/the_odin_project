require 'socket'
 
host = 'www.tutorialspoint.com'     # The web server
port = 80                    # Default HTTP port
path = "/index.htm"                 # The file we want 

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
print body                          # And display it

# require 'net/http'                  # The library we need
# host = 'www.harrpagan.pl'     # The web server
# path = '/p/spoty.html'                 # The file we want 

# http = Net::HTTP.new(host)          # Create a connection
# headers, body = http.get(path)      # Request the file
# if headers.code == "200"            # Check the status code   
#   print body                        
# else                                
#   puts "#{headers.code} #{headers.message}" 
# end