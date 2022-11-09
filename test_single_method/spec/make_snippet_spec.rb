require 'make_snippet'

RSpec.describe "make_snippet method" do
  it "returns empty string when given empty input" do
    expect(make_snippet("")).to eq ""
  end
  context "returns same string when less or equal to  5 words" do
    it "hello world" do
      expect(make_snippet("hello world")).to eq "hello world"
    end

    it "astronaut, rocket, pirate" do 
      string = "astronaut, rocket, pirate, lamp, bottle"
      expect(make_snippet(string)).to eq "astronaut, rocket, pirate, lamp, bottle"
    end
  end

  context "returns a shortened string ending in ... when > 5 words" do
    it "6 words" do
      string = "hello world. My name is chris."
      expect(make_snippet(string)).to eq "hello world. My name is..."
    end
    it "10 words" do
      string = "I am wearing headphones, I am looking out the window."
      expect(make_snippet(string)).to eq "I am wearing headphones, I..."
    end
  end

end