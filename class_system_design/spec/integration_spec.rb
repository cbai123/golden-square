require 'diary'
require 'diary_entry'
require 'todo'

RSpec.describe "integration" do
  context "diary entry features" do
    it "adds and returns list of diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("my title", "my contents")
      entry_2 = DiaryEntry.new("my title 2", "my contents 2")
      diary.add_diary(entry_1)
      diary.add_diary(entry_2)
      expect(diary.list_diary).to eq [entry_1, entry_2]
    end

    it "returns the best diary entry to read" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title", "one two three four")
      entry_2 = DiaryEntry.new("title 2", "five six seven eight nine ten")
      entry_3 = DiaryEntry.new("title 3", "eleven twelve")
      diary.add_diary(entry_1)
      diary.add_diary(entry_2)
      diary.add_diary(entry_3)
      expect(diary.find_best_diary_entry(5,1)).to eq entry_1
    end

    it "fails when wpm is 0" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title", "one two three four")
      entry_2 = DiaryEntry.new("title 2", "five six seven eight nine ten")
      entry_3 = DiaryEntry.new("title 3", "eleven twelve")
      diary.add_diary(entry_1)
      diary.add_diary(entry_2)
      diary.add_diary(entry_3)
      expect { diary.find_best_diary_entry(0,1) }.to raise_error "wpm must be > 0"
    end

    it "returns a list of phone numbers found in entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title", "07812345678")
      entry_2 = DiaryEntry.new("title 2", "my friend's number is 07987654321.")
      diary.add_diary(entry_1)
      diary.add_diary(entry_2)
      expect(diary.list_numbers).to eq ["07812345678", "07987654321"]
    end

    it "returns list of phone numbers when multiple in one entry" do
      diary = Diary.new
      entry = DiaryEntry.new("title 2", "my friend's number is 07987654321. Mine is 07123456789")
      diary.add_diary(entry)
      expect(diary.list_numbers).to eq ["07987654321", "07123456789"]
    end
  end

  it "adds and returns a list of todo entries" do
    diary = Diary.new
    todo_1 = Todo.new("brush teeth")
    todo_2 = Todo.new("walk the dog")
    diary.add_task(todo_1)
    diary.add_task(todo_2)
    expect(diary.list_todo).to eq [todo_1, todo_2]
  end
end