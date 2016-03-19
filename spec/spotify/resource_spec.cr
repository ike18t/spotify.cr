require "./../spec_helper"

class Foo < Spotify::Resource
  @@resource = "foos"
  JSON.mapping({
    id:    String,
    lorem: String,
  })
end

describe Spotify::Resource do
  let(response) { Fixture.load("foo.json") }

  context "when finding" do
    context "with valid params" do
      let(foo) { Foo.find("bar") }

      before do
        WebMock.stub(:get, "https://api.spotify.com/v1/foos/bar").to_return(response)
      end


      it "returns an instance of the resource" do
        expect(foo).to be_a(Foo)
      end

      it "populates data from json" do
        expect(foo.id).to eq("bar")
        expect(foo.lorem).to eq("ipsum")
      end
    end

    context "with invalid params" do
      let(foo) { Foo.find("invalid") }

      before do
        WebMock.stub(:get, "https://api.spotify.com/v1/foos/invalid").
          to_return(status: 500)
      end

      it "raises a generic exception when request is not successful" do
        expect{ foo }.to raise_error(Spotify::Exceptions::Generic)
      end
    end
  end
end
