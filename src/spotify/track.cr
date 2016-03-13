module Spotify
  class Track
    JSON.mapping({
      id: String,
      name: String,
      popularity: Int32,
      href: String
    })

    def self.find(id : String)
      response = HTTP::Client.get("https://api.spotify.com/v1/tracks/#{id}")

      return from_json(response.body)
    end
  end
end
