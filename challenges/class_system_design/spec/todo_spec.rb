require 'todo'

RSpec.describe Todo do
  describe "#title method" do
    it "returns the title" do
      task = Todo.new("walk the dog")
      expect(task.title).to eq "walk the dog"
    end
  end
end