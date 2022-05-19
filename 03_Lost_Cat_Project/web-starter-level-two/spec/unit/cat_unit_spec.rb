require 'cat'

RSpec.describe Cat do
  it "returns all values" do
    cat = Cat.new("Bob","555555","black male cat")
    expect(cat.name).to eql("Bob")
    expect(cat.number).to eql("555555")
    expect(cat.description).to eql("black male cat")
  end
end
