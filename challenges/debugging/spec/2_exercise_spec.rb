require '2_exercise'

RSpec.describe "encode and decode methods" do

  context "encode method" do
    it "encodes correctly" do
      plaintext = "theswiftfoxjumpedoverthelazydog"
      key = "secretkey"
      ciphertext = "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
      expect(encode(plaintext,key)).to eq ciphertext
    end
  end

  context "decode method" do
    it "decodes correctly" do
      plaintext = "theswiftfoxjumpedoverthelazydog"
      key = "secretkey"
      ciphertext = "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
      expect(decode(ciphertext,key)).to eq plaintext
    end
  end
end