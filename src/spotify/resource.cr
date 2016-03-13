require "./resource"

module Spotify
  class Resource
    def self.find(id : String)
      response = HTTP::Client.get("https://api.spotify.com/v1/#{@@resource}/#{id}")

      from_json(response.body)
    end
  end
end
