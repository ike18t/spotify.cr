require "./../spec_helper"

describe Spotify::Artist do
  let(response) { Fixture.load("artist.json") }

  before do
    WebMock.stub(:get, "https://api.spotify.com/v1/artists/776Uo845nYHJpNaStv1Ds4").to_return(response)
  end

  context "when finding" do
    let(artist) { Spotify::Artist.find("776Uo845nYHJpNaStv1Ds4") }

    it "finds an artist by id" do
      expect(artist.name).to eq("Jimi Hendrix")
    end
  end

  context "when parsing from JSON" do
    let(artist) { Spotify::Artist.from_json(response) }

    it "populates the id" do
      expect(artist.id).to eq("776Uo845nYHJpNaStv1Ds4")
    end

    it "populates the name" do
      expect(artist.name).to eq("Jimi Hendrix")
    end

    it "populates the popularity" do
      expect(artist.popularity).to eq(74)
    end

    it "populates the href" do
      expect(artist.href).to eq("https://api.spotify.com/v1/artists/776Uo845nYHJpNaStv1Ds4")
    end

    it "populates the images" do
      expect(artist.images.size).to eq(4)
      expect(artist.images).to be_a(Array(Spotify::Image))
    end
  end
end
