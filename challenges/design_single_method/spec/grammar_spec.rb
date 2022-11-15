require 'grammar'

RSpec.describe "grammar method" do
  context "returns true when starts with capital letter and ends with punctuation" do
    it "One word, full stop" do
      expect(grammar("Hello.")).to eq true
    end
    
    it "Sentence, exclamation mark" do
      expect(grammar("Hello, my name is Chris!")).to eq true
    end

    it "question mark" do
      expect(grammar("What's yours?")).to eq true
    end
  end

  context "returns false" do
    it "Missing captial letter and punctuation" do
      expect(grammar("hello")).to eq false
    end

    it "missing capital letter" do
      expect(grammar ("hello, my name is Chris.")).to eq false
    end
    
    it "missing punctuation" do
      expect(grammar("Hello")).to eq false
    end
  end
end