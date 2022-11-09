require 'count_words'

RSpec.describe "count_words method" do
  it "returns 1 when one word is inputted" do
    expect(count_words("one")).to eq 1
  end

  it "returns 2 when two words are inputted" do
    expect(count_words("one two")).to eq 2
  end

  it "returns the correct number from string with punctuation" do
    str = "Hello world! My name is Chris."
    expect(count_words(str)).to eq 6
  end

  it "returns the correct number when dtring has double spaces" do
    expect(count_words("one  two")).to eq 2
  end

  it "returns 0 when only punctuation" do
    expect(count_words("!! ??")).to eq 0
  end

  it "returns the correct number when a number is in digit form" do
    expect(count_words("I'm 23")).to eq 2
  end
end