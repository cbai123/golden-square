require 'diary'
require 'secret_diary'

RSpec.describe "integration tests" do
  describe "#read method" do
    context "fails" do
      it "when secret diary is not unlocked" do
        diary = Diary.new("my contents")
        secret_diary = SecretDiary.new(diary)
        expect{secret_diary.read}.to raise_error "Go away!"
      end
    end

    it "returns the contents when diary is unlocked" do
      diary = Diary.new("my contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "my contents"
    end

    context "fails" do
      it "when diary is unlocked then locked" do
        diary = Diary.new("my contents")
        secret_diary = SecretDiary.new(diary)
        secret_diary.unlock
        secret_diary.lock
        expect{secret_diary.read}.to raise_error "Go away!"
      end
    end
  end
end