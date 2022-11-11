require 'music.rb'

RSpec.describe MusicTracker do
  
  context "Adding nothing to the list" do
    it "returns empty list" do
      playlist = MusicTracker.new
      expect(playlist.list).to eq []
    end
  end

  context "Adding one song" do
    it "stores it in the list" do
      playlist = MusicTracker.new
      playlist.add("Can't Stop")
      expect(playlist.list).to eq ["Can't Stop"]
    end
  end

  context "Adding two songs" do
    it "stores both in the list" do
      playlist = MusicTracker.new
      playlist.add("Can't Stop")
      playlist.add("Dani California")
      expect(playlist.list).to eq ["Can't Stop", "Dani California"]
    end
  end

  context "Repeating a song" do
    it "Only stores it once" do
      playlist = MusicTracker.new
      playlist.add("Can't Stop")
      playlist.add("Can't Stop")
      expect(playlist.list).to eq ["Can't Stop"]
    end
  end
end