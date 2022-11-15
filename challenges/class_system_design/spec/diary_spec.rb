require 'diary'

RSpec.describe Diary do
  describe "#list_diary method" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.list_diary).to eq []
    end
  end

  describe "#list_todo method" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.list_todo).to eq []
    end
  end

  describe "#list_numbers method" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.list_numbers).to eq []
    end
  end
end