require 'grammarstats'

RSpec.describe GrammarStats do
  
  describe "#check" do
    context "returns true" do
      it "Hello." do
        text = GrammarStats.new
        expect(text.check("Hello.")).to eq true
      end

      it "My name is Chris!" do
        text = GrammarStats.new
        expect(text.check("My name is Chris.")).to eq true
      end
    end

    context "returns false" do
      it "hello." do
        text = GrammarStats.new
        expect(text.check("hello.")).to eq false
      end

      it "Hello" do
    end
  end

      
end