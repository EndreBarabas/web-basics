require "cat_container"

RSpec.describe CatContainer do
  context "list method test - " do
    it "returns nothing initially" do
      cat_container = CatContainer.new()
      expect(cat_container.list()).to eql([])
    end
  end

  context "add method test - " do
    it "return a filled array" do
      cat_one = double :cat
      cat_two = double :cat
      cat_three = double :cat
      cat_container = CatContainer.new()
      cat_container.add(cat_one)
      cat_container.add(cat_two)
      cat_container.add(cat_three)
      expect(cat_container.list()).to eql([cat_one, cat_two, cat_three])
    end
  end

  context("deletes a cat entry") do
    it("returns the array without it") do
      cat_one = double :cat
      cat_two = double :cat
      cat_three = double :cat
      cat_container = CatContainer.new()
      cat_container.add(cat_one)
      cat_container.add(cat_two)
      cat_container.add(cat_three)
      cat_container.remove(cat_one)
      expect(cat_container.list()).to eq([cat_two, cat_three])
    end
  end
end
