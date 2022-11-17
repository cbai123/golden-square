require 'cat_facts'

RSpec.describe CatFacts do
  it "returns a cat fact" do
    requester = double :requester

    expect(requester).to receive(:get).with(
      URI("https://catfact.ninja/fact")
    ).and_return('{"fact":"Unlike humans, cats do not need to blink their eyes on a regular basis to keep their eyes lubricated.","length":101}')
    fact = CatFacts.new(requester)
    expect(fact.provide).to eq "Cat fact: Unlike humans, cats do not need to blink their eyes on a regular basis to keep their eyes lubricated."
  end
end