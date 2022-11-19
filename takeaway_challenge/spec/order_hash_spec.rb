require 'order_hash'

RSpec.describe Order do
  describe "#menu method" do
    it "prints the menu" do
      io = double :io
      order = Order.new(io)
      expect(io).to receive(:puts).with("Menu:")
      expect(io).to receive(:puts).with("Cod - £3.50")
      expect(io).to receive(:puts).with("Sausage - £3.50")
      expect(io).to receive(:puts).with("Halloumi - £3.00")
      expect(io).to receive(:puts).with("Chips - £2.00")
      expect(io).to receive(:puts).with("Peas - £1.50")
      order.menu
    end
  end

  describe "#receipt method" do
    it "prints the correct order" do
      io = double :io
      order = Order.new(io)
      order.select("Cod")
      order.select("Chips")
      order.select("Peas")
      order.select("Chips")
      expect(io).to receive(:puts).with ("Receipt:")
      expect(io).to receive(:puts).with ("Cod - £3.50")
      expect(io).to receive(:puts).with ("Chips - £2.00")
      expect(io).to receive(:puts).with ("Peas - £1.50")
      expect(io).to receive(:puts).with ("Total - £7.00")
      order.receipt
    end
  end
end