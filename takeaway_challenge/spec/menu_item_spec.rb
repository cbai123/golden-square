require 'menu_item'

RSpec.describe MenuItem do
  it "returns the name of the item" do
    item = MenuItem.new("Cod",3.5)
    expect(item.name).to eq "Cod"
  end

  it "returns the price of the item" do
    item = MenuItem.new("Cod",3.5)
    expect(item.price).to eq 3.5
  end
end