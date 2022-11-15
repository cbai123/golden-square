require 'task_tracker'

RSpec.describe "task_tracker method" do
  context "returns true" do
    it "#TODO make breakfast" do
      expect(task_tracker("#TODO make breakfast")).to eq true
    end

    it "#TODO shower" do
      expect(task_tracker("#TODO shower")).to eq true
    end
  end

  context "returns false" do
    it "when given empty string" do
      expect(task_tracker("")).to eq false
    end

    it "when missing #" do
      expect(task_tracker("TODO brush teeth")).to eq false
    end

    it "when missing TODO" do
      expect(task_tracker("# eat lunch")).to eq false
    end
  end
end