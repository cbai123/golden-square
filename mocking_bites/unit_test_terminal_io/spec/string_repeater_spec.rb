require 'string_repeater'

RSpec.describe StringRepeater do
  it "repeats a string" do
    io = double :io
    string_repeater = StringRepeater.new(io)
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("10").ordered
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("TWIX"*10).ordered
    string_repeater.run
  end
end