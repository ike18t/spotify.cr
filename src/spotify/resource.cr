require "./resource"

module Spotify
  class Resource
    API_URL = "https://api.spotify.com/v1"
    @@bearer_token = ""
    @@requires_auth = false

    def self.find(id : String, resource_path = @@resource)
      response = get "#{resource_path}/#{id}"
      from_json(response)
    end

    def self.get(path : String) : String
      url = [API_URL, path].join("/")
      response = HTTP::Client.get(url, authorization_headers)

      raise Exceptions::Generic.new("Something went wrong") unless response.success?
      response.body
    end

    def self.authorization_headers
      return nil unless @@requires_auth
      authenticate if @@bearer_token.empty?
      HTTP::Headers { "Authorization" => "Bearer #{@@bearer_token}" }
    end

    def self.authenticate
      authorization = Base64.strict_encode [Config.get_client_key, Config.get_client_secret].join(":")
      auth_header = HTTP::Headers { "Authorization" => "Basic #{authorization}", "Content-Type": "application/x-www-form-urlencoded" }

      response = HTTP::Client.post("https://accounts.spotify.com/api/token?grant_type=client_credentials", auth_header, "")
      raise Exceptions::Unauthorized.new("Unable to successfully request an auth ticket with the provided client credentials") unless response.success?
      @@bearer_token = JSON.parse(response.body)["access_token"].to_s
    end
  end
end
