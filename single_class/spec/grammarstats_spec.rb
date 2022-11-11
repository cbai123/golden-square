require 'grammarstats'

RSpec.describe GrammarStats do
  
  describe "#check" do
    context "returns true" do
      it "Ends with ." do
        text = GrammarStats.new
        expect(text.check("Hello.")).to eq true
      end

      it "Ends with !" do
        text = GrammarStats.new
        expect(text.check("My name is Chris!")).to eq true
      end

      it "Ends with ?" do
        text = GrammarStats.new
        expect(text.check("What's yours?")).to eq true
      end
    end

    context "returns false" do
      it "No capital letter" do
        text = GrammarStats.new
        expect(text.check("hello.")).to eq false
      end

      it "No full stop" do
        text = GrammarStats.new
        expect(text.check("Hello")).to eq false
      end
    end
  end 

  describe "#percentage_good" do
    it "returns 100% after 1 successful check" do
      text = GrammarStats.new
      text.check("Hello.")
      expect(text.percentage_good).to eq 100
    end

    it "returns 0% after 1 failed check" do
      text = GrammarStats.new
      text.check("hello")
      expect(text.percentage_good).to eq 0
    end 

    it "returns 50% after 1 successful and 1 failed check" do
      text = GrammarStats.new
      text.check("Hello.")
      text.check("hello")
      expect(text.percentage_good).to eq 50
    end

    it "returns 33%" do
      text = GrammarStats.new
      text.check("hello")
      text.check("hello.")
      text.check("Hello.")
      expect(text.percentage_good).to eq 33
    end

    it "returns 66%" do
      text = GrammarStats.new
      text.check("hello")
      text.check("Chris!")
      text.check("Hello.")
      expect(text.percentage_good).to eq 66
    end
  end
end