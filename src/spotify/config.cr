module Spotify
  class Config
    @@client_key = ""
    @@client_secret = ""

    def self.set_credentials(client_key : String, client_secret : String)
      @@client_key = client_key
      @@client_secret = client_secret
    end

    def self.get_client_key
      @@client_key
    end

    def self.get_client_secret
      @@client_secret
    end
  end
end
