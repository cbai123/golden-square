require 'reading_time'

RSpec.describe "reading_time method" do
  it "returns 0 when given empty string" do
    expect(reading_time("")).to eq 0
  end

  it "returns 0 when given one word" do
    expect(reading_time("one")).to eq 0
  end

  it "returns 1 when given 200 words" do
    text = "one " * 200
    expect(reading_time(text)).to eq 1
  end

  it "returns 2 when given 350 words" do
    text = "one " * 350
    expect(reading_time(text)).to eq 2
  end

  it "returns 2 when given 449 words" do
    text = "one " * 449
    expect(reading_time(text)).to eq 2
  end

  it "returns 25 when given 5000 words" do 
    text = "one " * 5000
    expect(reading_time(text)).to eq 25
  end
end