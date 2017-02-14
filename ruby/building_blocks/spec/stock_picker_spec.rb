require 'stock_picker'

describe "#highest_revenue" do
  context "bought first day and sold fifth day" do
    it "returns integer 12" do
      expect(highest_revenue([17,3,6,9,15,8,6,1,10])).to eql(12)
    end
  end
  
  context "same as first but edge case with highest as first and lowest as last" do
    it "returns integer 12" do
      expect(highest_revenue([30,3,6,9,15,8,6,2,10,1])).to eql(12)
    end
  end
end

describe "#best_days_to_buy" do
  context "given '[17,3,6,9,15,8,6,1,10]'" do
    it "returns days with indexes 1 & 4" do
      expect(best_days_to_buy([17,3,6,9,15,8,6,1,10])).to eql([1,4])
    end
  end
  
  context "same as first but edge case with highest as first and lowest as last" do
    it "returns days with indexes 1 & 4" do
      expect(best_days_to_buy([30,3,6,9,15,8,6,2,10,1])).to eql([1,4])
    end
  end
end

