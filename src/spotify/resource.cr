require "./resource"

module Spotify
  class Resource
    def self.find(id : String)
      response = HTTP::Client.get("https://api.spotify.com/v1/#{@@resource}/#{id}")

      unless (200..299).includes?(response.status_code)
        raise Exceptions::Generic.new("Something went wrong")
      end

      from_json(response.body)
    end
  end
end
