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
    it "shuffles the ingredient array" do 
      ingredients = ["flour", "egg", "milk", "butter", "sugar"]
      ingredients.each { |ingredient| cake.add_ingredient(ingredient) }
      expect(cake.ingredients).to eq(ingredients)
      cake.mix!
      expect(cake.ingredients).to_not eq(ingredients)
    end 
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      expect(cake.eat(1)).to eq(0)
    end 
    it "raises an error if the amount is greater than the quantity" do 
      expect { cake.eat(100)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return("Chef Chef the Great Baker")
      expect(cake.serve).to eq("Chef Chef the Great Baker has made 1 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      allow(chef).to receive(:bake)
    end
  end
end
