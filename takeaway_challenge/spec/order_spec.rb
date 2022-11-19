require 'order'

RSpec.describe Order do
  context "#menu method" do
    it "prints the menu" do
      io = double :io
      item_1 = double :item, name: "Cod", price: 3.5
      item_2 = double :item, name: "Sausage", price: 3.5
      item_3 = double :item, name: "Halloumi", price: 3.0
      item_4 = double :item, name: "Chips", price: 2.0
      item_5 = double :item, name: "Peas", price: 1.5

      order = Order.new(io)
      order.add(item_1)
      order.add(item_2)
      order.add(item_3)
      order.add(item_4)
      order.add(item_5)

      expect(io).to receive(:puts).with("Menu:").ordered
      expect(io).to receive(:puts).with("Cod - £3.50").ordered
      expect(io).to receive(:puts).with("Sausage - £3.50").ordered
      expect(io).to receive(:puts).with("Halloumi - £3.00").ordered
      expect(io).to receive(:puts).with("Chips - £2.00").ordered
      expect(io).to receive(:puts).with("Peas - £1.50").ordered

      order.menu
    end
  end

  context "#receipt method" do
    it "prints the correct receipt" do
      io = double :io
      item_1 = double :item, name: "Cod", price: 3.5
      item_2 = double :item, name: "Sausage", price: 3.5
      item_3 = double :item, name: "Halloumi", price: 3.0
      item_4 = double :item, name: "Chips", price: 2.0
      item_5 = double :item, name: "Peas", price: 1.5

      order = Order.new(io)
      order.add(item_1)
      order.add(item_2)
      order.add(item_3)
      order.add(item_4)
      order.add(item_5)

      order.select("Cod")
      order.select("Chips")
      order.select("Peas")

      expect(io).to receive(:puts).with("Receipt:").ordered
      expect(io).to receive(:puts).with("Cod - £3.50").ordered
      expect(io).to receive(:puts).with("Chips - £2.00").ordered
      expect(io).to receive(:puts).with("Peas - £1.50").ordered
      expect(io).to receive(:puts).with("Total - £7.00").ordered
      order.receipt
    end
  end
end