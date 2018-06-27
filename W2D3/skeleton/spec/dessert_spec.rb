require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "bob") }

  subject(:pastry) {Dessert.new("pastry", 5, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(pastry.type). to eq("pastry")
    end

    it "sets a quantity" do
      expect(pastry.quantity). to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(pastry.ingredients). to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { pastry.quantity("hello") }. to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(pastry.ingredients).to_not include("flour")
      pastry.add_ingredient("flour")
      expect(pastry.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["beer", "water", "salt", "sugar"]

      ingredients.each do |el|
        pastry.add_ingredient(el)
      end

      expect(pastry.ingredients).to eq(ingredients)
      pastry.mix!
      expect(pastry.ingredients).not_to eq(ingredients)
      expect(pastry.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pastry.eat(4)
      expect(pastry.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pastry.eat(7) }. to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Bob the Great Baker")
      expect(pastry.serve).to eq("Chef Bob the Great Baker has made 5 pastries!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pastry)
      pastry.make_more
    end 
  end
end
