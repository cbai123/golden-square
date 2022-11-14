require 'diary_entry.rb'

RSpec.describe DiaryEntry do
  it "returns the title" do
    entry = DiaryEntry.new("my_title", "my_contents")
    expect(entry.title).to eq "my_title"
  end

  it "returns the contents" do
    entry = DiaryEntry.new("my_title", "my_contents")
    expect(entry.contents).to eq "my_contents"
  end

  it "returns the word count" do
    entry = DiaryEntry.new("title", "one two three")
    expect(entry.count_words).to eq 3
  end

  it "returns the reading time for an entry" do
    entry = DiaryEntry.new("title", "one two three four")
    expect(entry.reading_time(2)).to eq 2
  end

  context "#reading_chunk method" do
    it "returns a readable chunk" do
      entry = DiaryEntry.new("title", "one two three")
      expect(entry.reading_chunk(2,1)).to eq "one two"
    end

    it "returns the next chunk if called again" do
      entry = DiaryEntry.new("title", "one two three")
      entry.reading_chunk(2,1)
      expect(entry.reading_chunk(2,1)).to eq "three"
    end

    it "loops correctly with reading chunks" do
      entry = DiaryEntry.new("title", "one two three")
      entry.reading_chunk(2,1)
      entry.reading_chunk(2,1)
      entry.reading_chunk(2,1)
      entry.reading_chunk(2,1)
      expect(entry.reading_chunk(2,1)).to eq "one two"
    end
  end
end
