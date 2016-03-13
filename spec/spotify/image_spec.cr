require "./../spec_helper"

describe Spotify::Image do
  let(response) { Fixture.load("image.json") }
  let(image) { Spotify::Image.from_json(response) }

  context "when parsing from JSON" do
    it "populates the height" do
      expect(image.height).to eq(1500)
    end

    it "populates the width" do
      expect(image.width).to eq(1000)
    end

    it "populates the url" do
      expect(image.url).to eq("https://i.scdn.co/image/080183498389e920416d15d00b34f4c5dc4bbd0b")
    end
  end
end
