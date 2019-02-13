require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cake) { Dessert.new("cake", 1, chef) }
  
  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end 
    it "sets a quantity" do 
      expect(cake.quantity).to eq(1)
    end 
    it "starts ingredients as an empty array" do 
      expect(cake.ingredients).to eq([])
    end 
    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("cake", "five", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(cake.add_ingredient("flour")).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
