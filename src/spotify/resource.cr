require "./resource"

module Spotify
  class Resource
    def self.find(id : String)
      response = HTTP::Client.get("https://api.spotify.com/v1/#{@@resource}/#{id}")
      
      raise Exceptions::Generic.new("Something went wrong") unless response.success?

      from_json(response.body)
    end
  end
end
