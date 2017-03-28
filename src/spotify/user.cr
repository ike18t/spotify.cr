require "./resource"

module Spotify
  class User < Resource
    @@resource = "users"
    @@requires_auth = true

    JSON.mapping({
      display_name:  String,
      external_urls: Hash(String, String),
      href:          String,
      id:            String,
      images:        Array(Image),
      uri:           String
    })
  end
end
