dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  frequencies = Hash.new(0)
  dictionary.each do |word|
    counter = string.scan(/(?=#{word})/).count
    if counter > 0; frequencies[word] = counter; end
  end
  frequencies
end

p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)