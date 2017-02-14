require 'caesar_cipher'

describe "#caesar_cipher" do
  context "given 'What a string!' with key '5'" do
    it "returns 'Bmfy f xywnsl!'" do
      expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
    end
  end
  
  context "given 'S0m3 num83r5' with key '9'" do
    it "returns B0v3 wdv83a5" do
      expect(caesar_cipher("S0m3 num83r5", 9)).to eql("B0v3 wdv83a5")
    end
  end
  
  context "given 'string not encrypted at all (zero key)' with key '0'" do
    it "returns string not encrypted at all (zero key)" do
      expect(caesar_cipher("string not encrypted at all (zero key)", 0)).to eql("string not encrypted at all (zero key)")
    end
  end
  
  context "given 'string not encrypted at all (26 as key)' with key '26'" do
    it "returns string not encrypted at all (26 as key)" do
      expect(caesar_cipher("string not encrypted at all (26 as key)", 26)).to eql("string not encrypted at all (26 as key)")
    end
  end
  
  context "given 'special chars !@#$%^&*()}{:><][;.,/' with key '2'" do
    it "returns urgekcn ejctu !@#$%^&*()}{:><][;.,/" do
      expect(caesar_cipher("special chars !@#$%^&*()}{:><][;.,/", 2)).to eql("urgekcn ejctu !@#$%^&*()}{:><][;.,/")
    end
  end
  
  context "given 'sssaaammmeee letters     &spaces' with key '2'" do
    it "returns uuucccoooggg ngvvgtu &urcegu" do
      expect(caesar_cipher("sssaaammmeee letters     &spaces", 2)).to eql("uuucccoooggg ngvvgtu     &urcegu")
    end
  end
  
end