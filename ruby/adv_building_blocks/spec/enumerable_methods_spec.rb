require 'enumerable_methods'

describe Enumerable do
  before(:example) do
    @names = ["mo", "joe", "jim", "kelly", "kirk"]
    @nums = [1,6,0,-4,44]
    @fruits = {apple: "refreshing", banana: "satiating", orange: "healthy" }
    @floats = [1.4, 3.6, 6.221, 9.0]
    @objects = [1, "ay", :somesym, Array.new, 1.2, {hey: "yo"}, Proc.new{|n| n}]
  end
  
  describe "#my_each" do
    context "given array with names" do
      it "returns this array" do
        expect(@names.my_each {|name| name}).to eql(@names)
      end
    end
    
    context "given various objects array" do
      it "returns this array" do
        expect(@objects.my_each {|obj| obj}).to eql(@objects)
      end
    end
  end
  
  describe "#my_select" do
    context "given array with names" do
      it "returns only names starting with 'j'" do
        expect(@names.my_select {|name| name[0] == "j"}).to eql(["joe", "jim"])
      end
    end
    
    context "given array with nums" do
      it "returns only nums greater than 4" do
        expect(@nums.my_select {|num| num > 4}).to eql([6, 44])
      end
    end
    
    context "given array with objects" do
      it "returns only nested arrays within this array" do
        expect(@objects.my_select {|obj| obj.class == Array.new.class}).to eql([Array.new])
      end
    end
  end
  
  describe "#my_all?" do
    context "given nums array" do
      it "returns true when asked whether all are of class Fixnum" do
        expect(@nums.my_all? {|obj| obj.class == 0.class}).to eql(true)
      end
      it "returns false when asked whether all are less than -5" do
        expect(@nums.my_all? {|num| num < -5}).to eql(false)
      end
    end
  end
  
  describe "#my_any?" do
    context "given floats array" do
      it "returns true if array contain '9.0 value" do
        expect(@floats.my_any? {|f| f == 9.0}).to eql(true)
      end
    end
  end
  
  describe "#my_inject" do
    context "given array with ints and 0 injected" do
      it "returns sum of these nums" do
        expect(@nums.my_inject(0) {|sum, num| sum + num}).to eql(47)
      end
    end
    context "given array with floats and 0 injected" do
      it "returns not rounded sum of these nums" do
        expect(@floats.my_inject(0) {|sum, num| sum + num}).to eql(20.221)
      end
    end
  end
  
  describe "#my_map" do
    context "given array with strings" do
      it "returns every string with 'ay' appended" do
        expect(@names.my_map {|name| name + "ay"}).to eql(["moay", "joeay", "jimay", "kellyay", "kirkay"])
      end
    end
    context "given array with nums" do
      it "returns every num with 10 added" do
        expect(@nums.my_map {|num| num + 10}).to eql([11, 16, 10, 6, 54])
      end
    end
  end
  
end