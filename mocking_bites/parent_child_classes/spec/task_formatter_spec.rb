require 'task_formatter'

RSpec.describe TaskFormatter do
  it "returns a formatted complete task" do
    task = double :fake_task, title: "my title", complete?: true
    formatted = TaskFormatter.new(task)
    expect(formatted.format).to eq "- [x] my title"
  end

  it "returns a formatted incomplete task" do
    task = double :fake_task, title: "my title", complete?: false
    formatted = TaskFormatter.new(task)
    expect(formatted.format).to eq "- [ ] my title"
  end
end