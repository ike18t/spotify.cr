require "./../spec_helper"

class Foo < Spotify::Resource
  @@resource = "foos"
  JSON.mapping({
    id: String,
    lorem: String
  })
end

describe Spotify::Resource do
  let(response) { Fixture.load("foo.json") }

  before do
    WebMock.stub(:get, "https://api.spotify.com/v1/foos/bar").to_return(response)
  end

  context "when finding" do
    let(foo) { Foo.find("bar") }

    it "returns an instance of the resource" do
      expect(foo).to be_a(Foo)
    end

    it "populates data from json" do
      expect(foo.id).to eq("bar")
      expect(foo.lorem).to eq("ipsum")
    end
  end
end
