require 'track'

RSpec.describe Track do
  context "searches for a keyword" do
    it "returns true for a match" do
      track = Track.new("one two","three four")
      expect(track.matches?("two")).to eq true
    end

    it "returns false for no match" do
      track = Track.new("one two","three four")
      expect(track.matches?("five")).to eq false
    end
  end
end