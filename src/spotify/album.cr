module Spotify
  class Album
    getter :id, :name, :popularity, :href
    JSON.mapping({
      id: String,
      name: String,
      popularity: Int32,
      href: String
    })

    def self.find(id : String)
      response = HTTP::Client.get("https://api.spotify.com/v1/albums/#{id}")

      return from_json(response.body)
    end
  end
end
