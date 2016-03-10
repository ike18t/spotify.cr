require "./../spec_helper"

describe Spotify::Track do
  it "finds a track by id" do
    response = Fixture.load("track.json")
    WebMock.stub(:get, "https://api.spotify.com/v1/tracks/0wJoRiX5K5BxlqZTolB2LD").to_return(response)
    track = Spotify::Track.find("0wJoRiX5K5BxlqZTolB2LD")

    track.name.should eq("Purple Haze")
  end
end
