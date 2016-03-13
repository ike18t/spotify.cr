module Spotify
  class Artist
    JSON.mapping({
      id: String,
      name: String,
      popularity: Int32,
      href: String,
      images: Array(Spotify::Image)
    })

    def self.find(id : String)
      response = HTTP::Client.get("https://api.spotify.com/v1/artists/#{id}")

      return from_json(response.body)
    end
  end
end
