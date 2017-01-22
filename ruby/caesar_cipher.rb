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

p caesar_cipher("What a string!", 5)

# Nice code from https://gist.github.com/matugm/db363c7131e6af27716c
#
# def caesar_cipher(string, shift = 1)
#   alphabet  = Array('a'..'z')
#   non_caps  = Hash[alphabet.zip(alphabet.rotate(shift))]
#  
#   alphabet = Array('A'..'Z')
#   caps     = Hash[alphabet.zip(alphabet.rotate(shift))]
#  
#   encrypter = non_caps.merge(caps)
  
#   string.chars.map { |c| encrypter.fetch(c, c) }
# end

# p caesar_cipher("testingzZ1Z").join