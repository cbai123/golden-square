require 'order'
require 'menu_item'

RSpec.describe Order do
  context "#menu method" do
    it "prints the menu" do
      item_1 = MenuItem.new("Cod", 3.5)
      item_2 = MenuItem.new("Sausage", 3.5)
      item_3 = MenuItem.new("Halloumi", 3.0)
      item_4 = MenuItem.new("Chips", 2.0)
      item_5 = MenuItem.new("Peas", 1.5)

      order = Order.new(Kernel)
      order.add(item_1)
      order.add(item_2)
      order.add(item_3)
      order.add(item_4)
      order.add(item_5)

      expect(Kernel).to receive(:puts).with("Menu:").ordered
      expect(Kernel).to receive(:puts).with("Cod - £3.50").ordered
      expect(Kernel).to receive(:puts).with("Sausage - £3.50").ordered
      expect(Kernel).to receive(:puts).with("Halloumi - £3.00").ordered
      expect(Kernel).to receive(:puts).with("Chips - £2.00").ordered
      expect(Kernel).to receive(:puts).with("Peas - £1.50").ordered

      order.menu
    end
  end

  context "#receipt method" do
    it "prints the correct receipt" do
      item_1 = MenuItem.new("Cod", 3.5)
      item_2 = MenuItem.new("Sausage", 3.5)
      item_3 = MenuItem.new("Halloumi", 3.0)
      item_4 = MenuItem.new("Chips", 2.0)
      item_5 = MenuItem.new("Peas", 1.5)

      order = Order.new(Kernel)
      order.add(item_1)
      order.add(item_2)
      order.add(item_3)
      order.add(item_4)
      order.add(item_5)

      order.select("Cod")
      order.select("Chips")
      order.select("Peas")

      expect(Kernel).to receive(:puts).with("Receipt:").ordered
      expect(Kernel).to receive(:puts).with("Cod - £3.50").ordered
      expect(Kernel).to receive(:puts).with("Chips - £2.00").ordered
      expect(Kernel).to receive(:puts).with("Peas - £1.50").ordered
      expect(Kernel).to receive(:puts).with("Total - £7.00").ordered
      order.receipt
    end
  end

  context "#confirm method" do
    it "texts the correct method" do
      item_1 = MenuItem.new("Cod", 3.5)
      item_2 = MenuItem.new("Sausage", 3.5)
      item_3 = MenuItem.new("Halloumi", 3.0)
      item_4 = MenuItem.new("Chips", 2.0)
      item_5 = MenuItem.new("Peas", 1.5)

      order = Order.new(Kernel)
      order.add(item_1)
      order.add(item_2)
      order.add(item_3)
      order.add(item_4)
      order.add(item_5)

      order.select("Cod")
      order.select("Chips")
      order.select("Peas")

      expect(Kernel).to receive(:puts).with("Please enter your number:")
      expect(Kernel).to receive(:gets).and_return("+447715271162")
      order.confirm
    end
  end
end