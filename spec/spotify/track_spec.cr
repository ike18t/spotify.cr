require "./../spec_helper"

describe Spotify::Track do
  response = Fixture.load("track.json")

  it "finds a track by id" do
    WebMock.stub(:get, "https://api.spotify.com/v1/tracks/0wJoRiX5K5BxlqZTolB2LD").to_return(response)
    track = Spotify::Track.find("0wJoRiX5K5BxlqZTolB2LD")

    track.name.should eq("Purple Haze")
  end

  context "when parsing from JSON" do
    track = Spotify::Track.from_json(response)

    it "populates the id" do
      track.id.should eq("0wJoRiX5K5BxlqZTolB2LD")
    end

    it "populates the name" do
      track.name.should eq("Purple Haze")
    end
  end
end
