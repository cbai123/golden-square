require 'calculator'

RSpec.describe InteractiveCalculator do
  it "returns the answer" do
    io = double :io
    interactive_calculator = InteractiveCalculator.new(io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(io).to receive(:gets).and_return("4").ordered
    expect(io).to receive(:puts).with("Please enter another number").ordered
    expect(io).to receive(:gets).and_return("3").ordered
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("4 - 3 = 1").ordered
    interactive_calculator.run
  end

  it "returns the answer with different numbers" do
    io = double :io
    interactive_calculator = InteractiveCalculator.new(io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(io).to receive(:gets).and_return("9").ordered
    expect(io).to receive(:puts).with("Please enter another number").ordered
    expect(io).to receive(:gets).and_return("6").ordered
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("9 - 6 = 3").ordered
    interactive_calculator.run
  end

  it "fails when input string at first number" do
    io = double :io
    interactive_calculator = InteractiveCalculator.new(io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(io).to receive(:gets).and_return("hello").ordered
    expect { interactive_calculator.run }.to raise_error "You must enter a number"
  end

  it "fails when input string at second number" do
    io = double :io
    interactive_calculator = InteractiveCalculator.new(io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(io).to receive(:gets).and_return("4").ordered
    expect(io).to receive(:puts).with("Please enter another number").ordered
    expect(io).to receive(:gets).and_return("hey").ordered
    expect { interactive_calculator.run }.to raise_error "You must enter a number"
  end
end