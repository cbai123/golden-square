require 'music_library'

RSpec.describe MusicLibrary do
  context "when tracks are added" do
    it "returns a list" do
      playlist = MusicLibrary.new
      track_1 = double :track
      track_2 = double :track
      playlist.add(track_1)
      playlist.add(track_2)
      expect(playlist.all).to eq [track_1, track_2]
    end

    it "returns a track using search term" do
    playlist = MusicLibrary.new
      track_1 = double(:track, matches?: false)
      expect(track_1).to receive(:matches?).with("the").and_return(false)
      track_2 = double(:track, matches?: true)
      expect(track_2).to receive(:matches?).with("the").and_return(true)
      track_3 = double(:track, matches?: true)
      expect(track_3).to receive(:matches?).with("the").and_return(true)
      playlist.add(track_1)
      playlist.add(track_2)
      playlist.add(track_3)
      expect(playlist.search("the")).to eq [track_2, track_3]
    end
  end
end