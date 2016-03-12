module Spotify
  class Resource
    def self.find(id : String)
      self.get(id, "tracks")
    end

    def self.get(id : String, resource : String)
      response = HTTP::Client.get("https://api.spotify.com/v1/#{resource}/#{id}")

      return from_json(JSON.parse(response.body))
    end
  end
end
