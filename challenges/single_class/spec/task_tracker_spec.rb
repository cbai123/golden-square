require 'task_tracker'

RSpec.describe TaskTracker do
  
  context "given no tasks" do
    it "returns an empty list" do
      task_list = TaskTracker.new
      expect(task_list.list).to eq []
    end
  end

  context "given one task" do
    it "stores it in the list" do
      task_list = TaskTracker.new
      task_list.add("brush teeth")
      expect(task_list.list).to eq ["brush teeth"]
    end
  end

  context "given two tasks" do
    it "stores both in the list" do
      task_list = TaskTracker.new
      task_list.add("brush teeth")
      task_list.add("shower")
      expect(task_list.list).to eq ["brush teeth", "shower"]
    end
  end

  context "given empty string" do
    it "doesn't store it" do
      task_list = TaskTracker.new
      task_list.add("")
      expect(task_list.list).to eq []
    end
  end

  context "completing a task" do
    it "removes it from the list" do
      task_list = TaskTracker.new
      task_list.add("brush teeth")
      task_list.add("shower")
      task_list.complete("brush teeth")
      expect(task_list.list).to eq ["shower"]
    end
  end

  context "completing a task that doesn't exist" do
    it "fails" do
      task_list = TaskTracker.new
      task_list.add("shower")
      expect { task_list.complete("brush teeth") }.to raise_error "Task does not exist"
    end
  end
end