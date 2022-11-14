require 'todo_list'

RSpec.describe TodoList do
  it "returns empty instance" do
    list = TodoList.new
    expect(list.incomplete).to eq []
  end
end