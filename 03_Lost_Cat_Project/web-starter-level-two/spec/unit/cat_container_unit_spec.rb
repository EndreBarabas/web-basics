require "cat_container"
require "cat"

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
      cat_container.remove(0)
      expect(cat_container.list()).to eq([cat_two, cat_three])
    end
  end

  context("updates a cat name") do
    it("returns the updated array") do
      #cat_one = double :cat, name: "Bob", number: "12345", description: "Barks"
      cat_one = Cat.new("Bob")
      cat_container = CatContainer.new()
      cat_container.add(cat_one)
      #allow(cat_one).to receive(:update).with("Leyla").and_return("Leyla")
      cat_container.update_name(cat_one.name, "Leyla")
      expect(cat_one.name).to eq("Leyla")
    end
  end

  context("updates a cat contact") do
    it("returns the updated array") do
      cat_one = Cat.new("Bob", "232323")
      cat_container = CatContainer.new()
      cat_container.add(cat_one)
      cat_container.update_number(cat_one.number, "343434")
      expect(cat_one.number).to eq("343434")
    end
  end

  context("updates a cat description") do
    it("returns the updated array") do
      cat_one = Cat.new("Bob", "232323", "Extremely fat")
      cat_container = CatContainer.new()
      cat_container.add(cat_one)
      cat_container.update_description(cat_one.description, "Spotted face")
      expect(cat_one.description).to eq("Spotted face")
    end
  end
end
