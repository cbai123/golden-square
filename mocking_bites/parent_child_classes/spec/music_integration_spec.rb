require 'music_library'
require 'track'

RSpec.describe "music library integration" do
  context "when tracks are added" do
    it "returns a list" do
      playlist = MusicLibrary.new
      track_1 = Track.new("my title", "my artist")
      track_2 = Track.new("my title 2", "my artist 2")
      playlist.add(track_1)
      playlist.add(track_2)
      expect(playlist.all).to eq [track_1, track_2]
    end

    it "returns a track using search term" do
    playlist = MusicLibrary.new
      track_1 = Track.new("Can't Stop", "RHCP")
      track_2 = Track.new("Under the bridge", "RHCP")
      track_3 = Track.new("In the End", "Linkin Park")
      playlist.add(track_1)
      playlist.add(track_2)
      playlist.add(track_3)
      expect(playlist.search("the")).to eq [track_2, track_3]
    end
  end
end