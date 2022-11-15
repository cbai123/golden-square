require 'diary'
require 'diary_entry'

RSpec.describe "Diary integration" do
  context "when we add diary entries" do
    it "adds one and returns one" do
      diary = Diary.new
      entry = DiaryEntry.new("my title", "my contents")
      diary.add(entry)
      expect(diary.all).to eq [entry]
    end

    it "adds two and returns two" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("my title", "my contents")
    entry_2 = DiaryEntry.new("title", "contents")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.all).to eq [entry_1, entry_2]
    end
  end

  context "with diary entries" do
    it "returns the word count when one entry" do
      diary = Diary.new
      entry = DiaryEntry.new("title", "one two three")
      diary.add(entry)
      expect(diary.count_words).to eq 3
    end

    it "returns the word count when two entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title", "one two three")
      entry_2 = DiaryEntry.new("title", "four five six seven")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 7
    end

    it "returns the reading time" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title", "one two three")
      entry_2 = DiaryEntry.new("title", "four five six seven")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(2)).to eq 4
    end
  end

  describe "#find_best_entry_for_reading_time method"do
    it "returns the entry that can be read exactly" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title", "one two")
      entry_2 = DiaryEntry.new("title", "four five six seven")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.find_best_entry_for_reading_time(2,1)).to eq entry_1
    end

    it "returns the largest entry that can be read when not exact" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title", "one two three four five six")
      entry_2 = DiaryEntry.new("title", "seven eight nine ten")
      entry_3 = DiaryEntry.new("title", "eleven twelve thirteen")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.find_best_entry_for_reading_time(5,1)).to eq entry_2
    end

    it "fails when all entries are too large" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title", "one two three four five six")
      entry_2 = DiaryEntry.new("title", "seven eight nine ten")
      entry_3 = DiaryEntry.new("title", "eleven twelve thirteen")
      diary.add(entry_1)
      diary.add(entry_2)
      expect{diary.find_best_entry_for_reading_time(1,1)}.to raise_error "No readable entries"
    end
  end
end


