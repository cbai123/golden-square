require 'diary'

RSpec.describe DiaryEntry do
  
  context "it constructs" do
    it "returns title" do
      diary = DiaryEntry.new("my_title","my_content")
      expect(diary.title).to eq "my_title"
    end

    it "returns contents" do
      diary = DiaryEntry.new("my_title","my_content")
      expect(diary.content).to eq "my_content"
    end
  end

  describe "#count_words" do
    it "returns the number of words in contents" do
      diary = DiaryEntry.new("title","one two three")
      expect(diary.count_words).to eq 3
    end
  end

  describe "#reading_time" do
    it "returns the time to read contents" do
      contents = "one " * 350
      diary = DiaryEntry.new("title", contents)
      expect(diary.reading_time(200)).to eq 2
    end

    context "reading speed not above zero" do
      it "fails" do
        diary = DiaryEntry.new("title","contents")
        expect{ diary.reading_time(0) }.to raise_error "Reading speed must be above zero"
      end
    end
  end

  describe "#reading_chunk" do
    context "with contents readable within time" do
      it "returns contents" do
        diary = DiaryEntry.new("title","one two three")
        expect(diary.reading_chunk(200,1)).to eq "one two three"
      end
    end
    context "with contents unreadable within the time" do
      it "returns readable words" do
        diary = DiaryEntry.new("title","one two three")
        expect(diary.reading_chunk(2,1)).to eq "one two"
      end

      it "returns the next chunk, if asked again" do
        diary = DiaryEntry.new("title","one two three")
        diary.reading_chunk(2,1)
        expect(diary.reading_chunk(2,1)).to eq "three"
      end

      it "restarts when finished contents" do
        diary = DiaryEntry.new("title","one two three")
        diary.reading_chunk(2,1)
        diary.reading_chunk(2,1)
        expect(diary.reading_chunk(2,1)).to eq "one two"
      end

      it "restarts when exactly finished contents" do
        diary = DiaryEntry.new("title","one two three")
        diary.reading_chunk(2,1)
        diary.reading_chunk(1,1)
        expect(diary.reading_chunk(2,1)).to eq "one two"
      end

      context "reading speed not above zero" do
        it "fails" do
          diary = DiaryEntry.new("title","contents")
          expect{ diary.reading_chunk(0,1) }.to raise_error "Reading speed must be above zero"
        end
      end
    end
  end
end