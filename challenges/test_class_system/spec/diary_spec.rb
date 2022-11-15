require 'diary'

RSpec.describe Diary do
  context "when nothing is added" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end
end