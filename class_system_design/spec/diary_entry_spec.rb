require 'diary_entry'

RSpec.describe DiaryEntry do
  describe "#title method" do
    it "returns the title" do
      entry = DiaryEntry.new("my title", "my contents")
      expect(entry.title).to eq "my title"
    end
  end

  describe "#contents method" do
    it "returns the contents" do
      entry = DiaryEntry.new("my title", "my contents")
      expect(entry.contents).to eq "my contents"
    end
  end

  describe "#count_word method" do
    it "returns the correct word count" do
      entry = DiaryEntry.new("title", "one two three four")
      expect(entry.count_words).to eq 4
    end

    it "returns 0 when contents is empty" do
      entry = DiaryEntry.new("title", "")
      expect(entry.count_words).to eq 0
    end
  end

  describe "#reading_time method" do
    it "returns the correct reading time" do
      entry = DiaryEntry.new("title", "one two three four five")
      expect(entry.reading_time(2)).to eq 3
    end

    it "fails when wpm is 0" do
      entry = DiaryEntry.new("title", "one two three four five")
      expect{entry.reading_time(0)}.to raise_error "wpm must be > 0"
    end
  end
end